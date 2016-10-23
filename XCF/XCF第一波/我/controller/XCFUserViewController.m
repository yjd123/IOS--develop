
#import "XCFUserViewController.h"
#import "AppDelegate.h"
#import "UpLoadFoodViewController.h"
#import "XCFUpLoadViewController.h"
#import "XCFLoginViewController.h"

#import "XCFLogin.h"
#import <sqlite3.h>

// 定义

#define KDataBaseFliePath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.sqlite"]
@interface XCFUserViewController (){
    UIImageView *_imageView;
    UIButton *button1;
    UIView *view;
    UILabel *Label;
    NSArray *cellArray;
    UILabel *lbl;
}

@end

@implementation XCFUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   [self.navigationController.navigationBar removeFromSuperview];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(90, 260, 150, 50)];
    
    [button setTitle:@"微博登录" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor colorWithWhite:1 alpha:.2];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
[button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.hidden=YES;
    
    self.view.backgroundColor=XCFGlobalBackgroundColor;
    
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-44) style:UITableViewStyleGrouped];
    
    _table.delegate=self;
    _table.dataSource=self;
 
    
    cellArray=@[@"账号管理",@"设置密码",@"收货地址",@"发现好友",@"消息推送",@"把下厨房告诉朋友",@"账号管理",@"帮助下厨房评分",@"消除缓存"];
    
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
    
    

    [self.view addSubview:_titleLabel];
    
    
    button1=[[UIButton alloc]initWithFrame:CGRectMake(122, 100, 80, 40)];
    
    [button1 setTitle:@"登录" forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor colorWithWhite:1 alpha:.2];
    button1.layer.cornerRadius=5;
    button1.layer.borderWidth=1.0;
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
   
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self searchUser];
    
    
    if (_titleLabel.text.length) {
     
        button1.hidden=YES;
        _titleLabel.hidden=NO;
    }else{
        _titleLabel.hidden=YES;
        button1.hidden=NO;
    }
   
    
    
}

//搜索用户
- (void)searchUser {
    
    
    NSLog(@"%@", NSHomeDirectory());
    
    //1. 打开数据库
    sqlite3 *sqlite = NULL;
    int result = sqlite3_open([KDataBaseFliePath UTF8String], &sqlite);
    if (result != SQLITE_OK) {
        NSLog(@"数据库打开失败!");
        return;
    }
    
    //2. 构造Sql语句
    NSString *string = @"SELECT username FROM user;";
    
    //3. 编译Sql语句
    sqlite3_stmt *stmt = NULL;
    
    result = sqlite3_prepare_v2(sqlite, [string UTF8String], -1, &stmt, NULL);
    
    if (result != SQLITE_OK) {
        NSLog(@"编译失败");
        
        _titleLabel.hidden=YES;
        button1.hidden=NO;
        
        sqlite3_close(sqlite);
        
        return;
    }else{
        NSLog(@"编译成功");
    }
    //绑定数据
    //    sqlite3_bind_text(stmt, 1, "username", -1, NULL);
    
    
    //4. 执行SQL语句
    //获取第一个数据
    //sqlite3_step 执行一次查询，获取一个数据。 多次执行此函数，能够依次获取所有数据
    //SQLITE_ROW 表示查询到一个数据  SQLITE_DONE 表示数据查询完毕
    result = sqlite3_step(stmt);
    
    //5. 处理执行结果
    if (result == SQLITE_ROW) {
        //从查询结果中  获取数据
        /**
         *  从句柄中 获取查询结果
         *  sqlite3_stmt*   查询的句柄
         *  int iCol        字段的序号
         */
        
        //        NSInteger userID = sqlite3_column_int(stmt, 0);
//        _titleLabel.text = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 0)];
      _titleLabel.text = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
        
        
        //        NSString *password = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 2)];
        
        NSLog(@" username = %@", _titleLabel.text);
        
        //每循环一次，获取一个数据
        result = sqlite3_step(stmt);
    }else{
        NSLog(@"没有找到数据");
    }
    //获取查询到的数据
    //6. 关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    
    
}



#pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY= scrollView.contentOffset.y;

 
    if (offsetY>0) {
        
                CGRect frame=_imageView.frame;
                frame.origin.y=-offsetY;
                _imageView.frame=frame;
       view.backgroundColor=[UIColor colorWithRed:0 green:offsetY/255.0 blue:offsetY/510.0 alpha:offsetY/120.0];
        Label.hidden=YES;
        
        if (offsetY>120){
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
    
    CGRect frame1=button1.frame;
    frame1.origin.y = CGRectGetMaxY(frame2)-button1.frame.size.height-60;
    button1.frame=frame1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row==0) {
        
        cell.textLabel.text=nil;
//       cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }

    cell.textLabel.text=cellArray[indexPath.row-1];
    cell.backgroundColor=XCFGlobalBackgroundColor;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    lbl=[[UILabel alloc]init];
    lbl.frame = CGRectMake(cell.frame.origin.x + 10, cell.frame.origin.y +59, cell.frame.size.width - 20, 1);
    lbl.backgroundColor =  [UIColor lightGrayColor];
    [cell.contentView addSubview:lbl];
    
    return cell;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 200;
    }else{
        
        return 60;
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

-(void)buttonAction{
    XCFLoginViewController *login=[[XCFLoginViewController alloc]init];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
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
