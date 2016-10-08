//
//  XCFSearchKeyWorlds.h
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFSearchKeyWorlds : NSObject




+(NSArray *)totalWords;

+(void)addNewWord:(NSString *)newWord;

+(void)removeAllWords;

@end
