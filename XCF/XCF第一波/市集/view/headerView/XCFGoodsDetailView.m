//
//  XCFGoodsDetailView.m
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsDetailView.h"
#import "XCFGoods.h"
#import "XCFShop.h"

@implementation XCFGoodsDetailView


-(void)awakeFromNib
{
    
}


-(void)setGoods:(XCFGoods *)goods
{
    _goods=goods;

    
    
    _averageRateLabel.text=[NSString stringWithFormat:@"评分 %.1lf",goods.average_rate];
    
    _monthSaleLabel.text=[NSString stringWithFormat:@"月销 %@",goods.recent_30days_sales_volume];
     
    _totalSaleLabel.text=[NSString stringWithFormat:@"总销量 %@",goods.total_sales_volume];

    
    _forewordLabel.text=goods.foreword;
    
    _nameLabel.text=goods.name;
    
    _displayPriceLabel.text = [NSString stringWithFormat:@"¥ %@0", goods.display_price];

    _freightLabel.text = goods.display_freight;
    
    NSString *originPriceString = [NSString stringWithFormat:@"¥ %@0", goods.display_original_price];
    NSMutableAttributedString *attrsStr=[[NSMutableAttributedString alloc]initWithString:originPriceString];
    
    [attrsStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, originPriceString.length)];
    
    self.oringinPriceLabel.attributedText=attrsStr;
    
    UIButton *button=[UIButton borderButtonWithBackgroundColor:[UIColor whiteColor]
                                                         title:@"首单优惠" titleLabelFont:[UIFont systemFontOfSize:13]
                                                    titleColor:[UIColor redColor]
                                                        target:self
                                                        action:@selector(buttonAction)];
    button.frame=CGRectMake(10, 228, 75, 26);
    [self addSubview:button];

    _announcementLabel.text=goods.shop.announcement;
   
    
    _goodsDesc.text=goods.desc;
    
    
}


-(void)buttonAction{
    
}









@end
