//
//  ImageViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionView.h"
#import "NewsMessage.h"
#import "MovieCommonData.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    self.title=@"图片";
    UINavigationBar *navigationBar=self.navigationController.navigationBar;
    
    navigationBar.barStyle=UIBarStyleBlack;
    
    navigationBar.translucent=YES;
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem=backItem;
    
    self.view.backgroundColor=[UIColor greenColor];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
}

-(void)_loadData
{
    _collectionView=[[ImageCollectionView alloc]initWithFrame:self.view.bounds];
    
    _collectionView.pagingEnabled=YES;

    _collectionView.array=_arr;
   
    [self.view addSubview:_collectionView];

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

-(void)backAction:(UIBarButtonItem *)item
{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
