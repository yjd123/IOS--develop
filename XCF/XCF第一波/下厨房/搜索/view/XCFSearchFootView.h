//
//  XCFSearchFootView.h
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFSearchFootView : UIView

@property(nonatomic,strong)NSMutableArray *keyWords;   // 流行搜词

@property(nonatomic,copy)void(^searchCallBack)(NSUInteger);  // 流行词语的搜索

@property(nonatomic,strong)NSMutableArray *buttonWords;

@end
