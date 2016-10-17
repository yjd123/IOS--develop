//
//  XCFUserViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XCFUserViewController : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>


//新浪微博对象
@property ( nonatomic,strong) SinaWeibo *sinaWeibo;

@property(nonatomic,strong)UITableView *table;

@end
