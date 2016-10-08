//
//  XCFImage.m
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFImage.h"

@implementation XCFImage


- (CGFloat)height {
    return _height * (KScreenWidth / self.width);
}


@end
