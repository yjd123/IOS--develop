//
//  CollectionView.h
//  电影院项目哦
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>


@property(nonatomic,copy)NSArray *pictureArray;

@property(nonatomic,assign)CGFloat pageWidth;

@property(nonatomic,assign)NSInteger currectItem;//记录当前选中的单元格


@end
