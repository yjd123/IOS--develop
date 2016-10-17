//
//  XCFCartltem.m
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFCartltem.h"
#import "XCFGoods.h"

@implementation XCFCartltem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"goods"     : @"commodity.goods",
             @"kind_name" : @"commodity.kind_name",
             @"number"    : @"commodity.number"};
}


@end
