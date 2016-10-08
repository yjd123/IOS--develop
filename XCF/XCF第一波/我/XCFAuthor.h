//
//  XCFAuthor.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFAuthor : NSObject

// 本地头像
@property (nonatomic, strong) UIImage *image;
/** 头像 (尺寸60）*/
@property (nonatomic, copy) NSString *photo;
/** 头像（尺寸60）*/
@property (nonatomic, copy) NSString *photo60;
/** 头像（尺寸160）*/
@property (nonatomic, copy) NSString *photo160;
/** 昵称 */
@property (nonatomic, copy) NSString *name;
/** 是否专家 */
@property (nonatomic, assign) BOOL is_expert;
/** 当前地址 */
@property (nonatomic, copy) NSString *current_location;
/** 家乡 */
@property (nonatomic, copy) NSString *hometown_location;
/** 邮箱 */
@property (nonatomic, copy) NSString *mail;
/** 用户id */
@property (nonatomic, copy) NSString *ID;



@end
