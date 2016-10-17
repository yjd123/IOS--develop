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
//        // 确认回调
//        _kindsView.confirmBlock = ^(XCFCartltem *item) {
//            // 传递数据给控制器
//            !weakSelf.confirmBlock ? : weakSelf.confirmBlock(item);
//            [weakSelf dismiss];
//        };
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
