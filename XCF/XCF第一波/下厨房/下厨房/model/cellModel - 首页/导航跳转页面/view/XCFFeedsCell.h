//
//  XCFFeedsCell.h
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFDishs;

@interface XCFFeedsCell : UITableViewCell
// 头视图
@property(nonatomic,strong)UIView *headView;

/** 数据 */
@property(nonatomic,strong)XCFDishs *dish;
/** 作者头像 */
@property(nonatomic,strong)UIImageView *authorIcon;
/** 作者名字 */
@property(nonatomic,strong)UILabel *authorName;
/** 分享到3个字*/
@property(nonatomic,strong)UILabel *authorName2;
/** 发布时间 */
@property(nonatomic,strong)UILabel *upLoadTime;
/** （推广专题?）标题 */
@property(nonatomic,strong)UILabel *tagView;
/** （推广专题?）标题  右边箭头*/
@property(nonatomic,strong)UIImageView *rightImage;
/** 作品描述 */
@property(nonatomic,strong)UILabel *desc;
/** 点赞人数 */
@property(nonatomic,strong)UILabel *ndiggsNumber;
/** 最后一个评论 */
@property(nonatomic,strong)UILabel *latest_comments;

/** 所有评论 */
@property(nonatomic,strong)UILabel *all_comments;

/** 点赞图标 */
@property(nonatomic,strong)UIButton *ndiggs;
/** 评论图标 */
@property(nonatomic,strong)UIButton *comments;

@end
