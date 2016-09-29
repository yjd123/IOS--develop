//
//  PosterCollectionView.m
//  电影院项目哦
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCollectionViewCell.h"


@implementation PosterCollectionView
{
    NSString *identity;
}

-(instancetype)initWithFrame:(CGRect)frame
{
   
    
    self=[super initWithFrame:frame ];
    
    if (self) {
        identity=@"PosterCollectionViewCell";
      
        
        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:identity];
    }
    return self;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currectItem==indexPath.item) {
        PosterCollectionViewCell *pcell=(PosterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pcell flipCell];
    }else{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currectItem=indexPath.item;
    }
    
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PosterCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    
    cell.message=self.pictureArray[indexPath.item];
    
    
    
    return cell;
    
}




-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([(PosterCollectionViewCell *)cell isFlip]==1  ) {
        [(PosterCollectionViewCell *)cell flipCell];
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
