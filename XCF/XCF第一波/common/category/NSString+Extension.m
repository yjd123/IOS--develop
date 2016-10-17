//
//  NSString+Extension.m
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(CGSize)getSizeWithTextSize:(CGSize)size fontSize:(CGFloat)fontSize
{
    CGSize resultSize=[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return resultSize;
}

@end
