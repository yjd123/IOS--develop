//
//  WechatModel.h
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WechatModel : NSObject

@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,assign,getter=isSelf)BOOL mySelf;

@end
