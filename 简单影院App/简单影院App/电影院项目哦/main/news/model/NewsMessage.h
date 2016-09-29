//
//  NewsMessage.h
//  电影院项目哦
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsMessage : NSObject

@property(nonatomic,strong)NSNumber *newsId;

@property(nonatomic,strong)NSNumber *type;

@property(nonatomic,copy)NSString *title;
    
@property(nonatomic,copy)NSString *image;
    
@property(nonatomic,copy)NSString *summary;
    
    
    
    

@end
