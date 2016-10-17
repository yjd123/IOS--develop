//
//  XCFForumViewCell.h
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFForum;

@interface XCFForumViewCell : UITableViewCell
@property (nonatomic, strong) XCFForum *forum;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;

@end
