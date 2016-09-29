//
//  TopViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "TopViewController.h"
#import "MovieCommonData.h"
#import "TopModel.h"
#import "TopCollectionViewCell.h"
#import "TopDetailsViewController.h"
@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.text=@"Top250";
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
    _collectionView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
}

-(void)_loadData
{
    _array=[NSMutableArray array];
    NSDictionary *dic1=(NSDictionary *)[MovieCommonData requestData:@"top250.json"];
    
    NSArray *arr=[dic1 objectForKey:@"subjects"];
    
    for (NSDictionary *dic in arr)
    {
        TopModel *top=[[TopModel alloc]init];
        
        top.average=[[dic objectForKey:@"rating"]objectForKey:@"average"];
        top.images=[dic objectForKey:@"images"];
        top.title=[dic objectForKey:@"title"];
        
        [_array addObject:top];
    }
    [_collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCollectionViewCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    
    cell.model=self.array[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailsViewController *topDetails=[self.storyboard instantiateViewControllerWithIdentifier:@"TopDetailsViewController"];
    
    [topDetails setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:topDetails animated:YES];
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
