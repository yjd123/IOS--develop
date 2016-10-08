//
//  XCFTopNavImageView.h
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFTopNavImageView : UIImageView

/** coverView */
@property (nonatomic, copy) UIImageView *popImage;
/** 标题 */
@property (nonatomic, copy) UILabel *titleLabel;


+(nonnull XCFTopNavImageView *)imageViewWithTitle:(nonnull NSString *)title target:(nullable id)target action:(nullable SEL)action;


@end
