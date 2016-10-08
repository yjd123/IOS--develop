//
//  XCFItems.m
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFItems.h"
#import "XCFContents.h"
#import "XCFImage.h"
@implementation XCFItems

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}

- (CGFloat)cellHeight {
    
    if (self.template == XCFCellTemplateTalk || self.template == XCFCellTemplateRecipe ||self.template == XCFCellTemplateTopic) {
        
        CGFloat imageHeight = self.contents.image.height;
        
        CGFloat titleHeight = 20;
        CGFloat descHeight = 10;
        _cellHeight = imageHeight  + titleHeight  + descHeight + 60;
        
        
    } else if (self.template == XCFCellTemplateRecipeList  || self.template == XCFCellTemplatewhisper || self.template==XCFCellTemplateWeeklyMagazine) {
        _cellHeight = self.contents.image.height;
        if (self.contents.image.height > 250) {
            _cellHeight=250;
        }
    }
    
    return _cellHeight;
}
@end
