//
//  XCFTagView.m
//  XCF第一波
//
//  Created by admin on 16/9/19.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFTagView.h"

@implementation XCFTagView

-(void)awakeFromNib
{
    
    [_deleteTagButton addTarget:self action:@selector(deleteTag1) forControlEvents:UIControlEventTouchUpInside];
    
    _tagLabel.font=[UIFont systemFontOfSize:13];
    _tagLabel.textAlignment=NSTextAlignmentCenter;
    _tagLabel.textColor=[UIColor whiteColor];
    
}

-(void)deleteTag1
{
    !self.callBack?:self.callBack();
}

+(instancetype)tagViewWithString:(NSString *)string deleteTagBlock:(deleteTagBlock)callBack{
    
    XCFTagView *tagView=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]lastObject];
    tagView.tagLabel.text=string;
    tagView.callBack=callBack;
    
    return tagView;
}

@end
