//
//  BaseTabBarItem.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "BaseTabBarItem.h"

@implementation BaseTabBarItem

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName label:(NSString *)lab
{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4, 5, 27, 27)];
        imageView.image=[UIImage imageNamed:imageName];
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/4, 35, 27, 10)];
        label.text=lab;
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:12];
        label.textAlignment=NSTextAlignmentCenter;
        [self addSubview:imageView];
        [self addSubview:label];
    }
    return self;

}


@end
