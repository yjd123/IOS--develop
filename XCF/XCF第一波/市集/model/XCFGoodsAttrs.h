//
//  XCFGoodsAttrs.h
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFGoodsAttrs : NSObject

/** 下标 */
@property (nonatomic, assign) NSInteger index;
/** 说明 */
@property (nonatomic, copy) NSString *value;
/** 属性 */
@property (nonatomic, copy) NSString *name;


@end
