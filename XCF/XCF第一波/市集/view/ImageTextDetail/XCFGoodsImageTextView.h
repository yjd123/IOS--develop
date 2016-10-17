//
//  XCFGoodsImageTextView.h
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFGoods;
@interface XCFGoodsImageTextView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>


/** 模型数据 */
@property (nonatomic, strong) XCFGoods *goods;
/** 隐藏图文详情界面 */
@property (nonatomic, copy) void (^viewWillDismissBlock)();

@property (nonatomic, strong) UIView    *navView;           // 导航view
@property (nonatomic, strong) UIButton   *detailButton;      // 详情btn
@property (nonatomic, strong) UIButton  *attrsButton;       // 规格btn
@property (nonatomic, strong) UIView  *indexView;         // 下标view
@property (nonatomic, strong) UICollectionView  *collectionView;    // 主体
@property (nonatomic, assign) NSInteger index;              // 当前下标


@end
