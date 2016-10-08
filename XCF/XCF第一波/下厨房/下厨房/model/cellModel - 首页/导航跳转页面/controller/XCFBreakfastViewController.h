//
//  XCFBreakfastViewController.h
//  XCF第一波
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFBreakfastViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,copy) UICollectionView *collectionView;

@property(nonatomic,copy)UIView *headView;

@property (nonatomic, copy) NSMutableArray *feedsArray;       // 动态数据

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *desc;

@property(nonatomic,copy)NSString *n_dishes;



@end
