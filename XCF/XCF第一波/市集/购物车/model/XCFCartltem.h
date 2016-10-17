//
//  XCFCartltem.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XCFGoods;

@interface XCFCartltem : NSObject


@property (nonatomic, assign) XCFCartItemState state;       // 商品是否被选中
@property (nonatomic, strong) XCFGoods *goods;              // 商品
@property (nonatomic, copy)   NSString *kind_name;          // 种类名称
@property (nonatomic, assign) NSUInteger number;            // 购买数量
@property (nonatomic, assign) double displayPrice;          // 对应显示价格
@property (nonatomic, assign) double displayOriginPrice;    // 对应原始价格价格

@end
