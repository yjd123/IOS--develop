//
//  XCFTabBarController.m
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFTabBarController.h"

@interface XCFTabBarController (){
    UIView *_tabView;
    
    NSInteger index;
    
    NSMutableArray *_arr;
    
    NSMutableArray *_arr1;
}

@end

@implementation XCFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTabBar];
}

-(void)creatTabBar{
 
    self.tabBar.hidden = YES;
    
    //自定义标签，使用view和button
    _tabView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight - 49, KScreenWidth, 49)];
    _tabView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tabView];
    
    NSArray *array=@[@"tabADeselected",@"tabBDeselected",@"tabCDeselected",@"tabDDeselected"];
    NSArray *array1=@[@"tabASelected",@"tabBSelected",@"tabCSelected",@"tabDSelected"];
    NSArray *titleArray=@[@"下厨房",@"市集",@"信箱",@"我"];
    _arr=[NSMutableArray array];
      _arr1=[NSMutableArray array];
    for (int i=0; i<array.count; i++) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake((KScreenWidth/4- 25)/2+i*KScreenWidth/4, 5, 24, 26);
        [_btn setBackgroundImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [_btn setBackgroundImage:[UIImage imageNamed:array1[i]] forState:UIControlStateSelected];
        
        _btn.tag = 100 + i ;
        //点击高亮
        _btn.showsTouchWhenHighlighted = YES;
        [_arr addObject:_btn];
        
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabView addSubview:_btn];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(i * KScreenWidth / 4+20, 29, 40, 20)];
        //设置label的内容
        titleLabel.text = titleArray[i];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.tag=200+i;
        [_arr1 addObject:titleLabel];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:11];
        [_tabView addSubview:titleLabel];
    }
}

-(void)btnAction:(UIButton *)btn{
    
    self.selectedIndex=btn.tag-100;
    for (UIButton *but in _arr)
    {
        but.selected=NO;
    }
    UIButton *button1=(UIButton *)[_tabView viewWithTag:btn.tag];
    button1.selected=YES;
    
    for (UILabel *label in _arr1) {
        label.textColor=[UIColor blackColor];
    }
    UILabel *label=(UILabel *)[_tabView viewWithTag:btn.tag+100];

    label.textColor=[UIColor redColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
