//
//  ImageCollectionView.m
//  电影院项目哦


#import "ImageCollectionView.h"
#import "ImageCollectionViewCell.h"
@implementation ImageCollectionView 

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
        
        [self registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _array.count;

}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.images=_array[indexPath.item];
    cell.backgroundColor=[UIColor grayColor];
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
