//
//  XCFNavContent.h
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFPopEvents,XCFNav;

@interface XCFNavContent : NSObject

// 总的数据

/** 早餐午餐晚餐数据 */
@property (nonatomic, strong) XCFPopEvents *pop_events;
/** 导航按钮数据 */
@property (nonatomic, strong) NSArray<XCFNav *> *navs;
/** 菜谱导航图片 */
@property (nonatomic, copy) NSString *pop_recipe_picurl;


@end
