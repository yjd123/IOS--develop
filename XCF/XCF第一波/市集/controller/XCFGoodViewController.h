//
//  XCFGoodViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFGoods,XCFHeaderImageView,XCFGoodsDetailView,XCFGoodsBottomView,XCFGoodsReviewView;


@interface XCFGoodViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)XCFGoods *goods;

@property(nonatomic,strong)XCFGoodsDetailView *goodsDetail;

@property(nonatomic,strong)XCFGoodsBottomView *bottomView;

@property(nonatomic,strong)XCFGoodsReviewView *reviewView;

@property(nonatomic,copy)NSMutableArray *images;

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)UITableView *table;

@property(nonatomic,copy)UIPageControl *pageCtrl;

@property(nonatomic,copy)UIView *headView;

@property(nonatomic,copy)UIView *footView;

@end
