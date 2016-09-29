//
//  TopCollectionViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class TopModel;
@interface TopCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picturesImageView;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet StarView *starView;

@property(nonatomic,strong)TopModel *model;


@end
