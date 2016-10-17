//
//  XCFGoodsReviewCell.h
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFReview;
@interface XCFGoodsReviewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *foodPictures;
@property(nonatomic,copy)UIImageView *authorPhoto;

@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@property(nonatomic,strong)XCFReview *review;

@end
