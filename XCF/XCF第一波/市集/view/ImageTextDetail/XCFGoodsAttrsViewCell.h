//
//  XCFGoodsAttrsViewCell.h
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFGoodsAttrsViewCell : UICollectionViewCell<UITableViewDataSource,UITableViewDelegate>

/** 详细属性 */
@property (nonatomic, strong) NSArray *attrsArray;
/** 隐藏图文详情界面 */
@property (nonatomic, copy) void (^viewWillDismissBlock)();

@property (nonatomic, strong) UITableView *tableView;

@end
