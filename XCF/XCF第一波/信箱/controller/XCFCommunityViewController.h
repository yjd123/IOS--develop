//
//  XCFCommunityViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFForum;

@interface XCFCommunityViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XCFForum *forums; // 市集讨论区
@property (nonatomic, strong) XCFForum *shouts; // 周边

@end
