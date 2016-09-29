//
//  ImageScrollView.h
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
    
}

@property(nonatomic,copy)NSString *picture;
@end
