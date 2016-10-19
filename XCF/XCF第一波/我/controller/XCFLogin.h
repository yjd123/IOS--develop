//
//  XCFLogin.h
//  XCF第一波
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFLogin : UIViewController<UITextFieldDelegate>
//新浪微博对象
@property ( nonatomic,strong) SinaWeibo *sinaWeibo;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *weiboButton;




@end
