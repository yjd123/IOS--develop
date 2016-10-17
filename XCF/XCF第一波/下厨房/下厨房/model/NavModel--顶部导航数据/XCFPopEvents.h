//
//  XCFPopEvents.h
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XCFPopEvent;

@interface XCFPopEvents : NSObject

// 早餐 ，午餐，晚餐
/** 导航个数 */
@property (nonatomic, assign) NSInteger count;
/** 导航数据 */
@property (nonatomic, strong) NSArray<XCFPopEvent *> *events;


@end
