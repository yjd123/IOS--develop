//
//  XCFStepper.m
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFStepper.h"

@implementation XCFStepper

- (void)awakeFromNib {
    self.number = 1;
    
    [self.decreaseButton addTarget:self action:@selector(decrease:) forControlEvents:UIControlEventTouchUpInside];
    
     self.decreaseButton.layer.borderWidth=1.0;
    
    [self.increaseButton addTarget:self action:@selector(increase:) forControlEvents:UIControlEventTouchUpInside];
    self.increaseButton.layer.borderWidth=1.0;
    
}

#pragma mark - 事件处理

- (void)decrease:(UIButton *)sender {
    self.number--;
    if (self.number==0) {
        self.number=1;
    }
}

- (void)increase:(UIButton *)sender {
    self.number++;
}


- (void)setNumber:(NSUInteger)number {
    _number = number;
    
     
    
    if (number < 1) {
        
        number = 1;
        
        self.decreaseButton.enabled = NO;
    
    } else if (number > 1) {
        
        self.decreaseButton.enabled = YES;
        
    } else if (number == self.stock) {
        // 达到最大库存
        number = self.stock;
        
        self.increaseButton.enabled=NO;
    }
    self.stepValue.text = [NSString stringWithFormat:@"%ld", number];
    
    self.stepValue.layer.borderWidth=1.0;
    
    !self.goodsNumberChangedBlock ? : self.goodsNumberChangedBlock(self.number);
}

// 选择商品属性之前不能去选择商品数量

//- (void)setEnabled:(BOOL)enabled {
//    self.increaseButton.enabled = enabled;
//}

@end
