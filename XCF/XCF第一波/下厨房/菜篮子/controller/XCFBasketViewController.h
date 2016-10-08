//
//  XCFBasketViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/24.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFBasketViewController : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_nameArr;
    NSMutableArray *_modelArr;
    NSArray *_array;
     BOOL compare[20];//判断是否让cell隐藏
}

@property(nonatomic,copy)UILabel *label;
@property(nonatomic,strong)UITableView *table;

@property(nonatomic,copy)UILabel *foodName;
@property(nonatomic,copy)UILabel *amount;

@end
