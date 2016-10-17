//
//  Common.h
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define MAXFLOAT    0x1.fffffep+127f

#define WeakSelf __weak typeof(self) weakSelf = self;


#define AppKey @"2560964654"

#define AppSecret @"44b29ff11dd4e476b9af936b47c5374e"

#define kSinaWeiboObject (((AppDelegate *)[UIApplication sharedApplication].delegate).sinaWeibo)

/**
 *  1.返回一个RGBA格式的UIColor对象
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/**
 *  2.返回一个RGB格式的UIColor对象
 */
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

#define XCFGlobalBackgroundColor RGB(245, 240, 215)     // 背景颜色
#define XCFLabelColorWhite RGB(255, 255, 255)           // 字体颜色：白色
#define XCFLabelColorGray [UIColor grayColor]           // 字体颜色：灰色
#define XCFCoverViewColor RGBA(0, 0, 0, 0.2)            // 黑色半透明遮盖
#define XCFTabBarNormalColor RGB(170, 170, 170)         // TabBar颜色
#define XCFThemeColor RGB(249, 103, 80)        // TabBar选中颜色
#define XCFSearchBarTintColor RGB(192, 192, 192)        // 搜索按钮背景色
#define XCFDishViewBackgroundColor RGB(235, 235, 226)   // 作品view背景色
#define XCFAddressCellColor RGB(215, 228, 225)          // 收货地址选中颜色


#endif /* Common_h */
