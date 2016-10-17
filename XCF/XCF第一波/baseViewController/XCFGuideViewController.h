//
//  XCFGuideViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ViewController.h"

@interface XCFGuideViewController : ViewController<UIScrollViewDelegate>{
    NSArray *array;
}

@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UIScrollView  *scroll;
@end
