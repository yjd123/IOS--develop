//
//  UpLoadFoodViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "UpLoadFoodViewController.h"

@interface UpLoadFoodViewController ()

@end

@implementation UpLoadFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadNavigationItem];
    self.view.backgroundColor=[UIColor redColor];
    
}
-(void)_loadNavigationItem
{
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem=backItem;
}

-(void)backAction:(UIBarButtonItem *)item
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
