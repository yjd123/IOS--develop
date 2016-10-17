//
//  XCFGoodsBottomView.m
//  XCF第一波
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsBottomView.h"


@implementation XCFGoodsBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _shopIcon = [[UIView alloc] init];
        _shopIcon.backgroundColor = [UIColor whiteColor];
        [self addSubview:_shopIcon];
        [_shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(60, 44));
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToShop)];
        [_shopIcon addGestureRecognizer:tap];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"tabBDeselected"];
        [self.shopIcon addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shopIcon);
            make.top.equalTo(self.shopIcon).offset(5);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = XCFLabelColorGray;
        label.text = @"店铺";
        [self.shopIcon addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shopIcon);
            make.top.equalTo(icon.mas_bottom).offset(5);
        }];
        
        
        
        
        _shopTalk = [[UIView alloc] init];
        _shopTalk.backgroundColor = [UIColor whiteColor];
        [self addSubview:_shopTalk];
        [_shopTalk mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self.shopIcon.mas_right).offset(-3);
            make.size.mas_equalTo(CGSizeMake(60, 44));
        }];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToTalk)];
        [_shopTalk addGestureRecognizer:tap1];
        
        UIImageView *talk = [[UIImageView alloc] init];
        talk.image = [UIImage imageNamed:@"tabCDeselected"];
        [self.shopTalk addSubview:talk];
        [talk mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shopTalk);
            make.top.equalTo(self.shopTalk).offset(5);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        UILabel *label1 = [[UILabel alloc] init];
        label1.font = [UIFont systemFontOfSize:10];
        label1.textColor = XCFLabelColorGray;
        label1.text = @"联系卖家";
        [self.shopTalk addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.shopTalk);
            make.top.equalTo(talk.mas_bottom).offset(3);
        }];
        
        
        _leftButton=[[UIButton alloc]init];
        _leftButton.backgroundColor=[UIColor redColor];
    [_leftButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_leftButton setTintColor:[UIColor whiteColor]];
        _leftButton.titleLabel.font=[UIFont systemFontOfSize:14];
        _leftButton.layer.cornerRadius=5;
        [_leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.shopTalk.mas_right).offset(3);
            make.size.mas_equalTo(CGSizeMake(99, 43));
        }];
        
        _rightButton=[[UIButton alloc]init];
        _rightButton.backgroundColor=[UIColor redColor];
        [_rightButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_rightButton setTintColor:[UIColor whiteColor]];
        _rightButton.layer.cornerRadius=5;
        _rightButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [_rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
   
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self);
            make.size.equalTo(self.leftButton);
        }];
        
    }
    return self;
}

- (void)goToShop {
    !self.actionBlock ? : self.actionBlock(BottomViewClickedGoToShop);
}

- (void)goToTalk {
    !self.actionBlock ? : self.actionBlock(BottomViewClickedGoToTalk);
}

- (void)leftButtonClicked:(UIButton *)sender {
    !self.actionBlock ? : self.actionBlock(BottomViewClickedAddToShoppingCart);
}

- (void)rightButtonClicked:(UIButton *)sender {
    !self.actionBlock ? : self.actionBlock(BottomViewClickedBuyNow);
}










@end
