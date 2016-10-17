//
//  XCFBreakfastCell.m
//  XCF第一波
//
//  Created by admin on 16/10/3.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFBreakfastCell.h"
#import "XCFBreakfast.h"
#import "XCFAuthor.h"
@implementation XCFBreakfastCell





-(void)awakeFromNib{
    
}




-(void)setFood:(XCFBreakfast *)food{
    
    _food=food;
    
    [_pictures sd_setImageWithURL:[NSURL URLWithString:food.thumbnail_280]];
     
    _authorName.text=food.author.name;
    _authorName.font=[UIFont systemFontOfSize:13];
    _authorName.textAlignment=NSTextAlignmentCenter;
    _dishName.text=food.name;
    _dishName.font=[UIFont systemFontOfSize:13];
    _dishName.textAlignment=NSTextAlignmentCenter;
    _isGoodNum.text=food.npics;
    _isGoodNum.font=[UIFont systemFontOfSize:13];
    _isGoodNum.textAlignment=NSTextAlignmentCenter;

    
    [_goodButton setBackgroundImage:[UIImage imageNamed:@"dishPagerLiked"] forState:UIControlStateNormal];
}
















@end
