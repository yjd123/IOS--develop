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
#import "XCFViewController.h"
#import "XCFMarketViewController.h"
#import "XCFUserViewController.h"
#import "XCFEmailViewController.h"
@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //1.创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
////    //创建视图控制器
//    XCFViewController *mainVC = [[XCFViewController alloc]init];
//   
//    XCFUserViewController *search = [[XCFUserViewController alloc]init];
//  
//
//    
//    XCFMarketViewController *meVC = [[XCFMarketViewController alloc]init];
//
//    XCFEmailViewController *friendVC = [[XCFEmailViewController alloc]init];
//    
//
//    
//    //创建标签控制器
//    XCFTabBarController *tabBarController = [[XCFTabBarController alloc]init];
//    tabBarController.viewControllers = @[mainVC,meVC,friendVC,search];
//    
//    
//    
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
    
//
    
    return YES;
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
