//
//  ImageViewController.h
//  电影院项目哦
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageCollectionView;
@interface ImageViewController : UIViewController
{
    BOOL _isHiden;
}

@property(nonatomic,copy)NSArray *arr;
@property(nonatomic,strong)ImageCollectionView *collectionView;

@property(nonatomic,strong)NSIndexPath *indexPath;
@end
