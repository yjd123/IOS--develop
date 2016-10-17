//
//  MessageCell.h
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WechatModel;
@interface MessageCell : UITableViewCell
//头像图片
@property(nonatomic,strong)UIImageView *iconImageView;//要读取的就是model里面的图片名

//文本内容
@property(nonatomic,strong)UILabel *chatLabel;//读取model里面的content

//聊天框背景
@property(nonatomic,strong)UIImageView *bgImageView;
//model
@property(nonatomic,strong)WechatModel *chatModel;

@end
