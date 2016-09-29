//
//  PosterCollectionViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class MovieDetails;
@interface PosterCollectionViewCell : UICollectionViewCell{
    UIImageView *_pictureImageView;
   
    BOOL left;
    NSMutableArray *_data;
    
    UIImageView *_medImageView;
    UILabel *_titleLabel;
    UILabel *_orginTitleLabel;
    UILabel *_yearLabel;
}
@property(nonatomic,strong)Movie *message;

@property(nonatomic,strong)MovieDetails *detailView;

@property(nonatomic,assign)BOOL isFlip;

-(void)flipCell;


@end
