//
//  XCFFeedViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFFeedViewController.h"
#import "XCFUpLoadViewController.h"
#import "XCFDishs.h"
#import "XCFFeed.h"
#import "XCFFeedsCell.h"
#import "XCFPicture.h"
@interface XCFFeedViewController ()

@end

@implementation XCFFeedViewController

static NSString *CellIdentifier = @"XCFRecipeCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_table];
    _table.delegate=self;
    _table.dataSource=self;
   
    [self loadNav];
    [self setUpRefresh];
    [self loadData];
    
    self.title=@"关注动态";
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
}


-(void)setUpRefresh
{
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    _table.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(void)loadData{
 [_table.mj_footer endRefreshing];
    
    // 关注动态数据
    [self.manager GET:XCFRequestKitchenFeeds
           parameters:nil
             progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                 self.feedsArray = [XCFFeed mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"feeds"]];
                 
                 [_table reloadData];
            
                 [_table.mj_header endRefreshing];
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"加载失败了，呜呜......");
             }];
    
}

-(void)loadMoreData{
    [_table.mj_header endRefreshing];
    
   
    // 关注动态数据
    [self.manager GET:XCFRequestKitchenFeeds
           parameters:nil
             progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                NSArray *array  = [XCFFeed mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"feeds"]];
                 
                 [ self.feedsArray addObjectsFromArray:array];
                 
                 [_table reloadData];
                 
                 [_table.mj_footer endRefreshing];
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"加载失败了，呜呜......");
             }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.feedsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCFFeedsCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell ) { //如果没有可重用的单元格，则新建一个单元格。
        
        cell = [[XCFFeedsCell alloc ]
                
                initWithStyle : UITableViewCellStyleDefault
                
                reuseIdentifier :CellIdentifier];
        
    }
     cell.backgroundColor=XCFGlobalBackgroundColor;
    
    cell.dish=[self.feedsArray[indexPath.section] dish];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 250)];
   
    XCFDishs *dish=[self.feedsArray[section] dish];
    
    UIImageView *mainImage=[[UIImageView alloc]initWithFrame:scroll.bounds];
    
    NSString *imageMain=[dish.main_pic objectForKey:@"600"];
    
    [mainImage sd_setImageWithURL:[NSURL URLWithString:imageMain]];
    
    [scroll addSubview:mainImage];
    
    NSArray *picture=dish.extra_pics;
    
    
    for ( int i=0;i< picture.count;i++) {
        NSDictionary *pictures=picture[i];
        NSString *string=[pictures objectForKey:@"600"];
    UIImageView *extraImage=[[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth*i, 0,KScreenWidth , 250)];
        [extraImage sd_setImageWithURL:[NSURL URLWithString:string]];
        [scroll addSubview:extraImage];
    }
     scroll.pagingEnabled = YES;
     scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
     scroll.contentSize = CGSizeMake(picture.count*KScreenWidth, 250);
    return scroll;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 250;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    
    view.backgroundColor=XCFGlobalBackgroundColor;
    
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(43, 3, 33, 33)];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(90, 8, 25, 25)];
    
    [button1 setBackgroundImage:[UIImage imageNamed:@"dishPagerLike"] forState:UIControlStateNormal];
    
     [button1 setBackgroundImage:[UIImage imageNamed:@"dishPagerLiked"] forState:UIControlStateSelected];
    
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
     [button2 setBackgroundImage:[UIImage imageNamed:@"tabCDeselected"] forState:UIControlStateNormal];
    
    [view addSubview:button1];
    [view addSubview:button2];
    
    return view;
}

-(void)buttonAction:(UIButton *)button
{
    button.selected=!button.selected;

}









-(void)loadNav{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"creatdishicon"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(upLoadAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
}

-(void)upLoadAction{
    XCFUpLoadViewController *upload=[[XCFUpLoadViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:upload];
    [self presentViewController:nav animated:YES completion:NULL];
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}


-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}

@end
