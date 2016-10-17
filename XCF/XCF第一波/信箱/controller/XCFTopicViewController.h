//
//  XCFTopicViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFTopicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *topicArray;
@property (nonatomic, strong) UITableView *tableView;
@end
