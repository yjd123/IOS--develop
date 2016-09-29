//
//  NewsCollectionViewCell.m
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "NewsCollectionViewCell.h"
#import "BaseImageViewController.h"
#import "NewsMessage.h"
#import "UIImageView+WebCache.h"
@implementation NewsCollectionViewCell

-(void)awakeFromNib
{
    
}

-(void)setMessage:(NewsMessage *)message
{
    _message=message;
    
    NSURL *url=[NSURL URLWithString:self.message.image];
    
    [_pictureImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
}









@end
