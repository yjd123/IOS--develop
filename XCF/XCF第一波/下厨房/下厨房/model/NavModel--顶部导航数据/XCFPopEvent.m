//
//  XCFPopEvent.m
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFPopEvent.h"

@implementation XCFPopEvent

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id",
             @"thumbnail_280" : @"dishes.dishes[0].thumbnail_280"};
}


@end
