//
//  MovieViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "MovieViewController.h"
#import "PosterView.h"
#import "Movie.h"
#import "MovieTableViewCell.h"

#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_button1;
    UIButton *_button2;
    UITableView *_table;
    NSMutableArray *_data;
    NSMutableArray *_arr;
}

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.text=@"北美榜";
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
    [self loadData];
    [self creatPosterView];
    [self creatItem];
    [self creatTable];
    
 
}

-(void)creatPosterView{
    _postView=[[PosterView alloc]initWithFrame:self.view.bounds];
    _postView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _postView.hidden=NO;
    [_postView setArray:_data];
    [self.view addSubview:_postView];
  
}
-(void)loadData
{
    _data=[NSMutableArray array];
    _arr=[NSMutableArray array];
    NSString *str=[[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    
    NSData *data=[NSData dataWithContentsOfFile:str];
    
    NSDictionary *jsonDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    NSArray *array=[jsonDic objectForKey:@"subjects"];
    for (NSDictionary *dic in array)
    {
        Movie *movie=[[Movie alloc]init];
        NSDictionary *subject=[dic objectForKey:@"subject"];
        movie.average=[[subject objectForKey:@"rating"]objectForKey:@"average"];
        movie.collectNumber=[subject objectForKey:@"collect_count"];
        movie.title=[subject objectForKey:@"title"];
        movie.originalTitle=[subject objectForKey:@"original_title"];
        movie.subtype=[subject objectForKey:@"subtype"];
        movie.year=[subject objectForKey:@"year"];
        movie.movieID=[subject objectForKey:@"id"];
        movie.images=[subject objectForKey:@"images"];
//        NSString *image=[[subject objectForKey:@"images"]objectForKey:@"large"];
//        [_arr addObject:image];
        [_data addObject:movie];
    }
  
    
   
    [_table reloadData];
    
    
    
}

-(void)creatTable
{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, KSScreenWidth, KSScreenHeight-20) style:UITableViewStyleGrouped];
    _table.rowHeight=120;
//    _table.separatorStyle=UITableViewCellSeparatorStyleNone;
    _table.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _table.hidden=YES;
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MovieTableViewCell" owner:self options:nil]lastObject];
        
    }
    cell.movie=_data[indexPath.row];
    return cell;
}


-(void)creatItem
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
//    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"exchange_bg_home@2x"]];
    
    _button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [_button1 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [_button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    _button1.tag=101;
    _button1.hidden=NO;
    [_button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_button1];
    
    _button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [_button2 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
      [_button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    _button2.tag=102;
    _button2.hidden=YES;
    [_button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_button2];
    
    UIBarButtonItem *barItem=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=barItem;

}

-(void)buttonAction:(UIButton *)button
{
    UIView *view=self.navigationItem.rightBarButtonItem.customView;
    _button1.hidden=!_button1.hidden;
    _button2.hidden=!_button2.hidden;
    
    _postView.hidden=!_postView.hidden;
    _table.hidden=!_table.hidden;
    
    [self flipView:view left:_button1.hidden];
    [self flipView:self.view left:_table.hidden];
}

-(void)flipView:(UIView *)forView left:(BOOL)flag
{
    UIViewAnimationOptions flip=flag ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:forView duration:.2 options:flip animations:^{
        [forView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL
    ];
    
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
