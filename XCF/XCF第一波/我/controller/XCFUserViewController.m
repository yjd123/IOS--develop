
#import "XCFUserViewController.h"
#import "AppDelegate.h"
#import "UpLoadFoodViewController.h"
#import "XCFUpLoadViewController.h"


#define kWeiboAuthDataKey @"kWeiboAuthDataKey"
#define kAccessTokenKey @"kAccessTokenKey"
#define kUserIDKey @"kUserIDKey"
#define kExpirationDateKey @"kExpirationDateKey"
#define kAuthDataKey @"kAuthDataKey"

@interface XCFUserViewController ()<SinaWeiboDelegate>{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UIView *view;
    UILabel *Label;
}

@end

@implementation XCFUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   [self.navigationController.navigationBar removeFromSuperview];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(90, 260, 150, 50)];
    
    [button setTitle:@"微博登录" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
[button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.hidden=YES;
    
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    
    _table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _table.delegate=self;
    _table.dataSource=self;
    
    [self.view addSubview:_table];
    [self _loadImage];
    
    view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    view.backgroundColor=[UIColor clearColor];
    [self.view addSubview:view];
    
    [self _loadLeftButton];
    [self _loadRightButton];
    
   
    
}

-(void)_loadImage
{
   
    
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    
    _imageView.image=[UIImage imageNamed:@"杭电.jpg"];
    
    [self.view addSubview:_imageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 130, KScreenWidth, 70)];
    
    _titleLabel.backgroundColor=[UIColor clearColor];
    
    _titleLabel.font=[UIFont systemFontOfSize:30 weight:15];
    
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.textAlignment=NSTextAlignmentCenter;

    _titleLabel.text=@"杭电学子     叶健东";
    
    [self.view addSubview:_titleLabel];
    
}


#pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY= scrollView.contentOffset.y;
    NSLog(@"%lf",offsetY);
 
    if (offsetY>0) {
        
                CGRect frame=_imageView.frame;
                frame.origin.y=-offsetY;
                _imageView.frame=frame;
       view.backgroundColor=[UIColor colorWithRed:0 green:offsetY/255.0 blue:offsetY/510.0 alpha:offsetY/200.0];
        Label.hidden=YES;
        
        if (offsetY>200){
            view.backgroundColor=[UIColor colorWithRed:0 green:200/255.0 blue:87/255.0 alpha:1];
            Label.hidden=NO;
        }
        
            }
    else if (offsetY<0){
        
        CGFloat height=200-offsetY;
        CGFloat width=height/200.0*KScreenWidth;
        CGRect frame=CGRectMake(KScreenWidth/2-width/2, 0, width, height);
        _imageView.frame=frame;
        
 
    }
    CGRect frame = _titleLabel.frame;
    CGRect frame2 = _imageView.frame;
    frame.origin.y = CGRectGetMaxY(frame2)-_titleLabel.frame.size.height;
    _titleLabel.frame = frame;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row==0) {
        
        cell.textLabel.text=nil;
        return cell;
    }
    
    
    
    
    cell.textLabel.text=[NSString stringWithFormat:@"大家好，我萌萌哒%ld号",indexPath.row];
    
    
    return cell;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 200;
    }else{
        
        return 70;
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 500)];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(87, 10, 150, 50)];
    
    [button setTitle:@"微博登录" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [view1 addSubview:button];
    
    return view1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 500;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

-(void)buttonAction{

 
    _sinaWeibo=[[SinaWeibo alloc]initWithAppKey:AppKey appSecret:AppSecret appRedirectURI:@"http://www.baidu.com" andDelegate:self];
    
    
    //打开登陆界面，显示WebView
    [_sinaWeibo logIn];
    
    //OAuth 2.0 认证
    
    //1.读取登陆信息
    BOOL isAuth = [self readAuthData];
    
    //2.判断是否已登陆
    
    if (isAuth == NO) {
        //执行登陆操作
        [_sinaWeibo logIn];
        NSLog(@"从未登陆过微博，需要重新登陆");
    } else {
        NSLog(@"已登陆过微博:%@", _sinaWeibo.accessToken);
    }
    
}


#pragma mark - SinaWeibo Login

//登陆成功 保存用户数据
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo {
    //保存用户数据
    [self saveAuthData];
}
//登陆取消 在登录过程中，点击了左上角的XX
- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo {
    NSLog(@"登陆被取消");
}
//注销成功
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo {
    
}
//登录失败
- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error {
    NSLog(@"登陆失败Error:%@", error);
}


#pragma mark - 登陆数据本地持久化
//保存登陆认证数据
- (void)saveAuthData {
    //获取登陆后返回的用户信息
    //用户令牌
    NSString *accessToken = _sinaWeibo.accessToken;
    //User ID
    NSString *uid = _sinaWeibo.userID;
    //令牌的有效期限
    NSDate *date = _sinaWeibo.expirationDate;
    //将数据打包成一个字典
    NSMutableDictionary *authDataDic = [[NSMutableDictionary alloc] init];
    [authDataDic setObject:accessToken forKey:kAccessTokenKey];
    [authDataDic setObject:uid forKey:kUserIDKey];
    [authDataDic setObject:date forKey:kExpirationDateKey];
    
    //使用NSUserDefaults 来保存数据
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:[authDataDic copy] forKey:kAuthDataKey];
    //数据同步  将保存的数据同步到属性列表中
    [userDef synchronize];
    
    NSLog(@"%@", NSHomeDirectory());
    
}

//读取保存在NSUserDefaults中的认证数据,如果成功读取到数据，则返回YES
- (BOOL)readAuthData {
    return YES;
}

#pragma mark- leftTopButton rightTopButton

-(void)_loadLeftButton{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(10, 28, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"homepageCreateRecipeButton"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:LeftButton];
    
    Label=[[UILabel alloc]initWithFrame:CGRectMake(150, 28, 100, 30)];
    
    
    
    Label.font=[UIFont systemFontOfSize:16];
    
    Label.textColor=[UIColor blackColor];
    
    Label.text=@"我";
    
    [view addSubview:Label];
    Label.hidden=YES;
}

-(void)_loadRightButton{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(280,28, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"rightPageSetting"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
   
    [view addSubview:rightButton];
}


-(void)leftBarButtonAction:(UIBarButtonItem *)but{
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"创建菜谱" otherButtonTitles:@"上传作品", nil];
    [action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        UpLoadFoodViewController *upLoadFood=[[UpLoadFoodViewController alloc]init];
        
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:upLoadFood];
        [self presentViewController:nav animated:YES completion:NULL];
        
    }else if (buttonIndex==1){
        XCFUpLoadViewController *upload=[[XCFUpLoadViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:upload];
        [self presentViewController:nav animated:YES completion:NULL];
    }
}

-(void)rightButtonAction{
    
}
@end
