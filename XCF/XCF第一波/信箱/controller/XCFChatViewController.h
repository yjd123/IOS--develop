//
//  XCFChatViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFChatViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@property (weak, nonatomic) IBOutlet UITextField *textfield;


@property (weak, nonatomic) IBOutlet UIView *toolView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end
