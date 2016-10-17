//
//  XCFViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFKitchenHeader,XCFNavContent;
@interface XCFViewController : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) XCFKitchenHeader *kitchenHeader;  // 顶部导航View
@property (nonatomic, strong) XCFNavContent *navContent;        // 导航数据
@property (nonatomic, strong) NSMutableArray *feedsArray;       // 动态数据
@property(nonatomic,strong)NSMutableArray *issuesArray;    // 菜谱数据
@property(nonatomic,strong)UITableView *table;

@end
