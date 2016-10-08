//
//  ImageViewController.h
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageCollectionView;
@interface ImageViewController : UIViewController
{
    BOOL _isHiden;
}

@property(nonatomic,copy)NSArray *imageArr;
@property(nonatomic,strong)ImageCollectionView *collectionView;

@property(nonatomic,strong)NSIndexPath *indexPath;



@end
