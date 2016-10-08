//
//  XCFTextAndPhotoView.h
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFTextAndPhotoView : UIView
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *photosView;



@property(nonatomic,copy)UILabel *label;
@property(nonatomic,strong)NSMutableArray *photoArray; // 照片数组

@property(nonatomic,copy)void(^InputTextBlock)(NSString *);// 输入文字

@property(nonatomic,copy)void(^AddPhotoBlock)();

@property(nonatomic,copy)void(^DeletePhotoBlock)(NSUInteger);

@end
