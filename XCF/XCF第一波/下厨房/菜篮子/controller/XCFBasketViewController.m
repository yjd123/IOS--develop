//
//  XCFBasketViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/24.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFBasketViewController.h"
#import "XCFBasketCell.h"
#import "XCFBasketModel.h"
@interface XCFBasketViewController ()

@end

@implementation XCFBasketViewController

static NSString *const CellIdentifier = @"BasketCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"菜篮子";
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    [self loadData];
    [self _loadNavigationItem];
    [self setUpTable];
}


-(void)loadData{
    
    _nameArr=[NSMutableArray array];
    _modelArr=[NSMutableArray array];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"Ingredient" ofType:@"plist"];
    
    _array=[NSArray arrayWithContentsOfFile:filePath];
    
    for (NSDictionary *dic in _array) {
        NSString *name=[dic objectForKey:@"name"];
        [_nameArr addObject:name];
    }
}


#pragma _mark--tableView 各项属性

-(void)setUpTable{
    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
    _table.delegate=self;
    _table.dataSource=self;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _nameArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   NSDictionary *dic=_array[section];
   NSArray *ingredient=[dic objectForKey:@"ingredient"];
   
    return ingredient.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCFBasketCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"XCFBasketCell" owner:nil options:nil]lastObject];
    
    NSDictionary *dic=_array[indexPath.section];
    
    NSArray *ingredient=[dic objectForKey:@"ingredient"];
    
    NSString *foodName=[ingredient[indexPath.row] objectForKey:@"name"];
    
    NSString *amount=[ingredient[indexPath.row] objectForKey:@"amount"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.foodName.text=foodName;
    
    cell.amount.text=amount;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //设置背景颜色
    button.backgroundColor =XCFGlobalBackgroundColor;

    //设置button的tag值
    button.tag = 100 + section;
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTitle:_nameArr[section] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(pick:) forControlEvents:UIControlEventTouchUpInside];
    
//    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
//    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
//    
//    [button addGestureRecognizer:swipe];
//    
//    
    
    return button;
}

-(void)pick:(UIButton *)btn{
    
    compare[btn.tag - 100] = !compare[btn.tag -100];
    
    //返回一个单元格的实例
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:btn.tag - 100];
    
    
    //刷新组
    [_table reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
}

#pragma _mark--导航栏

-(void)_loadNavigationItem
{
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 30, 30);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 30, 30);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"reportIcon"] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
//    [_table setEditing:YES animated:YES];
}

-(void)rightAction{
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"清空菜篮子" otherButtonTitles:nil, nil];
    [action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [_table removeFromSuperview];
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 220, 320, 50)];
    label1.text=@"再也不会忘记要买葱了";
    label1.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(50, 250, 220, 50)];
    label2.text=@"(将用料丢进菜篮子，每次去超市就不会忘记买需要的东西了）";
    label2.numberOfLines=0;
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label2];
    }
}


@end
