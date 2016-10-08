//
//  XCFBreakfastViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFBreakfastViewController.h"
#import "XCFBreakfast.h"
#import "XCFBreakfastCell.h"
#import "XCFUpLoadViewController.h"
#import "XCFEvent.h"


@interface XCFBreakfastViewController (){
    NSMutableArray *newData;
}

@end

@implementation XCFBreakfastViewController

static NSString * const reuseIdentifier = @"mealDishCell";
static NSString * const headerIdentifier = @"mealHeader";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _feedsArray = [[NSMutableArray alloc] init];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
 
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((KScreenWidth-5)*0.5, 250);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    
    
   flowLayout.headerReferenceSize = CGSizeMake(KScreenWidth, 120);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = XCFGlobalBackgroundColor;
    
    [self.view addSubview:_collectionView];
    [self setUpRefresh];
    [self loadData];
    
    // 单元格注册
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XCFBreakfastCell class]) bundle:nil]forCellWithReuseIdentifier:reuseIdentifier];
    
    //头视图的注册
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    
    [self loadNav];
    [self loadFootView];
    
  
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    
}

#pragma mark - 属性



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.feedsArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XCFBreakfastCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.food=self.feedsArray[indexPath.item];
    cell.backgroundColor=XCFGlobalBackgroundColor;
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        
       
        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(90, 20, 150, 25)];
        label1.text=self.name;
        label1.font=[UIFont systemFontOfSize:13];
        label1.textAlignment=NSTextAlignmentCenter;
        [headerView addSubview:label1];
        
        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(108, 52, 100, 20)];
        [headerView addSubview:label2];
        label2.textColor=[UIColor redColor];
        if ([self.n_dishes intValue] > 0) {
            
            label2.text=[NSString stringWithFormat:@"%d 个作品",[self.n_dishes intValue]];
            
        }
        label2.font=[UIFont systemFontOfSize:12];
        label2.textAlignment=NSTextAlignmentCenter;
        
        UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(90, 82, 150, 30)];
        [headerView addSubview:label3];
        label3.text=self.desc;
        label3.font=[UIFont systemFontOfSize:13];
        label3.textAlignment=NSTextAlignmentCenter;
        
        
        return headerView;
    }
  
    return nil;
    
}



-(void)setUpRefresh
{
    _collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    _collectionView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(void)loadData{

    
    [_collectionView.mj_footer endRefreshing];
    // 关注动态数据
   
    [[AFHTTPSessionManager manager] GET:XCFRequestKitchenBreakfast
           parameters:nil
             progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
        NSDictionary *event=[[responseObject objectForKey:@"content"]objectForKey:@"event"];
                
                 
                 self.name=[event objectForKey:@"name"];
                 self.desc=[event objectForKey:@"desc"];
                 self.n_dishes=[event objectForKey:@"n_dishes"];
                 
                 
                NSArray *arr = [XCFBreakfast mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"event"][@"dishes"][@"dishes"]];
                 
                 [self.feedsArray addObjectsFromArray:arr];
                
                 [_collectionView reloadData];
                 
                 [_collectionView.mj_header endRefreshing];
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"加载失败了，呜呜......");
             }];
    
}

-(void)loadMoreData{
    [_collectionView.mj_header endRefreshing];
    
    // 关注动态数据

    [[AFHTTPSessionManager manager] GET:XCFRequestKitchenBreakfast
           parameters:nil
             progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
               NSArray  *array  = [XCFBreakfast mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"event"][@"dishes"][@"dishes"]];
                 
                
                 
                 [self.feedsArray addObjectsFromArray:array];
                 
                 [_collectionView reloadData];
                 
                 [_collectionView.mj_footer endRefreshing];
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"加载失败了，呜呜......");
             }];
}

-(void)loadFootView{
    UIButton *update=[[UIButton alloc]initWithFrame:CGRectMake(5, KScreenHeight-45, KScreenWidth-10, 40)];
    update.backgroundColor=XCFThemeColor;
    [update setTitle:@"上传我做的早餐" forState:UIControlStateNormal];
    update.titleLabel.font=[UIFont systemFontOfSize:14];
    [update setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [update addTarget:self action:@selector(updateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:update];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(60, 6, 30, 30)];
    image.image=[UIImage imageNamed:@"createRecipeCamera"];
    [update addSubview:image];
    
}


-(void)loadNav{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];

    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
}


-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

-(void)updateAction{
    XCFUpLoadViewController *upLoad=[[XCFUpLoadViewController alloc]init];
    [self.navigationController pushViewController:upLoad animated:YES];
}








@end
