//
//  XCFIssues.m
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFIssues.h"
#import "XCFItems.h"
@implementation XCFIssues

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[XCFItems class]};
}


@end
