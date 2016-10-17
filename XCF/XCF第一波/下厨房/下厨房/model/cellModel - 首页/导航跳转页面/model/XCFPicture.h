//
//  XCFPicture.h
//  XCF第一波
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFPicture : NSObject

/** 大图片（尺寸600）*/
@property (nonatomic, copy) NSString *bigPhoto;
/** 小图片（尺寸280）*/
@property (nonatomic, copy) NSString *smallPhoto;
/** 标识 */
@property (nonatomic, copy) NSString *ident;



@end
