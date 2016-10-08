//
//  XCFFeed.h
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XCFDishs,XCFEvents;
@interface XCFFeed : NSObject

/** 菜单详情 */
@property (nonatomic, strong) XCFDishs *dish;
/** events */
@property (nonatomic, strong) XCFEvents *events;
/** 类型 */
@property (nonatomic, assign) NSInteger kind;
/** id */
@property (nonatomic, copy) NSString *ID;
/** 评论数 */
@property (nonatomic, assign) NSInteger ncomment;



@end
