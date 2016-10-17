//
//  XCFTopicCell.h
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFTopic;

@interface XCFTopicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentsCount;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (nonatomic, strong) XCFTopic *topic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicTitle;

@property (weak, nonatomic) IBOutlet UILabel *stickIcon;
@property (weak, nonatomic) IBOutlet UIImageView *pictureIcon;

@end
