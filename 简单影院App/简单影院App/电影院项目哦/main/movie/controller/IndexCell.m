//
//  IndexCell.m
//  电影院项目哦
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "IndexCell.h"
#import "UIImageView+WebCache.h"
@implementation IndexCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self creatView];
        
    }
    return self;
}

-(void)creatView{
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.95, self.frame.size.height*0.95)];
    
    _imageView.center=self.contentView.center;
    _imageView.hidden=NO;
    [self.contentView addSubview:_imageView];
    
}

-(void)setImages:(NSString *)images
{
    if (_images!=images) {
        _images=images;
    }
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_images] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
}

@end
