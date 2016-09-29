//
//  ImageCollectionView.h
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageCollectionViewCell;


@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>



@property(nonatomic,copy)NSArray *array;

@property(nonatomic,strong)ImageCollectionViewCell *cell;


@end
