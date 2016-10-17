//
//  XCFContent.m
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFContent.h"
#import "XCFIssues.h"
@implementation XCFContent

+(NSDictionary *)mj_objectClassInArray{
    return @{@"issues":[XCFIssues class]};
}

@end
