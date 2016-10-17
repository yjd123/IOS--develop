//
//  XCFGoodsShopCell.m
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsShopCell.h"
#import "XCFShop.h"
@implementation XCFGoodsShopCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIButton *goShoppingButton = [UIButton borderButtonWithBackgroundColor:XCFLabelColorWhite
                                                            title:@"去逛逛"
                                                   titleLabelFont:[UIFont systemFontOfSize:16]
                                                       titleColor:XCFThemeColor
                                                           target:self
                                                           action:@selector(goShopping)];
    
    goShoppingButton.frame=CGRectMake(15, 58, 290, 35);
    
    [self.contentView addSubview:goShoppingButton];
}


-(void)setShop:(XCFShop *)shop{
    
    _shop=shop;
    
    [self.logoView sd_setImageWithURL:[NSURL URLWithString:shop.shop_logo_url]];
    self.nameLabel.text = shop.name;
    self.totalGoodsLabel.text = [NSString stringWithFormat:@"商品数:%@",shop.goods_count];
    self.freeDelieveyDescLabel.text = shop.free_delivery_desc;
}


- (void)goShopping {
    
}




@end
