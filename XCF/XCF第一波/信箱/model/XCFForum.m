//
//  XCFForum.m
//  XCF第一波
//
//  Created by admin on 16/10/16.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFForum.h"
#import "XCFAuthor.h"
@implementation XCFForum

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"latest_authors" : [XCFAuthor class]};
}


@end
