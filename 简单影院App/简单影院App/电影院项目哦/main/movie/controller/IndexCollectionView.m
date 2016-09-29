//
//  IndexCollectionView.m
//  电影院项目哦
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"
@implementation IndexCollectionView{
    NSString *_indentifer;
}

-(instancetype)initWithFrame:(CGRect)frame{
   
    
    self=[super initWithFrame:frame];
    
    if (self) {
    
        _indentifer=@"IndexCell";
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:_indentifer];
    }
    return self;
}





-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currectItem!=indexPath.item) {
        //        IndexCell *pcell=(IndexCell *)[collectionView cellForItemAtIndexPath:indexPath];
        //
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currectItem=indexPath.item;
    }
}




-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:_indentifer forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.images=self.pictureArray[indexPath.item];
    
    return cell;
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
