//
//  XCFBreakfast.h
//  XCF第一波
//
//  Created by admin on 16/10/3.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XCFAuthor;
@interface XCFBreakfast : NSObject


// 早餐 ，午餐，晚餐 数据

/** 作品数 */
@property (nonatomic, copy) NSString *n_dishes;
/** 图片 */
@property (nonatomic, copy) NSString *thumbnail_280;
/** 导航标题 */
@property (nonatomic, copy) NSString *name;
/** 描述 */
@property (nonatomic, copy) NSString *desc;

//* 最后评论
@property (nonatomic, strong) XCFAuthor *author;

@property (nonatomic, copy) NSString *npics;

@end
