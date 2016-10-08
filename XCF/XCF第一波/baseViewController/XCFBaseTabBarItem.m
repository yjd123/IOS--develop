//
//  XCFBaseTabBarItem.m
//  XCF第一波
//
//  Created by admin on 16/9/17.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFBaseTabBarItem.h"

@implementation XCFBaseTabBarItem

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)titleName
{
    self=[super initWithFrame:frame];
    if (self!=nil) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 25)/2, 5, 24, 26)];
        imageView.image = [UIImage imageNamed:imageName];
        //设置图片内容模式，默认情况下拉伸填充
        //改为原图填充
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        //    CGFloat maxY = CGRectGetMaxY(imageView.frame);
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 29, frame.size.width, 20)];
        //设置label的内容
        titleLabel.text = titleName;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:titleLabel];
    }
    return self;
    
}


@end
