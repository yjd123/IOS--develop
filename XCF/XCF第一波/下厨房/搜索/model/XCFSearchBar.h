//
//  XCFSearchBar.h
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFSearchBar : UISearchBar<UISearchBarDelegate>
//点击的时候回调
@property(nonatomic,copy)void (^SearchBarShouldEditingBlock)();
//值改变时回调
@property(nonatomic,copy)void (^SearchBarTextDidChangedBlock)();

// 搜索时回调
@property(nonatomic,copy)void (^SearchBarTextDidSearchBlock)();

+(XCFSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder;


@end
