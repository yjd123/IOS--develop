//
//  ImageCollectionViewCell.m
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "ImageScrollView.h"
@implementation ImageCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _scrollView=[[ImageScrollView alloc]initWithFrame:self.bounds];
        
     

        [self addSubview:_scrollView];
    }
    return self;
}


-(void)setImages:(NSString *)images
{
    _images=images;
    
    _scrollView.picture=images;
}






@end
