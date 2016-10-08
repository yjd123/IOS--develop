//
//  XCFFeedViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XCFFeedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSMutableArray *feedsArray;       // 动态数据
//@property(nonatomic,strong)NSMutableArray *issuesArray;    // 菜谱数据

@property(nonatomic,copy)UITableView *table;



@end
