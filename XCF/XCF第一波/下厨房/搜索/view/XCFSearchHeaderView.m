//
//  XCFSearchHeaderView.m
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFSearchHeaderView.h"

@implementation XCFSearchHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=XCFGlobalBackgroundColor;
        
        UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(17, 9, 80, 15)];
        title.textColor=XCFLabelColorGray;
        title.text=@"最近搜索";
        title.font=[UIFont systemFontOfSize:13];
        [self addSubview:title];
        
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(267, 11, 15, 15)];
        [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [button addTarget:self
                           action:@selector(clearAllHistory)
                 forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

-(void)clearAllHistory
{
    !self.clearBlock ?:self.clearBlock();
}

@end
