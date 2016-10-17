//
//  ImageCollectionViewCell.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "ImageScrollView.h"

@implementation ImageCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _scrollView=[[ImageScrollView alloc]initWithFrame:self.bounds];
        
        _scrollView.backgroundColor=[UIColor blackColor];
        
        
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
