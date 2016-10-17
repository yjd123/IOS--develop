//
//  XCFViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFViewController.h"
#import "UpLoadFoodViewController.h"   // 上传菜谱
#import "XCFUpLoadViewController.h"   // 上传作品
#import "XCFNavigationController.h"   //  导航栏
#import "XCFSearchViewController.h"   // 搜索
#import "XCFBasketViewController.h"  // 菜篮子
#import "XCFKitchenHeader.h"         //顶部导航 头视图
#import "XCFRecipeCell.h"           // cell 子类化
#import "XCFFeedViewController.h"    // 关注动态
#import "XCFBreakfastViewController.h"    // 早餐的界面
#import "XCFRequestKitchenTopList.h"   // 排行榜
#import "XCFRequestKitchenTalk.h"     // 厨房问答
#import "XCFRequestKitchenRecipeCategory.h"   // 菜谱分类
#import "XCFRequestKitchenBuy.h"   // 买烘焙
#import "XCFRequestKitchenPopulars.h"   // 流行菜谱
#import "XCFKitchenTalk.h"         // cell 聊天
#import "XCFCellRecipeList.h"      // cell 菜单
#import "XCFRecipeViewController.h"   // cell 菜谱



#import "XCFNavContent.h"
#import "XCFFeed.h"
#import "XCFDishs.h"
#import "XCFContent.h"
#import "XCFIssues.h"
#import "XCFItems.h"


@interface XCFViewController ()

@end

@implementation XCFViewController


static NSString *CellIdentifier = @"XCFRecipeCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    _table.backgroundColor=XCFGlobalBackgroundColor;
    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_table];
    _table.showsVerticalScrollIndicator = NO;
    _table.delegate=self;
    _table.dataSource=self;

    
    [self _loadLeftButton];
    [self _loadRightButton];
    [self setUpNavigationBar];
    [self loadHeaderViewData];
    [self setUpRefresh];
    [self loadCellData];
    [self setUpTableViewHeaderView];
    
   
}

-(void)setUpTableViewHeaderView{
    
    // 顶部导航视图（流行菜谱、关注动态）高度 + 导航按钮高度 + 三餐导航按钮高度
    CGFloat headerHight=300;
    _kitchenHeader=[[XCFKitchenHeader alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, headerHight)];
    _kitchenHeader.navContent=_navContent;
    _table.tableHeaderView=_kitchenHeader;
    
    WeakSelf;
    
    self.kitchenHeader.clickBlock=^(NSInteger clickAction)
    {
       
        if (clickAction==viewDidClickedActionFeedsView) {            // 关注动态
            XCFFeedViewController *feed=[[XCFFeedViewController alloc]init];
            UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:feed];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];
        } else if (clickAction==viewDidClickedActionPopRecipeView) {            // 流行菜谱
            XCFRequestKitchenPopulars *pop=[[XCFRequestKitchenPopulars alloc]init];
            UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:pop];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];
        }
        else if (clickAction==viewDidClickedActionTopListButton){      // 排行榜
            XCFRequestKitchenTopList *toplist=[[XCFRequestKitchenTopList alloc]init ];
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:toplist];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];
           
            
        }else if(clickAction==viewDidClickedActionRecipeCategoryButton){   // 菜谱分类
            
            XCFRequestKitchenRecipeCategory *recipe=[[XCFRequestKitchenRecipeCategory alloc]init];
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:recipe];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];
          
            
        }else if(clickAction==viewDidClickedActionBuyButton){      // 买烘焙
            
            XCFRequestKitchenBuy *buy=[[XCFRequestKitchenBuy alloc]init];
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:buy];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];

            
        }else if(clickAction==viewDidClickedActionTalkButton){      // 厨房问答
            
            XCFRequestKitchenTalk *talk=[[XCFRequestKitchenTalk alloc]init];
            
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:talk];
            [weakSelf presentViewController:nav1 animated:YES completion:NULL];
  
            
        }else if (clickAction == viewDidClickedActionBreakfast
                  || clickAction == viewDidClickedActionLunch       // 三餐
                  || clickAction == viewDidClickedActionSupper)
        {
            XCFBreakfastViewController *breakFast=[[XCFBreakfastViewController alloc]init];
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:breakFast];
            [weakSelf presentViewController:nav animated:YES completion:NULL];
        }
    };
    
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _issuesArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    XCFIssues *issues=_issuesArray[section];
    NSInteger count=issues.items_count;
    return count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    XCFRecipeCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if (!cell ) { //如果没有可重用的单元格，则新建一个单元格。
        
        cell = [[XCFRecipeCell alloc ]
                
                initWithStyle : UITableViewCellStyleDefault
                
                reuseIdentifier :CellIdentifier];
        
    }
    cell.backgroundColor=[UIColor clearColor];
    XCFIssues *issues=_issuesArray[indexPath.section];
  
    XCFItems *item=issues.items[indexPath.row];
    cell.items=item;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCFIssues *issues=_issuesArray[indexPath.section];
    XCFItems *item=issues.items[indexPath.row];
    

    return item.cellHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    XCFIssues *issues=_issuesArray[section];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 25)];
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=issues.title;
    return label;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XCFIssues *issues = self.issuesArray[indexPath.section];
    XCFItems *item = issues.items[indexPath.row];
    
    if (item.template == XCFCellTemplateTopic || item.template == XCFCellTemplateWeeklyMagazine || item.template == XCFCellTemplatewhisper) { // 帖子、周刊
        [self pushWebViewWithURL:item.url];
    }
    else if (item.template == XCFCellTemplateRecipeList) { // 菜单
        XCFCellRecipeList *recipeList=[[XCFCellRecipeList alloc]init];
        recipeList.items=item;
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:recipeList];
        [self presentViewController:nav1 animated:YES completion:NULL];
        
    }
    else if (item.template == XCFCellTemplateTalk) { // 聊天
        XCFKitchenTalk *talk=[[XCFKitchenTalk alloc]init];
        talk.items=item;
        
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:talk];
        [self presentViewController:nav1 animated:YES completion:NULL];
    }
    else if (item.template == XCFCellTemplateRecipe) { // 菜谱
        XCFRecipeViewController *recipe=[[XCFRecipeViewController alloc]init];
        recipe.items=item;
        
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:recipe];
        [self presentViewController:nav1 animated:YES completion:NULL];
    }
    
}



#pragma mark -  网络请求

// 网络：加载cell数据

-(void)loadCellData{
    [_table.mj_footer endRefreshing];
    [self.manager GET:XCFRequestKitchenCell
            parameters:nil
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   
           self.issuesArray=[XCFIssues mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"issues"]];
                
                   [_table reloadData];
                   [_table.mj_header endRefreshing];
                   
                   
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   NSLog(@"加载失败");
                   [_table.mj_header endRefreshing];
               }];
}

- (void)loadMoreData {
    [_table.mj_header endRefreshing];
    [self.manager GET:XCFRequestKitchenCellMore
            parameters:nil
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   
                   NSArray *newContent = [XCFIssues mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"issues"]];
                   
                   [self.issuesArray addObjectsFromArray:newContent];
                   
                   [_table reloadData];
                   [_table.mj_footer endRefreshing];
  
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   NSLog(@"loadMoreData --- failure");
                   [_table.mj_footer endRefreshing];
      
               }];
}

-(void)setUpRefresh
{
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadCellData)];
    
    _table.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}



// 网络：加载头视图数据

-(void)loadHeaderViewData{
    [self.manager GET:XCFRequestKitchenNav
            parameters:nil
              progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            _kitchenHeader.navContent=[XCFNavContent mj_objectWithKeyValues:responseObject[@"content"]];
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  NSLog(@"加载失败了，呜呜......");
              }];

    // 关注动态数据
    [self.manager GET:XCFRequestKitchenFeeds
            parameters:nil
              progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  self.feedsArray = [XCFFeed mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"feeds"]];
                  
                  self.kitchenHeader.dish = [self.feedsArray[0] dish];
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  NSLog(@"加载失败了，呜呜......");
              }];



}




-(void)setUpNavigationBar{
    XCFSearchBar *searchBar=[XCFSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    self.navigationItem.titleView=searchBar;
    
    WeakSelf;
    searchBar.SearchBarShouldEditingBlock=^{
        XCFSearchViewController *search=[[XCFSearchViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:search];
        [weakSelf.navigationController presentViewController:nav animated:YES completion:NULL];
    };
}



#pragma mark- leftTopButton rightTopButton

-(void)_loadLeftButton{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"homepageCreateRecipeButton"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
}

-(void)_loadRightButton{
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"buylistButtonImage"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;

}

-(void)rightButtonAction:(UIBarButtonItem *)but{
    XCFBasketViewController *basket=[[XCFBasketViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:basket];
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
}

-(void)leftBarButtonAction:(UIBarButtonItem *)but{
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"创建菜谱" otherButtonTitles:@"上传作品", nil];
    [action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        UpLoadFoodViewController *upLoadFood=[[UpLoadFoodViewController alloc]init];
        
        XCFNavigationController *nav=[[XCFNavigationController alloc]initWithRootViewController:upLoadFood];
        [self presentViewController:nav animated:YES completion:NULL];
        
    }else if (buttonIndex==1){
        XCFUpLoadViewController *upload=[[XCFUpLoadViewController alloc]init];
        XCFNavigationController *nav=[[XCFNavigationController alloc]initWithRootViewController:upload];
        [self presentViewController:nav animated:YES completion:NULL];
}
}


#pragma mark - 懒加载

-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
