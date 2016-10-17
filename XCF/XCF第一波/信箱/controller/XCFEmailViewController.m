//
//  XCFEmailViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFEmailViewController.h"
#import "XCFChatViewController.h"
#import "XCFCommunityViewController.h"


@interface XCFEmailViewController (){
    NSArray *imageArr;
    NSArray *titleArr;
    NSArray *textArr;
}

@end

@implementation XCFEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadRightButton];
    
    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.delegate=self;
    _table.dataSource=self;
    
    [self.view addSubview:_table];
    
    imageArr=@[@"icon01.jpg",@"icon02.jpg"];
    titleArr=@[@"舒可曼官方旗舰店",@"进口美食全球购"];
   textArr=@[@"亲，您好，欢迎光临",@"😡，这里不欢迎你"];
    
    
}

-(void)_loadRightButton{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"tabCSelected"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"拉粑粑"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.imageView.image=[UIImage imageNamed:imageArr[indexPath.row]];
    cell.textLabel.text=titleArr[indexPath.row];
    cell.detailTextLabel.text=textArr[indexPath.row];
   
    
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 80, 40)];
    label.text=@"写一封信";
    [view addSubview:label];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"myView"];
    //由navigationController推向我们要推向的view
//    [self.navigationController pushViewController:myView animated:YES];
////
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:myView];
        [self.navigationController presentViewController:nav animated:YES completion:NULL];
    
}


-(void)rightButtonAction{
    XCFCommunityViewController *com=[[XCFCommunityViewController alloc]init];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:com];
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
}














@end
