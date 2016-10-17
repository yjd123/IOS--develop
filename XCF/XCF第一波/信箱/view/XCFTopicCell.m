//
//  XCFTopicCell.m
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFTopicCell.h"
#import "XCFTopic.h"
#import "XCFAuthor.h"

@implementation XCFTopicCell

- (void)awakeFromNib {
    
    
    
}

- (void)setTopic:(XCFTopic *)topic {
    _topic = topic;
    
    if (topic.is_sticked) {
        self.stickIcon.hidden = NO;
        self.topicTitle.text =[NSString stringWithFormat:@"      %@",topic.content];
       
    } else {
        self.stickIcon.hidden = YES;
          self.topicTitle.text =topic.content;
    }
    
    [self.pictureIcon sd_setImageWithURL:[NSURL URLWithString:topic.author.photo60]];
    self.nameLabel.text = topic.author.name;
 
    self.updateTime.text = [NSString stringWithFormat:@"最后回应：%@", topic.update_time];
    self.commentsCount.text = [NSString stringWithFormat:@"%@评论", topic.n_comments];
    
}

@end
