

#import "XCFGoods.h"
#import "XCFReviewPhoto.h"
#import "XCFShop.h"
#import "XCFReview.h"
#import "XCFGoodsKind.h"

@implementation XCFGoods



+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
//
//
//             @"attrs" : [XCFGoodsAttrs class],
//             @"kinds" : [XCFGoodsKind class],
//             @"promotion_text_list" : [NSString class],
             @"reviews" : [XCFReview class]};
    
    
}
@end
