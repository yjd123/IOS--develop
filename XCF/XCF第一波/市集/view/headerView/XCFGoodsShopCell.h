//
//  XCFGoodsShopCell.h
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFShop;
@interface XCFGoodsShopCell : UITableViewCell

@property(nonatomic,strong)XCFShop *shop;
@property (weak, nonatomic) IBOutlet UILabel *freeDelieveyDescLabel;

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalGoodsLabel;


@end
