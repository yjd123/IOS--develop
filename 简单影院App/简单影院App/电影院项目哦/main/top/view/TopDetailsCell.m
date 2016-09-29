//
//  TopDetailsCell.m
//  电影院项目哦
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "TopDetailsCell.h"
#import "UIImageView+WebCache.h"
@implementation TopDetailsCell


-(void)awakeFromNib{
    
}


-(void)setPicture:(NSString *)picture
{
    if (_picture!=picture) {
        _picture=picture;
    }
    [_pictures sd_setImageWithURL:[NSURL URLWithString:_picture] placeholderImage:[UIImage imageNamed:@"pig"]];
    
}


@end
