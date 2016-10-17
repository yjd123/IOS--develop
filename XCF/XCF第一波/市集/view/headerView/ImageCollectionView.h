//
//  ImageCollectionView.h
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageCollectionViewCell;
@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>



@property(nonatomic,copy)NSArray *array;

@property(nonatomic,strong)ImageCollectionViewCell *cell;

@property(nonatomic,assign)NSInteger currectItems;

@end
