//
//  ImageCollectionViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageScrollView;
@interface ImageCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)ImageScrollView *scrollView;

@property(nonatomic,copy)NSString *images;


@end
