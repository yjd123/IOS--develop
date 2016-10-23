//
//  XCFKindsCategoryView.m
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFKindsCategoryView.h"
#import "XCFKindsView.h"

#import "XCFCartltem.h"
#import "XCFGoods.h"

#import "AlipayOrder.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation XCFKindsCategoryView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
        
     
        
        // 商品分类view
        _kindsView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XCFKindsView class])
                                                    owner:nil options:nil] lastObject];
        
        
//       [_kindsView mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.left.equalTo(self);
//           make.right.equalTo(self);
//           make.bottom.equalTo(self);
//           make.height.mas_equalTo(@(401));
//       }];
        
        _kindsView.frame=CGRectMake(0, 168, 320, 400);
         [self addSubview:_kindsView];
        
        WeakSelf;
        // 确认回调
        _kindsView.confirmBlock = ^() {
            // 传递数据给控制器
         
            [weakSelf confirm];
        };
        // 取消回调
        _kindsView.dismissBlock = ^{
            [weakSelf dismiss];
        };
        // 动画回调
        _kindsView.animationBlock = ^(UIImage *image, CGRect rect) {
            // 加入购物车才有动画
            if (weakSelf.type == XCFKindsViewTypeOrder) return;
            
            // 添加临时作动画的图片
            UIImageView *animateImage = [[UIImageView alloc] initWithImage:image];
            animateImage.frame = rect;
            [weakSelf addSubview:animateImage];
            
            // 位移
            CABasicAnimation *translateAni = [CABasicAnimation animationWithKeyPath:@"position"];
            translateAni.fromValue = [NSValue valueWithCGPoint:rect.origin];
            translateAni.toValue = [NSValue valueWithCGPoint:CGPointMake(KScreenWidth-60, 60)];
            translateAni.removedOnCompletion = YES;
            // 形变
            CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            scaleAni.fromValue = [NSNumber numberWithFloat:1.0];
            scaleAni.toValue = [NSNumber numberWithFloat:0.3];
            scaleAni.removedOnCompletion = YES;
            // 旋转
            CABasicAnimation *rotateAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            rotateAni.fromValue = [NSNumber numberWithFloat:0];
            rotateAni.toValue = [NSNumber numberWithFloat:2*M_PI];
            rotateAni.repeatCount = 3;
            rotateAni.removedOnCompletion = YES;
            // 组合
            CAAnimationGroup *aniGroup = [CAAnimationGroup animation];
            aniGroup.animations = @[translateAni, scaleAni, rotateAni];
            aniGroup.duration = 1;
            [animateImage.layer addAnimation:aniGroup forKey:nil];
            
            // 动画结束后移除
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [animateImage removeFromSuperview];
            });
        };
        
       
    }
    return self;
}

-(void)confirm{
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"partner";
    NSString *seller = @"seller";
    NSString *privateKey = @"privateKey";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    AlipayOrder *order = [[AlipayOrder alloc] init];
    order.partner = partner;
    order.sellerID = seller;
    order.outTradeNO = @"1234567890"; //订单ID（由商家自行制定）
    order.subject = @"水泵不错哦TT"; //商品标题
    order.goodsType = @"很好用啊"; //商品描述
    order.totalFee =@"0.01"; //商品价格
    order.notifyURL =  @"http://www.baidu.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showURL = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    //  id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = @"xxxxxxxxx_sign";
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        //需要在发送支付请求之前加上这句话
        NSArray *array = [[UIApplication sharedApplication] windows];
        UIWindow * win=[array objectAtIndex:0];
        [win setHidden:NO];
        
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}


- (void)setGoods:(XCFGoods *)goods{
    _goods=goods;
    _kindsView.goods=goods;
}


#pragma mark - 事件处理

- (void)dismiss {
    // 消失动画
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, KScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        !self.cancelBlock ? : self.cancelBlock();
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}



@end
