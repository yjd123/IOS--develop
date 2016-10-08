//
//  XCFBreakfastCell.h
//  XCF第一波
//
//  Created by admin on 16/10/3.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFBreakfast;

@interface XCFBreakfastCell : UICollectionViewCell


/** 数据 */
@property(nonatomic,strong)XCFBreakfast *food;
@property (weak, nonatomic) IBOutlet UIImageView *pictures;

@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *dishName;
@property (weak, nonatomic) IBOutlet UIButton *goodButton;

@property (weak, nonatomic) IBOutlet UILabel *isGoodNum;

@end
