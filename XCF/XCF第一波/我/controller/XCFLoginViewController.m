//
//  XCFLoginViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFLoginViewController.h"
#import "XCFLogin.h"

@interface XCFLoginViewController ()

@end

@implementation XCFLoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.hidden=YES;
  
    UIImageView *image=[[UIImageView alloc]initWithFrame:self.view.bounds];
    image.image=[UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    [self.view addSubview:image];
    
    [self _loadLeftButton];
    [self loadLoginButton];
    
    
    
}

-(void)_loadLeftButton{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(10, 35, 45, 17);
    [LeftButton setTitle:@"返回" forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    LeftButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [LeftButton addTarget:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LeftButton];
}


-(void)leftBarButtonAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)loadLoginButton{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 180, 280, 40)];
    
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(20, 250, 280, 40)];
    
    [button1 setTitle:@"手机注册" forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor blueColor];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self.view addSubview:button1];
}

-(void)buttonAction{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"login"];
    
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:myView];
    
    [self.navigationController pushViewController:myView animated:YES];
}

@end
