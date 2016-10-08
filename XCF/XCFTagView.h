//
//  XCFTagView.h
//  XCF第一波
//
//  Created by admin on 16/9/19.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^deleteTagBlock)();

@interface XCFTagView : UIView


@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteTagButton;


@property(nonatomic,copy)deleteTagBlock callBack;

+(instancetype)tagViewWithString:(NSString *)string deleteTagBlock:(deleteTagBlock)callBack;


@end
