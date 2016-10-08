//
//  ImageCollectionView.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "ImageCollectionView.h"
#import "ImageCollectionViewCell.h"
@implementation ImageCollectionView
static NSString * const cellIdentifier = @"imageCell";

-(instancetype)initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayOut=[[UICollectionViewFlowLayout alloc]init];
    flowLayOut.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    flowLayOut.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    self=[super initWithFrame:frame collectionViewLayout:flowLayOut];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.pagingEnabled=YES;
        flowLayOut.minimumLineSpacing=0;
        
        [self registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _array.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.images=_array[indexPath.item];
    cell.backgroundColor=[UIColor grayColor];
    
    self.currectItems=indexPath.item;
    
    
    return cell;
}




@end
