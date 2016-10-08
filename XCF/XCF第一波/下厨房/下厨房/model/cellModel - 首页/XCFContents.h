//
//  XCFContents.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFImage, XCFAuthor;

@interface XCFContents : NSObject

//模板1、2、4、5、6
/** 图片内容 */
@property (nonatomic, strong) XCFImage *image;

//模板1、5
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 描述 */
@property (nonatomic, copy) NSString *desc;

//模板2
/** 大标题 */
@property (nonatomic, copy) NSString *title_1st;
/** 小标题 */
@property (nonatomic, copy) NSString *title_2nd;

//模板4
/** 标题 */
@property (nonatomic, copy) NSString *whisper;

//模板5
/** 视频地址 */
@property (nonatomic, copy) NSString *video_url;
/** 作者 */
@property (nonatomic, strong) XCFAuthor *author;
/** 做过的人数 */
@property (nonatomic, assign) NSUInteger n_cooked;
/** 回答过 */
@property (nonatomic, assign) NSUInteger n_discussions;
/** 分数 */
@property (nonatomic, assign) NSUInteger score;
/** 食谱id */
@property (nonatomic, strong) NSString *recipe_id;



@end
