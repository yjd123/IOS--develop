//
//  XCFDiggUsers.h
//  XCF第一波
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XCFAuthor;

@interface XCFDiggUsers : NSObject

/** 显示的点赞用户数 默认返回5个 */
@property (nonatomic, assign) NSInteger count;
/** 点赞总人数 */
@property (nonatomic, copy) NSString *total;
/** 点赞用户数组 */
@property (nonatomic, strong) NSArray<XCFAuthor *> *users;




@end
