//
//  XCFPopEvent.h
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFPopEvent : NSObject

// 早餐 ，午餐，晚餐 子数据

/** 作品数 */
@property (nonatomic, copy) NSString *n_dishes;
/** 导航id */
@property (nonatomic, copy) NSString *ID;
/** 导航标题 */
@property (nonatomic, copy) NSString *name;
/** 图片地址 */
@property (nonatomic, copy) NSString *thumbnail_280;





@end
