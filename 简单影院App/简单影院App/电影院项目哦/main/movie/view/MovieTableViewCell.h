//
//  MovieTableViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Movie;
@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *PictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet StarView *starImageView;

@property(nonatomic,strong)Movie *movie;

@end
