//
//  XCFAddTagViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFAddTagViewController.h"

@interface XCFAddTagViewController ()

@end

@implementation XCFAddTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"添加便签";
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 40, 30);
    [LeftButton setTitle:@"取消" forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(15, 80, KScreenWidth-100, 30)];
    
    _textField.backgroundColor=XCFDishViewBackgroundColor;
    _textField.font=[UIFont systemFontOfSize:15];
    _textField.placeholder=@"请输入标签";
    [self.view addSubview:_textField];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_textField.frame)-15, 80, 100, 30)];
    
    button.backgroundColor=XCFGlobalBackgroundColor;
    [button setTitle:@"添加" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)buttonAction
{
    if (self.textField.text.length) {
        self.callBack(self.textField.text);
        [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    }
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:YES];
//    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"小提示" message:@"标签最好五个字以内哦" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alertView show];
//}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
