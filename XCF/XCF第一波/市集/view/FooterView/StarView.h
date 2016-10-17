//
//  StarView.h
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView

{
    UIView *_yellowView;
    UIView *_grayView;
    UIImage *_image1;
    UIImage *_image2;
}
@property(nonatomic,assign)CGFloat score;

@end
