//
//  BaseImageViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "BaseImageViewController.h"
#import "MovieCommonData.h"
#import "NewsMessage.h"
#import "NewsCollectionViewCell.h"
#import "ImageViewController.h"
#import "BaseNavigationController.h"
@interface BaseImageViewController ()

@end

@implementation BaseImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    self.tabBarController.tabBar.backgroundColor=[UIColor clearColor];
    self.title=@"图片新闻";
    _collectionView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    
    
    
}


-(void)_loadData
{
    _data=[NSMutableArray array];
    NSArray *array=(NSArray *)[MovieCommonData requestData:@"image_list.json"];
    
    for (NSDictionary *dic in array)
    {
        NewsMessage *message=[[NewsMessage alloc]init];
        message.image=[dic objectForKey:@"image"];
        
        [_data addObject:message];
    }
    [_collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCollectionViewCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    cell.message=_data[indexPath.row];
    
   
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    _array1=[NSMutableArray array];
    for (NewsMessage *message1 in _data) {
        NSString *str=message1.image;
        [_array1 addObject:str];
    }
    
    ImageViewController *imageViewController=[[ImageViewController alloc]init];
  
    imageViewController.arr=_array1;

    imageViewController.indexPath=indexPath;
    
    
    
    BaseNavigationController *nav=[[BaseNavigationController alloc]initWithRootViewController:imageViewController];
    
    
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
    
    
    
    
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
