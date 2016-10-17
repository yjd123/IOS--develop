//
//  XCFGuideViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGuideViewController.h"


@interface XCFGuideViewController (){
    UIButton *button;
}

@end

@implementation XCFGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    button=[[UIButton alloc]initWithFrame:CGRectMake(110, 500, 100, 35)];
    
    [button setTitle:@"进来溜达" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:13];
    button.layer.cornerRadius=7.0;
    button.layer.borderWidth=1.0;
    button.backgroundColor=XCFGlobalBackgroundColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(gotoMainView) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    
    _scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scroll.backgroundColor = [UIColor grayColor];
    
   [self.view addSubview:_scroll];
    
    [self.view addSubview:button];
  button.hidden=YES;
    
 
    _scroll.contentSize = CGSizeMake(KScreenWidth*5, KScreenHeight);//内容尺寸在宽上大于，横向滑动，高上大于，纵向滑动，小于以及等于不能滑动
    
    //是否显示滑动条
    _scroll.showsHorizontalScrollIndicator = NO;//水平滑动条
    
    _scroll.bounces=NO;
    
    //是否开启滑动
    _scroll.scrollEnabled = YES;
    
    //是否开启分页滑动
    _scroll.pagingEnabled = YES;
    
    _scroll.delegate=self;
    
    array=@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    for (int i =0;i<5;i++) {
        
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*320, 0, KScreenWidth, KScreenHeight)];
        _imageView.image=[UIImage imageNamed:array[i]];
        [_scroll addSubview:_imageView];
      
        
        
    }
    
 
}
//滑动过程中实时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //获取偏移量
    CGPoint contentOffset = _scroll.contentOffset;

    if (contentOffset.x > 1275) {
        button.hidden=NO;
    }
}

-(void)gotoMainView{
    
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"firstLaunch"];
    
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
   [self presentViewController:[main instantiateInitialViewController] animated:YES completion:NULL ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
