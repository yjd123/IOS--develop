//
//  ImageCollectionViewCell.h
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageScrollView;
@interface ImageCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)ImageScrollView *scrollView;

@property(nonatomic,copy)NSString *images;



@end
