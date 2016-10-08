//
//  XCFSearchViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFSearchViewController.h"
#import "XCFSearchResultViewController.h"
#import "XCFViewController.h"
#import "XCFSearchHeaderView.h"
#import "XCFSearchFootView.h"
#import "XCFSearchKeyWorlds.h"
@interface XCFSearchViewController ()

@end

@implementation XCFSearchViewController

static NSString *const wordCellIdentifier = @"word";

static NSString *const searchCellIdentifier = @"search";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    [self setUpHeader];
    [self setUpFooter];
    _typesArray=@[@"搜菜谱", @"搜厨友", @"搜菜单"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.backgroundColor=XCFGlobalBackgroundColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:wordCellIdentifier];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:searchCellIdentifier];
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}
#pragma mark - 设置navigation

-(void)setUpNavBar
{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 40, 20);
    rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setTitle:@"取消" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    self.navigationItem.leftBarButtonItem=nil;
    
    _searchBar=[XCFSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    self.navigationItem.titleView=_searchBar;
   
//    [_searchBar becomeFirstResponder];
    
    WeakSelf;
    
    // 文本编辑回调
    _searchBar.SearchBarTextDidChangedBlock=^{
        weakSelf.searchWords=weakSelf.searchBar.text;
        [weakSelf.tableView reloadData];
    };
    
    // 搜索的时候，把搜索词加到数组里面
    _searchBar.SearchBarTextDidSearchBlock=^{
     
        [XCFSearchKeyWorlds addNewWord:weakSelf.searchBar.text];
        NSLog(@"%ld",[XCFSearchKeyWorlds totalWords].count);
        [weakSelf pushResultViewController];
        [weakSelf.tableView reloadData];
    };
    
    
    
    
}

-(void)rightButtonAction:(UIBarButtonItem *)but{
    [_searchBar resignFirstResponder];
[self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark - 收起键盘

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_searchBar resignFirstResponder];
}

#pragma mark - 设置头视图和尾视图

-(void)setUpHeader
{
    _header=[[XCFSearchHeaderView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 35)];
    WeakSelf;
    _header.clearBlock=^{
        [XCFSearchKeyWorlds removeAllWords];
        [weakSelf.tableView reloadData];
    };
    
    self.tableView.tableHeaderView=_header;
    
    
}

-(void)setUpFooter{
   _footer=[[XCFSearchFootView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    self.tableView.tableFooterView=_footer;
}

#pragma mark - 设置tableview属性

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count=1;
    
//    self.tableView.tableFooterView=_footer;
//    self.tableView.tableHeaderView=_header;
    if ([XCFSearchKeyWorlds totalWords].count==0 &&_searchWords.length==0)
    {
        self.tableView.tableHeaderView.hidden=YES;
        self.tableView.tableFooterView.hidden=NO;
         count=0;
    }
    if (_searchWords.length>0) {
        self.tableView.tableFooterView.hidden=YES;
        self.tableView.tableHeaderView.hidden=YES;
        count=3;
    }
    if (_searchWords.length==0 && [XCFSearchKeyWorlds totalWords].count>0) {
        self.tableView.tableFooterView.hidden=NO;
        self.tableView.tableHeaderView.hidden=NO;
        count=[XCFSearchKeyWorlds totalWords].count;
    }
    return count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell *cell;
    if (_searchWords.length>0) {
    cell=[tableView dequeueReusableCellWithIdentifier:searchCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageNamed:@"searchIcon"];
    NSString *string=[NSString stringWithFormat:@"%@:%@",_typesArray[indexPath.row],_searchWords];
    cell.textLabel.text=string;
    
    }else if (_searchWords.length==0 && [XCFSearchKeyWorlds totalWords].count>0){
        cell=[tableView dequeueReusableCellWithIdentifier:wordCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.text=[XCFSearchKeyWorlds totalWords][indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 37;
}

#pragma mark - 点击事件

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_searchWords.length>0) {
        [XCFSearchKeyWorlds addNewWord:_searchWords];
        
    }else {
     [XCFSearchKeyWorlds addNewWord:[XCFSearchKeyWorlds totalWords][indexPath.row-1]];
    }
      [self pushResultViewController];
    NSLog(@"点击到的地方是%ld",indexPath.row);
}

#pragma mark - push 出搜索结果页面

-(void)pushResultViewController{
    XCFSearchResultViewController *result=[[XCFSearchResultViewController alloc]init];
    [self.navigationController pushViewController:result animated:YES];
}
















@end
