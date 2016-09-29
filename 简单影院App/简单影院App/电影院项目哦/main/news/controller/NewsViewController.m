//
//  NewsViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "NewsViewController.h"
#import "MovieCommonData.h"
#import "NewsMessage.h"
#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "BaseImageViewController.h"
#import "BaseNewsViewController.h"
#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *_data;
    UIImageView *_imageView;
    UILabel *_titleLabel;
 
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.text=@"新闻";
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _tableView.delegate=self;
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.barStyle=UINavigationControllerHideShowBarDuration;
  
    [self _loadData];
    [self _loadTable];
    [self loadHeadCell];

}


-(void)_loadData
{
    _data=[NSMutableArray array];
    
    NSArray *jason=(NSArray *)[MovieCommonData requestData:@"news_list.json"];

    for (NSDictionary *dic in jason)
    {
        NewsMessage *message=[[NewsMessage alloc]init];
        
        message.newsId=[dic objectForKey:@"newsid"];
        message.title=[dic objectForKey:@"title"];
        message.type=[dic objectForKey:@"type"];
        message.image=[dic objectForKey:@"image"];
        message.summary=[dic objectForKey:@"summary"];
        [_data addObject:message];
    }
    [_tableView reloadData];
}

-(void)_loadTable
{
    _tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];

    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KSScreenWidth, 150)];
    [self.view addSubview:_imageView];
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 120, KSScreenWidth, 30)];
    
    _titleLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:.3];
    _titleLabel.font=[UIFont systemFontOfSize:16];
    _titleLabel.textColor=[UIColor whiteColor];
    
    [self.view insertSubview:_titleLabel belowSubview:_tableView];
  
}

-(void)loadHeadCell
{
    if (_data.count>0) {
  
    NewsMessage *newMessage=_data[0];

    [_imageView sd_setImageWithURL:[NSURL URLWithString:newMessage.image]];
    _titleLabel.text=newMessage.title;
    }
}

#pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY= scrollView.contentOffset.y;
    NSLog(@"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿%f",offsetY);
    NSLog(@"zuobiao  sadafda=%f",_imageView.frame.origin.y);
    if (offsetY<0) {
//        CGRect frame=_imageView.frame;
//        frame.origin.y=0;
//        _imageView.frame=frame;
//    }else{
        CGFloat height=150-offsetY;
        CGFloat width=height/150.0*KSScreenWidth;
        CGRect frame=CGRectMake(KSScreenWidth/2-width/2, offsetY, width, height);
        _imageView.frame=frame;
    }
    CGRect frame = _titleLabel.frame;
    CGRect frame2 = _imageView.frame;
    frame.origin.y = CGRectGetMaxY(frame2)-_titleLabel.frame.size.height;
    _titleLabel.frame = frame;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewHeaderCell" forIndexPath:indexPath];
           cell.backgroundColor=[UIColor clearColor];
        
    return cell;
    }
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell" forIndexPath:indexPath];
    cell.newsMessage=_data[indexPath.row];
      return cell;
    

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 150;
    }else{
   
    return 70;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsMessage *newMessage=_data[indexPath.row];
    
    NSInteger type=[newMessage.type integerValue];
    
    BaseImageViewController *baseImage=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
    
    BaseNewsViewController *baseNews=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    
    if (type==0) {
        [baseNews setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:baseNews animated:YES];
        
    }else {
        [baseImage setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:baseImage animated:YES];
    }
    
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
