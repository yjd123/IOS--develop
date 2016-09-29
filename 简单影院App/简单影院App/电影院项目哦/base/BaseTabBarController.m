

#import "BaseTabBarController.h"
#import "BaseTabBarItem.h"

#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BaseTabBarController ()
{
    UIImageView *_imageView;
    
}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"poster_title_home"]];
  

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self creatTabBar];
}

-(void)creatTabBar
{
    for ( UIView *view in self.tabBar.subviews) {
        Class cls=NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    
    NSArray *TabBarImage=@[@"movie_home",@"msg_new",@"start_top250@2x",@"icon_cinema",@"more_setting"];
    NSArray *TabBarLable=@[@"电影",@"新闻",@"TOP",@"影院",@"更多"];
    
    CGFloat buttonWidth=KSScreenWidth/TabBarLable.count;
    CGFloat buttonHeight=self.tabBar.frame.size.height;
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, buttonWidth, buttonHeight)];
    _imageView.image=[UIImage imageNamed:@"selectTabbar_bg_all"];
    [self.tabBar addSubview:_imageView];
    
    
    
    
    for (int i=0; i<TabBarImage.count; i++) {
        CGRect frame=CGRectMake(i*buttonWidth,0,buttonWidth,49);
        BaseTabBarItem *item=[[BaseTabBarItem alloc]initWithFrame:frame imageName:TabBarImage[i] label:TabBarLable[i]];
        item.tag=100+i;
        [self.tabBar addSubview:item];
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)itemAction:(BaseTabBarItem *)item
{
    self.selectedIndex=item.tag-100;
    [UIView animateWithDuration:.2 animations:^{
        _imageView.center=item.center;
    }];
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
