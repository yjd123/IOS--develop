//
//  XCFRequestKitchenBuy.m
//  XCF第一波
//
//  Created by admin on 16/10/3.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFRequestKitchenBuy.h"

@interface XCFRequestKitchenBuy ()

@end

@implementation XCFRequestKitchenBuy

- (void)viewDidLoad {
    [super viewDidLoad];
//    XCFSearchBar *searchBar=[XCFSearchBar searchBarWithPlaceholder:@"搜索店铺内商品"];
    self.title=@"买烘焙";
    
    UIWebView *web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    web.backgroundColor=XCFGlobalBackgroundColor;
    
    [self.view addSubview:web];
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:XCFRequestKitchenBuys]];
    [web loadRequest:request];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame=CGRectMake(0, 0, 25, 25);
        [rightButton setBackgroundImage:[UIImage imageNamed:@"shoppingCart"] forState:UIControlStateNormal];
   
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem=rightItem;

    
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
