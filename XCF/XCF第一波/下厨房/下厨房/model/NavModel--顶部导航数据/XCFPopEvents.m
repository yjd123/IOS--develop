//
//  XCFPopEvents.m
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFPopEvents.h"
#import "XCFPopEvent.h"
@implementation XCFPopEvents

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"events" : [XCFPopEvent class]};
}

@end
