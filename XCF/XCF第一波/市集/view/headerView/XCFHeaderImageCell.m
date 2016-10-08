//
//  XCFHeaderImageCell.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFHeaderImageCell.h"

@implementation XCFHeaderImageCell


-(void)awakeFromNib{
    
}



-(void)setUrl:(NSString *)url
{
    _url=url;
    
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:url]];
    
    
}


@end
