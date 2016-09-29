//
//  PosterView.h
//  电影院项目哦
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView

@property(nonatomic,copy)NSMutableArray *array;

@property(nonatomic,copy)UIView *headViewBig;

@property(nonatomic,copy)UILabel *footViewLabel;

@property(nonatomic,strong)PosterCollectionView *collectionView;

@property(nonatomic,strong)IndexCollectionView *indexCollection;

@property(nonatomic,strong)NSMutableArray *dataImageSmall;



@end
