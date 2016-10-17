//
//  XCFUpLoadViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFTextAndPhotoView;
@class XCFMealsAndTagsView;
@interface XCFUpLoadViewController : UITableViewController{
    UIView *_headerView;
    
}

@property(nonatomic,strong)XCFTextAndPhotoView *textPhotoView;
@property(nonatomic,strong)XCFMealsAndTagsView *mealsAndTags;
@property(nonatomic,strong)NSMutableArray *photosArr;
@property(nonatomic,copy)NSMutableArray *tagsArr;
@property(nonatomic,assign)CGFloat photoTextHeight;
@property(nonatomic,assign)CGFloat mealsAndTagsHeight;
@end
