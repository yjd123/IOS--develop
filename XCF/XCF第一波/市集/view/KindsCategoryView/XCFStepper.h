//
//  XCFStepper.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFStepper : UIView


@property (nonatomic, copy) void (^goodsNumberChangedBlock)(NSUInteger);    // 商品数量变化回调

@property (nonatomic, assign) NSUInteger stock;                             // 商品库存
@property (nonatomic, assign) BOOL enabled;   

@property (weak, nonatomic) IBOutlet UIButton *decreaseButton;

@property (weak, nonatomic) IBOutlet UIButton *increaseButton;
@property (weak, nonatomic) IBOutlet UILabel *stepValue;


@property (nonatomic, assign) NSUInteger number; // 购买数量

@end
