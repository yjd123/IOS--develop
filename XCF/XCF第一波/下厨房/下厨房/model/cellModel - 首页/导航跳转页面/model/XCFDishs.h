//
//  XCFDishs.h
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  XCFAuthor,XCFDiggUsers,XCFComment,XCFPicture,XCFEvents;


@interface XCFDishs : NSObject

//* 最后评论
@property (nonatomic, strong) NSArray<XCFComment *> *latest_comments;

/** 附加图 */
@property (nonatomic, strong) NSArray *extra_pics;

/** 点赞用户 */
@property (nonatomic, strong) XCFDiggUsers *digg_users;

///** 作者的数据 */
@property (nonatomic, strong) NSArray *events;

///** 主图 */
@property (nonatomic, strong) NSDictionary *main_pic;

/** 发表动态的作者 */
@property (nonatomic, strong) XCFAuthor *author;


/** 标识（图片名字） */
@property (nonatomic, copy) NSString *ident;
/** 图片地址（尺寸600） */
@property (nonatomic, copy) NSString *photo;
/** 缩略图 */
@property (nonatomic, copy) NSString *thumbnail;
/** 缩略图（尺寸160） */
@property (nonatomic, copy) NSString *thumbnail_160;
/** 缩略图（尺寸280） */
@property (nonatomic, copy) NSString *thumbnail_280;

/** 显示时间 */
@property (nonatomic, copy) NSString *friendly_create_time;
/** 创建时间 */
@property (nonatomic, copy) NSString *create_time;
/** 图片总数 */
@property (nonatomic, assign) NSInteger npics;
/** 评论数 */
@property (nonatomic, assign) NSInteger ncomments;

/** 菜谱名称\要显示的标题 */
@property (nonatomic, copy) NSString *name;
/** 文字描述 */
@property (nonatomic, copy) NSString *desc;

/** 菜谱id */
@property (nonatomic, copy) NSString *ID;

/** 点赞数 */
@property (nonatomic, copy) NSString *ndiggs;

/** 菜谱id 返回值一直是0 作用未知*/
@property (nonatomic, copy) NSString *recipe_id;
/** 是否为分享的内容 */
@property (nonatomic, assign) BOOL is_orphan;
/** 未知 */
@property (nonatomic, assign) BOOL digged_by_me;

///** 作品descHeight */
//@property (nonatomic, assign) CGFloat cellHeight;
//
///** 作品commentViewHeight */
//@property (nonatomic, assign) CGFloat commentViewHeight;


@end
