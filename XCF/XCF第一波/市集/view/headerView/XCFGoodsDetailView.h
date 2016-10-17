//
//  XCFGoodsDetailView.h
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFGoods;
@interface XCFGoodsDetailView : UIView
@property (weak, nonatomic) IBOutlet UILabel *freightLabel;
@property (weak, nonatomic) IBOutlet UILabel *oringinPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UILabel *averageRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthSaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalSaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *forewordLabel;

@property(nonatomic,strong)XCFGoods *goods;

@property (weak, nonatomic) IBOutlet UIButton *getPromotion;

@property (weak, nonatomic) IBOutlet UILabel *announcementLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsDesc;

@end
