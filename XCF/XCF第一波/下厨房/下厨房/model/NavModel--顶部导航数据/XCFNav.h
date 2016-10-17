//
//  XCFNav.h
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFNav : NSObject

// 4个button数据

/** 导航跳转URL */
@property (nonatomic, copy) NSString *url;
/** 导航标题 */
@property (nonatomic, copy) NSString *name;
/** 图片地址 */
@property (nonatomic, copy) NSString *picurl;



@end
