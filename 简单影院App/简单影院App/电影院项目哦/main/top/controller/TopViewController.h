//
//  TopViewController.h
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property(nonatomic,strong)NSMutableArray *array;
@end
