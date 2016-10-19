//
//  XCFUserViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XCFUserViewController : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,strong)UITableView *table;

@property(nonatomic,copy)   UILabel *titleLabel;

@property(nonatomic,copy)NSString *text;

@end
