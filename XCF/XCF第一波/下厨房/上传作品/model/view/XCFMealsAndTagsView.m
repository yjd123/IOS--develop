//
//  XCFMealsAndTagsView.m
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFMealsAndTagsView.h"
#import "XCFTagView.h"
@implementation XCFMealsAndTagsView



- (void)awakeFromNib {
    [self.breakfast addTarget:self
                       action:@selector(selectedBreakfast:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.lunch addTarget:self
                   action:@selector(selectedLunch:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.dinner addTarget:self
                    action:@selector(selectedDinner:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.addTagButton addTarget:self
                          action:@selector(addTag)
                forControlEvents:UIControlEventTouchUpInside];
    self.addTags.backgroundColor=XCFGlobalBackgroundColor;
   
}

-(void)selectedBreakfast:(UIButton *)button
{
    button.selected=YES;
    button.backgroundColor=[UIColor redColor];
    self.lunch.selected = NO;
    self.lunch.backgroundColor=[UIColor lightGrayColor];
    self.dinner.selected = NO;
    self.dinner.backgroundColor=[UIColor lightGrayColor];
    
    !self.SelsctedMealBlock ? :self.SelsctedMealBlock(button.titleLabel.text);
    
    
}
-(void)selectedLunch:(UIButton *)button
{
   button.selected=YES;
    button.backgroundColor=[UIColor redColor];
    self.breakfast.selected=NO;
    self.breakfast.backgroundColor=[UIColor lightGrayColor];
    self.dinner.selected = NO;
    self.dinner.backgroundColor=[UIColor lightGrayColor];
    !self.SelsctedMealBlock ? :self.SelsctedMealBlock(button.titleLabel.text);
}
-(void)selectedDinner:(UIButton *)button
{
    button.selected=YES;
  button.backgroundColor=[UIColor redColor];
     self.lunch.selected = NO;
      self.breakfast.backgroundColor=[UIColor lightGrayColor];
     self.lunch.backgroundColor=[UIColor lightGrayColor];
     self.breakfast.selected=NO;
    !self.SelsctedMealBlock ? :self.SelsctedMealBlock(button.titleLabel.text);
}

-(void)addTag{
    !self.AddTagBlock ?:self.AddTagBlock();
}

-(void)setTagsArray:(NSArray *)tagsArray
{
      _tagsArray=tagsArray;
  
     //先移除之前的视图
    for (UIView *subview in self.addTags.subviews) {
        [subview removeFromSuperview];
    }
    
    //对标签进行布局
        NSInteger lineCount=3;
    
    
    if (tagsArray.count)
    {
        for (int index=0; index<tagsArray.count; index++) {
            
            NSString *tagstring=tagsArray[index];
            line=index/lineCount;
            column=index%lineCount;
            
            WeakSelf;
            
            _tagView1=[XCFTagView tagViewWithString:tagstring deleteTagBlock:^{
                !weakSelf.DeleteTagBlock ?:weakSelf.DeleteTagBlock(index);
            }];
            CGFloat width=100;
            CGFloat height=30;
            _tagView1.frame=CGRectMake(103*column+6, line*35, width, height);
            [self.addTags addSubview:_tagView1];
        }
        }
    
    
    
    
}



























@end
