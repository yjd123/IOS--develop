//
//  XCFContent.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFIssues;

@interface XCFContent : NSObject
/** 菜谱组数 */
@property (nonatomic, assign) NSUInteger count;
/** 菜谱数据 */
@property (nonatomic, strong) NSArray<XCFIssues *> *issues;
@end
