//
//  StarView.h
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieTableViewCell;
@interface StarView : UIView
{
    UIView *_yellowView;
    UIView *_grayView;
    UIImage *_image1;
    UIImage *_image2;
}
@property(nonatomic,assign)CGFloat score;
@end
