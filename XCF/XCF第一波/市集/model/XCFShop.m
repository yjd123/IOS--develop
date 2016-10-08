//
//  XCFShop.m
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFShop.h"

@implementation XCFShop


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"shop_logo_url" : @"shop_logo.url",
             @"shop_icon_url" : @"shop_icon.url",
             @"ID" : @"id"};
}


@end
