//
//  XCFSearchFootView.m
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFSearchFootView.h"

@implementation XCFSearchFootView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        self.backgroundColor=XCFGlobalBackgroundColor;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 9, 80, 15)];
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.textColor = XCFLabelColorGray;
        titleLabel.text = @"流行搜索";
        [self addSubview:titleLabel];
        [self loadData];
        NSInteger index=0;
        for (int i=0; i<3; i++) {
            for (int k=0; k<3;k++) {
                UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(107*i, 35+31*k, 105.5,28)];
                button.backgroundColor = [UIColor whiteColor];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button setTitle:_buttonWords[index] forState:UIControlStateNormal];
                button.tag=100+index;
                index++;
                button.titleLabel.font = [UIFont systemFontOfSize:14];
                 [button addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
            }
        }
    }
    return self;
}

-(void)search:(UIButton *)sender
{
    !self.searchCallBack ?:self.searchCallBack(sender.tag);
}

-(void)loadData{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"keywords" ofType:@"plist"];
    
    NSDictionary *dic=[[NSDictionary alloc]initWithContentsOfFile:filePath];
    
    NSDictionary *content=[dic objectForKey:@"content"];
    NSArray *array=[content objectForKey:@"keywords"];
    NSNumber *total=[content objectForKey:@"total"];
    NSInteger totalNumber=[total integerValue];
    
    _keyWords=[NSMutableArray array];
    _buttonWords=[NSMutableArray array];
    
    for (NSString *str in array) {
        [_keyWords addObject:str];
    }
    for (int i=0; i<9; i++) {
        NSInteger index=arc4random() %totalNumber;
        NSString *string=_keyWords[index];
        [_buttonWords addObject:string];
    }
    
}






@end
