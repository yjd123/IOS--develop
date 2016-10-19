//
//  AppDelegate.m
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "AppDelegate.h"
#import "XCFGuideViewController.h"
#import "XCFTabBarController.h"



#import <sqlite3.h>

// 定义

#define KDataBaseFliePath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/login.sqlite"]

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //1.创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
  
    //NSUserDefaults用户配置文件储存器
    //储存形势 类似于字典
    //单利方法 获取一个标准的用户配置对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //向配置对象中 储存数据
    //[userDefaults setObject:@"hello" forKey:@"string"];
    
    //读取数据
    //NSLog(@"%@", [userDefaults objectForKey:@"string"]);
    
    NSString *key = @"notIsFirstLaunchApp";
    //读取数据
    id object = [userDefaults objectForKey:key];
    
    if (object) {
        //不是第一次加载程序
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        
        self.window.rootViewController = [main instantiateInitialViewController];
//          self.window.rootViewController=[[XCFGuideViewController alloc] init];
       
        
    } else {
        
      // self.window.rootViewController=[[XCFGuideViewController alloc] init];
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        
        self.window.rootViewController = [main instantiateInitialViewController];
    }
    
   [self creatSqlite];
    
    return YES;
}


-(void)creatSqlite
{
    NSLog(@"%@",NSHomeDirectory());
    
    // 1 创建文件管理者
    
    NSFileManager *manager=[NSFileManager defaultManager];
    
    // 2 判断数据库是否存在
    
    if ([manager fileExistsAtPath:KDataBaseFliePath]) {
        
        NSLog(@"数据库已经存在hahahhhhhhhhhhhhhhhhhhhaaaaaaaaaaaaaaaaaaaaaaa");
        return;
    }
    
    //2.1 如果不存在，就创建数据库
    
    [manager createFileAtPath:KDataBaseFliePath contents:nil attributes:nil];
    
    //3.1 打开数据库文件
    
    sqlite3 *sql =NULL;
    
    int openDbResult= sqlite3_open([KDataBaseFliePath UTF8String], &sql );
    
    if (openDbResult == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        
    }else{
        NSLog(@"打开失败");
        
        // 删除数据库
        
        [manager removeItemAtPath:KDataBaseFliePath error:nil];
        
        return;
    }
    
    // 4 创建表格   构建sql语句    构建id 作为主键 自动增长  username 不空 passname 不能空
    
    NSString *sqlString=@"CREATE TABLE USER(ID INTEGER PRIMARY KEY AUTOINCREMENT,username text NOT NULL UNIQUE,password text NOT NULL);";
    
    // 5 执行 sql语句
    //    sqlite3*,                /* 数据库指针 */
    //    const char *sql,                 /* 执行的sql语句 */
    //    int (*callback)(void*,int,char**,char**),      /* 函数指针，执行完成后，回调的函数 */
    //    void *,                           /* 回调函数的第一个参数 */
    //    char **errmsg                   /* 错误信息 */
    
    //
    char *errmsg=NULL;
    
    int execResult =sqlite3_exec(sql,[sqlString UTF8String],NULL,NULL,&errmsg);
    
    if (execResult == SQLITE_OK) {
        NSLog(@"创建表格成功");
    }else{
        NSLog(@"表格创建失败");
        
        [manager removeItemAtPath:KDataBaseFliePath error:NULL];
        
        return;
    }
    
    sqlite3_close(sql);
    
    
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
