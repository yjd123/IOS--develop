//
//  XCFReview.m
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFReview.h"
#import "XCFReviewPhoto.h"

@implementation XCFReview

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}


//+ (NSDictionary *)mj_objectClassInArray {
//    return @{@"photos" : [XCFReviewPhoto class]
////             @"additional_review_photos" : [XCFReviewPhoto class],
////             @"lasted_comments" : [XCFComment class]};
//             };
//
//}
@end
