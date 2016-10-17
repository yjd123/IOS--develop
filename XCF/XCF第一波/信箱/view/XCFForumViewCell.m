//
//  XCFForumViewCell.m
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFForumViewCell.h"
#import "XCFForum.h"
#import "XCFAuthor.h"
@implementation XCFForumViewCell

- (void)awakeFromNib {
    
}

- (void)setForum:(XCFForum *)forum {
    _forum = forum;
    
    self.nameLabel.text = forum.name;
    self.descLabel.text = forum.desc;
    
    NSString *url=forum.latest_authors[0].photo60;
    
    [_imageViewIcon sd_setImageWithURL:[NSURL URLWithString:url]];


}



@end
