//
//  TopModel.h
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject

// 评分
@property(nonatomic,strong)NSNumber *average;
//标题
@property(nonatomic,copy)NSString *title;
//原标题
@property(nonatomic,copy)NSString *originalTitle;
//种类
@property(nonatomic,copy)NSString *subtype;
//年份
@property(nonatomic,copy)NSString *year;
//照片
@property(nonatomic,copy)NSDictionary *images;
//电影id
@property(nonatomic,copy)NSString *movieID;
//收藏人数
@property(nonatomic,strong)NSNumber *collectNumber;

@property(nonatomic,copy)NSString *userImage;

@property(nonatomic,copy)NSString *nickname;

@property(nonatomic,copy)NSString *content;

@property(nonatomic,strong)NSNumber *rating;





@end
