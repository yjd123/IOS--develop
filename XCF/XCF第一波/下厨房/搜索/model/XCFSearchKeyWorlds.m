//
//  XCFSearchKeyWorlds.m
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFSearchKeyWorlds.h"

@implementation XCFSearchKeyWorlds
 static   NSMutableArray *_wordsArray;

+(NSArray *)totalWords{
    
    NSArray *array=[[NSUserDefaults standardUserDefaults]objectForKey:@"kWords"];
    _wordsArray=[NSMutableArray arrayWithArray:array];
    
    if (!_wordsArray.count) {
        _wordsArray=[NSMutableArray array];
    }
    return _wordsArray;
    
}

+(void)addNewWord:(NSString *)newWord
{
    for (int index=0; index<_wordsArray.count; index++) {
        NSString *str=_wordsArray[index];
        if ([newWord isEqualToString:str]) {
            [_wordsArray removeObjectAtIndex:index];
        }
        
    }
    [_wordsArray insertObject:newWord atIndex:0];
    [self update];
}

+(void)removeAllWords
{
    [_wordsArray removeAllObjects];
    [self update];
}

+(void)update{
    NSArray *saveArray=[NSArray arrayWithArray:_wordsArray];
    [[NSUserDefaults standardUserDefaults]setObject:saveArray forKey:@"kWords"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


@end
