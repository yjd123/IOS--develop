//
//  UIButton+Extension.m
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)


+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                                  title:(NSString *)title
                         titleLabelFont:(UIFont *)font
                             titleColor:(UIColor *)titleColor
                                 target:(id)target
                                 action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
     button.layer.cornerRadius = 5;
    //    button.clipsToBounds = clipsToBounds;
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


/**
 *  快速创建一个带边框的button
 *
 *  @param backgroundColor button背景颜色
 *  @param title           按钮title文字
 *  @param font            按钮title字体大小
 *  @param titleColor      按钮titleyanse
 *  @param target          target
 *  @param action          action
 *
 *  @return 创建好的button
 */
+ (UIButton *)borderButtonWithBackgroundColor:(UIColor *)backgroundColor
                                        title:(NSString *)title
                               titleLabelFont:(UIFont *)font
                                   titleColor:(UIColor *)titleColor
                                       target:(id)target
                                       action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];

    button.layer.borderWidth = 1.0;
    button.layer.borderColor = XCFThemeColor.CGColor;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


@end
