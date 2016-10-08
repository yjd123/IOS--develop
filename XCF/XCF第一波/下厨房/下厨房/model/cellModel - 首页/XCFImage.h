//
//  XCFImage.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFImage : NSObject

/** 图片地址 */
@property (nonatomic, copy) NSString *url;
/** 图片宽度 */
@property (nonatomic, assign) CGFloat width;
/** 图片高度 */
@property (nonatomic, assign) CGFloat height;



@end
