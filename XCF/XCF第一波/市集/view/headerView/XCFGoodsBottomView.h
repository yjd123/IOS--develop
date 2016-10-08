//
//  XCFGoodsBottomView.h
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFGoodsBottomView : UIView

@property(nonatomic,strong)void (^actionBlock)(NSInteger);

/** 店铺icon */
@property (nonatomic, strong) UIView *shopIcon;
/** 立即对话 */
@property (nonatomic, strong) UIView *shopTalk;

/** 左边按钮 */
@property (nonatomic, strong) UIButton *leftButton;
/** 右边按钮 */
@property (nonatomic, strong) UIButton *rightButton;


@end
