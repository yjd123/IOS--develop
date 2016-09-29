//
//  CollectionView.m
//  电影院项目哦
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "CollectionView.h"

@implementation CollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    flowLayout.minimumLineSpacing=0;
    
    self=[super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        
        //        self.pagingEnabled=YES;
  
        self.decelerationRate=UIScrollViewDecelerationRateFast;
        
      
    }
    return self;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX=(self.frame.size.width-_pageWidth)/2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
  
    
    int index=(targetContentOffset->x+_pageWidth/2)/_pageWidth;
    
    targetContentOffset->x=index*_pageWidth;
    
    self.currectItem=index;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _pictureArray.count;
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_pageWidth, self.frame.size.height);
}


































/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
