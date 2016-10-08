//
//  XCFAttrsCell.h
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFAttrsCell : UITableViewCell

@property (nonatomic, strong) UILabel *label;

/** 模型数据 */
@property (nonatomic, strong)NSDictionary *attrs;

@end
