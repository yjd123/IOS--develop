//
//  XCFBasketCell.m
//  XCF第一波
//
//  Created by admin on 16/9/24.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFBasketCell.h"
#import "XCFBasketModel.h"
@implementation XCFBasketCell

- (void)awakeFromNib {

    _foodName.font=[UIFont systemFontOfSize:13];

    _amount.font=[UIFont systemFontOfSize:13];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
