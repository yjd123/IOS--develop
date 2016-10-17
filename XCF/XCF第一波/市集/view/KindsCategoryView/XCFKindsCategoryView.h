//
//  XCFKindsCategoryView.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFCarltem,XCFKindsView,XCFGoods;

@interface XCFKindsCategoryView : UIView

@property (nonatomic, assign) XCFKindsViewType type;    // 弹框类型

@property (nonatomic, strong) XCFCarltem *item;        // 商品数据

@property (nonatomic, copy) void (^cancelBlock)();

@property (nonatomic, copy) void (^confirmBlock)(XCFCarltem *); // 确定回调，回传选择好的商品属性

@property (nonatomic, strong) XCFKindsView *kindsView;

@property(nonatomic,strong)XCFGoods *goods;

@end
