//
//  XCFSearchViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFSearchFootView;
@class XCFSearchHeaderView;
@interface XCFSearchViewController : UITableViewController<UITabBarControllerDelegate,UITableViewDataSource>

@property(nonatomic,strong)XCFSearchBar *searchBar;

@property(nonatomic,copy)NSString *searchWords;

@property(nonatomic,copy)NSArray *typesArray;

@property(nonatomic,strong)XCFSearchHeaderView *header;

@property(nonatomic,strong)XCFSearchFootView *footer;

@end
