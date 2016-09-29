//
//  MovieDetails.h
//  电影院项目哦
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class StarView;
@interface MovieDetails : UIView{
    
    __weak IBOutlet UILabel *_averageLabel;
    __weak IBOutlet UILabel *_yearLabel;
    __weak IBOutlet UILabel *_sourceLabel;
    __weak IBOutlet UIImageView *_pictureImageView;
    __weak IBOutlet UILabel *_titleLabel;
}

@property(nonatomic,strong)Movie *movie;

@property (weak, nonatomic) IBOutlet StarView *view;

@end
