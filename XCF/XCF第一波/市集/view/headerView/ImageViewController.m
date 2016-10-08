//
//  ImageViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionView.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    self.view.backgroundColor=[UIColor blackColor];
    UINavigationBar *navigationBar=self.navigationController.navigationBar;
    
    navigationBar.barStyle=UIBarStyleBlack;
    
    navigationBar.translucent=YES;
    
  
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(25, 70, 35, 35)];
    
    [button setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    

    
    self.automaticallyAdjustsScrollViewInsets=NO;
}

-(void)_loadData
{
    _collectionView=[[ImageCollectionView alloc]initWithFrame:self.view.bounds];
    
    _collectionView.pagingEnabled=YES;
    
    _collectionView.array=_imageArr;
    
    [self.view addSubview:_collectionView];
    
    
    // 拿到前面的indexpath。然后移动到那个位置
    [_collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap1Action:) name:@"tap" object:nil];
    
    [_collectionView reloadData];
}

-(void)tap1Action:(NSNotification *)noti
{
    _isHiden=! _isHiden;
    
    [self.navigationController setNavigationBarHidden:_isHiden animated:YES];
}

-(BOOL)prefersStatusBarHidden
{
    return _isHiden;
}

-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
