//
//  XCFKitchenTalk.m
//  XCF第一波
//
//  Created by admin on 16/10/4.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFKitchenTalk.h"
#import "XCFItems.h"
#import "XCFContents.h"
@interface XCFKitchenTalk (){
    UILabel *label;
}

@end

@implementation XCFKitchenTalk

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"呵呵哒";
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.font=[UIFont systemFontOfSize:13];
    label.textColor=[UIColor blackColor];
    self.navigationItem.titleView=label;
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@" shareIcon"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;

    
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

-(void)setItems:(XCFItems *)items
{
   _items=items;
    
    UIWebView *web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    web.backgroundColor=XCFGlobalBackgroundColor;
    
    [self.view addSubview:web];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:items.url]];
    [web loadRequest:request];
    
    
    label.text=items.contents.title;
   
    
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
