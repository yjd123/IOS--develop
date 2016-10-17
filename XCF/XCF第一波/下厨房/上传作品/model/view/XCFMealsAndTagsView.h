//
//  XCFMealsAndTagsView.h
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFTagView;
@interface XCFMealsAndTagsView : UIView{
    NSInteger column;
    NSInteger line;
//    CGFloat width;
//    CGFloat height;
}


@property (weak, nonatomic) IBOutlet UIView *foodView;
@property (weak, nonatomic) IBOutlet UIButton *breakfast;
@property (weak, nonatomic) IBOutlet UIButton *lunch;
@property (weak, nonatomic) IBOutlet UIButton *dinner;

@property (weak, nonatomic) IBOutlet UIView *addTags;

@property (weak, nonatomic) IBOutlet UIButton *addTagButton;

@property(nonatomic,strong)NSArray *tagsArray;
@property(nonatomic,copy)void(^SelsctedMealBlock)();

@property(nonatomic,copy)void(^AddTagBlock)();
@property(nonatomic,strong)XCFTagView *tagView1;
@property(nonatomic,copy)void(^DeleteTagBlock)(NSUInteger);


@end
