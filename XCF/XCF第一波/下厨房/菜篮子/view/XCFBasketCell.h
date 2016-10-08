//
//  XCFBasketCell.h
//  XCF第一波
//
//  Created by admin on 16/9/24.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFBasketModel;
@interface XCFBasketCell : UITableViewCell


@property(nonatomic,strong)XCFBasketModel *data;
//@property(nonatomic,copy)UILabel *foodName;
//@property(nonatomic,copy)UILabel *amount;

@property (weak, nonatomic) IBOutlet UILabel *foodName;

@property (weak, nonatomic) IBOutlet UILabel *amount;


@end
