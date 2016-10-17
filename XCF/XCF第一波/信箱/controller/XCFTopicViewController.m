//
//  XCFTopicViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFTopicViewController.h"
#import "XCFTopic.h"
#import "XCFTopicCell.h"
#import "XCFTopicDetailController.h"

@interface XCFTopicViewController ()

@end

@implementation XCFTopicViewController

static NSString *const reuseIdentifier = @"topicCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主题";
    _topicArray = [NSMutableArray array];
    [self addRightButton];
    [self setupTableView];
    [self loadNewData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XCFTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.topic = self.topicArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XCFTopicDetailController *topicVC = [[XCFTopicDetailController alloc] init];
////    topicVC.topic = self.topicArray[indexPath.row];
////    
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:topicVC];
//    [self.navigationController presentViewController:nav animated:YES completion:NULL];
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 相当于每个单元格所对应的xcftopic 的类方法 cellheight
    
    return 110;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

#pragma mark - 网络请求

- (void)loadNewData {
    [[AFHTTPSessionManager manager] GET:XCFRequestTopic
                             parameters:nil
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    
                                    self.topicArray = [XCFTopic mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"topics"]];
                                    
                                    [self.tableView reloadData];
                                    
                                    [self.tableView.mj_header endRefreshing];
                                    
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    [self.tableView.mj_header endRefreshing];
                                }];
}


#pragma mark - 属性

- (void)setupTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = XCFGlobalBackgroundColor;
   
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XCFTopicCell class]) bundle:nil]
         forCellReuseIdentifier:reuseIdentifier];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                refreshingAction:@selector(loadNewData)];
}

-(void)addRightButton{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 45, 25);
    [rightButton setTitle:@"发主题" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:15];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}



-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}









@end
