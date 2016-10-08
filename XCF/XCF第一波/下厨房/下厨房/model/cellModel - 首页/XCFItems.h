//
//  XCFItems.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFContents;

@interface XCFItems : NSObject
/** 发布日期 */
@property (nonatomic, copy) NSString *publish_time;
/** 网页URL */
@property (nonatomic, copy) NSString *url;
/** 模板 */
@property (nonatomic, assign) NSUInteger template;
/** id */
@property (nonatomic, copy) NSString *ID;
/** 模板内容 */
@property (nonatomic, strong) XCFContents *contents;
/** 未知 */
@property (nonatomic, copy) NSString *column_name;

/** cellHeight */
@property (nonatomic, assign) CGFloat cellHeight;




@end
