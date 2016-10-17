//
//  XCFGoodsReviewView.h
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFGoods,StarView;

@interface XCFGoodsReviewView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>


@property(nonatomic,strong)XCFGoods *goods;

@property(nonatomic,copy)UIView *fooView;

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,copy)UILabel *pushLabel;

@property(nonatomic,strong)StarView *star;

@property(nonatomic,copy)UILabel *reviewLabel;


@property(nonatomic,copy)UILabel *reviewStar;


@property(nonatomic,copy)UIButton *lookReview;

@end
