//
//  XCFMarketViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFMarketViewController.h"
#import "XCFSearchBar.h"
#import "XCFGoodViewController.h"
@interface XCFMarketViewController (){
    UIWebView *web;
}

@end

@implementation XCFMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XCFSearchBar *searchBar=[XCFSearchBar searchBarWithPlaceholder:@"买东西"];
   
    self.navigationItem.titleView=searchBar;
    
    web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    web.backgroundColor=XCFGlobalBackgroundColor;
    
    [self.view addSubview:web];
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"leftPageButtonBackgroundNormal"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.xiachufang.com/page/ec-tab/?version=12"]];
    [web loadRequest:request];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
   
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"shoppingCart"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    WeakSelf;
    searchBar.SearchBarShouldEditingBlock=^{
        XCFGoodViewController *goods=[[XCFGoodViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:goods];
        [weakSelf.navigationController presentViewController:nav animated:YES completion:NULL];
    };
}

-(void)backAction{
   

    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.xiachufang.com/page/ec-tab/?version=12"]];
    [web loadRequest:request];
    
}


@end
