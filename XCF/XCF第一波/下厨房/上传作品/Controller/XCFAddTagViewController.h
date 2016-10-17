//
//  XCFAddTagViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFAddTagViewController : UIViewController

// F返回标签里的文字
@property(nonatomic,copy)void(^callBack)(NSString *);
@property(nonatomic,copy)UITextField *textField;

@end
