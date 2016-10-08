//
//  XCFDishs.m
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFDishs.h"
#import "XCFPicture.h"
#import "XCFComment.h"
#import "XCFEvents.h"
#import "XCFAuthor.h"


@implementation XCFDishs


+(NSDictionary *)mj_objectClassInArray
{
    return @{@"extra_pic" : [XCFPicture class],
//             @"events" :    [XCFEvents class],
             @"latest_comments" : [XCFComment class]};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
-(CGFloat)cellHeight
{
    if (self.desc.length) {
        CGRect rect=[self.desc boundingRectWithSize:CGSizeMake(KScreenWidth-75, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
        
        return rect.size.height+110;
    }else{
        return 30;
    }
}






@end
