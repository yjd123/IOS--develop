//
//  XCFLogin.m
//  XCF第一波
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFLogin.h"
#import "XCFUserViewController.h"
#import <sqlite3.h>

// 定义

#define KDataBaseFliePath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.sqlite"]



#define kWeiboAuthDataKey @"kWeiboAuthDataKey"
#define kAccessTokenKey @"kAccessTokenKey"
#define kUserIDKey @"kUserIDKey"
#define kExpirationDateKey @"kExpirationDateKey"
#define kAuthDataKey @"kAuthDataKey"

@interface XCFLogin ()<SinaWeiboDelegate>{
    NSUserDefaults *userDef;
}

@end

@implementation XCFLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadLeftButton];
 
    
    self.view.backgroundColor=XCFGlobalBackgroundColor;
  
    
    [_login addTarget:self action:@selector(buttonActionLogin) forControlEvents:UIControlEventTouchUpInside];
    [_weiboButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    

    
  
    
    
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


-(void)buttonActionLogin
{
    if (_username.text.length>3 && _password.text.length>3) {
      
        [self insetUser:_username.text password:_password.text];
        
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
        }];
        
        
    }

}
-(void)insetUser:(NSString *)username password:(NSString *)password
{
    NSLog(@"%@",NSHomeDirectory());
    
    /*
     1. 打开数据库
     2. 构造Sql语句
     3. 编译Sql语句
     4. 执行SQL语句
     5. 处理执行结果
     6. 关闭数据库和句柄
     */
    
    sqlite3 *sqlite= NULL;
    
    // 打开数据库
    
    int openDBResult=sqlite3_open([KDataBaseFliePath UTF8String], &sqlite);
    
    if (openDBResult !=SQLITE_OK) {
        NSLog(@"打开失败");
        return;
    }
    
    // 创建sql 语句  不能直接填入数据
    
    NSString *string= @"INSERT INTO user(username,password)VALUES(?,?)";
    
    
    sqlite3_stmt *stmt=NULL;
    
    int result =   sqlite3_prepare_v2(sqlite , [string UTF8String], -1, &stmt, NULL);
    
    if (result != SQLITE_OK)
    {
        NSLog(@"编译错误");
        //关闭数据库
        sqlite3_close(sqlite);
        
        return;
    }
    
    
    
    //绑定数据 到编译后的语句
    /*
     sqlite3_stmt*, 编译绑定数据的句柄
     int,           需要邦定的数据 在sql语句中位置(第几个问号)
     const char*,  需要绑定的字符串
     int,        字符串的长度 -1 自动计算
     void(*)(void*)  绑定后回调函数
     */
    
    sqlite3_bind_text(stmt, 1, [username UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 2, [password UTF8String], -1, NULL);
    
    // 4 执行sql句柄
    
    result =sqlite3_step(stmt);
    
    if (result == SQLITE_DONE)
    {
        NSLog(@"插入成功");
    }else
    {
        NSLog(@"插入失败");
    }
    
    
    //释放句柄 关闭 数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    
    
    
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
        
        NSDictionary *dic=[userDef objectForKey:kAuthDataKey];
        
        NSLog(@"%@",dic);
    }
    
}

#pragma mark - 登陆数据本地持久化
//保存登陆认证数据
- (void)saveAuthData {
    
        NSLog(@"%@", NSHomeDirectory());
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
    userDef = [NSUserDefaults standardUserDefaults];
    
    [userDef setObject:[authDataDic copy] forKey:kAuthDataKey];
    
    //数据同步  将保存的数据同步到属性列表中
    
    [userDef synchronize];
    
    
    
    NSLog(@"%@", NSHomeDirectory());
    
}

//读取保存在NSUserDefaults中的认证数据,如果成功读取到数据，则返回YES
- (BOOL)readAuthData {
    return YES;
}


-(void)_loadLeftButton{
    
   UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];

    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(10, 35, 35, 17);
    [LeftButton setTitle:@"返回" forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    LeftButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [LeftButton addTarget:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:LeftButton];
    
   UILabel *Label=[[UILabel alloc]initWithFrame:CGRectMake(150, 28, 100, 30)];
    
    
    
    Label.font=[UIFont systemFontOfSize:16];
    
    Label.textColor=[UIColor blackColor];
    
    Label.text=@"登录";
    
    [view addSubview:Label];
    
    
}


-(void)leftBarButtonAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
}





@end
