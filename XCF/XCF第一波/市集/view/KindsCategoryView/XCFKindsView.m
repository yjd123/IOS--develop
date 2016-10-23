//
//  XCFKindsView.m
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFKindsView.h"
#import "XCFStepper.h"

#import "XCFCartltem.h"
#import "XCFGoods.h"
#import "XCFGoodsKind.h"
#import "XCFReviewPhoto.h"

@implementation XCFKindsView{
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
}


-(void)awakeFromNib
{
    
    _footView=[[UIView alloc]initWithFrame:CGRectMake(0, 310, 320, 45)];
    _footView.layer.borderWidth=1.0;
    
    [self addSubview:_footView];

    // 添加计数器
    
    _stepper = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XCFStepper class])
                                              owner:nil options:nil] lastObject];
//    _stepper.enabled = NO;
    
    _stepper.frame=CGRectMake(200, 7, 100, 30);
    
    [_footView addSubview:_stepper];
    
    // 添加购买数量
    
    _buyNumber=[[UILabel alloc]init];
    
    [_footView addSubview:_buyNumber];
    
    [_buyNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.stepper.mas_centerY);
        make.left.equalTo(self.footView.mas_left);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    _buyNumber.text=@"购买数量";
    _buyNumber.font=[UIFont systemFontOfSize:14];
    _buyNumber.textAlignment=NSTextAlignmentCenter;
    
    // 中间tableView
    
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 110, self.frame.size.width, 250) style:UITableViewStyleGrouped];
    _table.backgroundColor=[UIColor clearColor];
    _table.delegate=self;
    _table.dataSource=self;
    [self addSubview:_table];
    
//    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_left);
//        make.right.equalTo(self.mas_right);
//        make.top.equalTo(self.mas_top).offset(90);
//        make.bottom.equalTo(self.mas_bottom).offset(-45);
//    }];
    
    _table.tableFooterView=_footView;

    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];

    [self.confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    
 

}

-(void)close{
    !self.dismissBlock ? :self.dismissBlock();
}

- (void)confirm {
    
    // 取出图片在窗口的位置
    CGRect wRect = [self.goodsImage convertRect:self.goodsImage.frame toView:nil];
    
    // 通过执行回调，在父控件执行动画
    !self.animationBlock ? : self.animationBlock(self.goodsImage.image, wRect);

    // 如果是购物车，就先购物车动画完成，再添加
    if (self.type == XCFKindsViewTypeCart) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        });
        
        !self.confirmBlock ? : self.confirmBlock();
        
    }
    // 如果是立即购买，直接回调
    else if (self.type == XCFKindsViewTypeOrder) {
        !self.confirmBlock ? : self.confirmBlock();
    }
    
}





- (void)setGoods:(XCFGoods *)goods {
    
    _goods=goods;

    NSString *url=goods.main_pic.url;
 
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:url]];
    
   NSArray *kind=goods.kinds;
    
    NSDictionary *kinds=kind[0];
    NSString *stock=[kinds objectForKey:@"stock"];

    self.stockLabel.text =[NSString stringWithFormat:@"库存%@件",stock];
    
    _stepper.stock=[stock integerValue];

    self.priceRangeLabel.text = [NSString stringWithFormat:@"¥ %.2f", [goods.display_price floatValue]];
    
    _selectedLabel.text=@"选择 款式分类";
    _selectedLabel.numberOfLines=0;
    
 
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"拉粑粑"];
//    //2.判断是否获取到单元格
//    if (!cell) {
        //3.如果没有则创建一个单元格
        UITableViewCell *cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"拉粑粑"];
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;
        
        cell.backgroundColor=[UIColor clearColor];
    if (indexPath.row==0) {
        label1=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 70, 35)];
//        label1.layer.borderWidth=1.0;
//         label1.layer.cornerRadius=10;
        label1.textColor=[UIColor redColor];
        [cell addSubview:label1];
    }else if (indexPath.row==1){
        label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 232, 35)];
        label2.layer.borderWidth=1.0;
        label2.layer.cornerRadius=10;
        label2.backgroundColor=XCFGlobalBackgroundColor;
        [cell addSubview:label2];
    }else if(indexPath.row==2){
        label3=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 210, 35)];
        label3.layer.borderWidth=1.0;
         label3.layer.cornerRadius=10;
        label3.backgroundColor=XCFGlobalBackgroundColor;
        [cell addSubview:label3];
    }else if(indexPath.row==3){
        label4=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 235, 35)];
        label4.layer.borderWidth=1.0;
        label4.layer.cornerRadius=10;
        label4.backgroundColor=XCFGlobalBackgroundColor;
        [cell addSubview:label4];
    }
        
    
   label1.text=@"款式分类";
    label2.text=@"限量升级款【送杯子，勺子]】";
    label3.text=@"免费体验款【可免费拍下】";
    label4.text=@"至尊享受版【价格翻高100倍】";
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//  if (indexPath.row==0){
//      
//        label2.backgroundColor=[UIColor redColor];
//      label3.backgroundColor=XCFGlobalBackgroundColor;
//      label4.backgroundColor=XCFGlobalBackgroundColor;
//      _selectedLabel.text=label2.text;
//      NSLog(@"%ld",indexPath.row);
//
//      
//    }else if(indexPath.row==1){
//      label3.backgroundColor=[UIColor redColor];
//        label2.backgroundColor=XCFGlobalBackgroundColor;
//        label4.backgroundColor=XCFGlobalBackgroundColor;
//       _selectedLabel.text=label3.text;
//        NSLog(@"%ld",indexPath.row);
//        
//    }else if(indexPath.row==2){
//       label4.backgroundColor=[UIColor redColor];
//        label3.backgroundColor=XCFGlobalBackgroundColor;
//        label2.backgroundColor=XCFGlobalBackgroundColor;
//       _selectedLabel.text=label4.text;
//        NSLog(@"%ld",indexPath.row);
//        
//    }else if(indexPath.row==3){
//        NSLog(@"%ld",indexPath.row);
//        
//    }
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}









@end
