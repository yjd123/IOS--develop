//
//  XCFGoodsKind.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFGoodsKind : NSObject

/** 原价格 */
@property (nonatomic, assign) NSInteger original_price;
/** 现价 */
@property (nonatomic, assign) double price;
/** 库存 */
@property (nonatomic, assign) NSInteger stock;
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** ID */
@property (nonatomic, copy) NSString *ID;
/** 未知 */
@property (nonatomic, copy) NSString *serial_number;


@end
