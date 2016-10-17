//
//  ImageScrollView.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        
        _imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        [self addSubview:_imageView];
        
      
        
        self.maximumZoomScale=4.0;
        self.minimumZoomScale=1.0;
        
        self.showsHorizontalScrollIndicator=NO;
        self.showsHorizontalScrollIndicator=NO;
        
        self.delegate=self;
        
        UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2Action:)];
        
        tap2.numberOfTapsRequired=2;
        
        [self addGestureRecognizer:tap2];
        
        UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1Action:)];
        
        tap1.numberOfTapsRequired=1;
        
        [self addGestureRecognizer:tap1];
        
        [tap1 requireGestureRecognizerToFail:tap2];
        
    }
    return self;
}

-(void)tap1Action:(UITapGestureRecognizer *)tap1
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tap" object:self];
}


-(void)tap2Action:(UITapGestureRecognizer *)tap2
{
    if (self.zoomScale>1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else {
        [self setZoomScale:2.0 animated:YES];
    }
}



-(void)setPicture:(NSString *)picture
{
    if (_picture!=picture) {
        _picture=picture;
    }
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_picture]];
}




-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}

@end
