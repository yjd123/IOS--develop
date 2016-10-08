//
//  XCFGoodsReviewView.m
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsReviewView.h"
#import "XCFGoodsReviewCell.h"
#import "XCFGoods.h"
#import "XCFReview.h"
#import "StarView.h"
@implementation XCFGoodsReviewView

static NSString *const reviewIdentifier=@"reviewCell";

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor colorWithWhite:1 alpha:.1];
        _reviewLabel=[[UILabel alloc]init];
        _reviewLabel.textAlignment=NSTextAlignmentCenter;
        _reviewLabel.font=[UIFont systemFontOfSize:14];
        [self addSubview:_reviewLabel];
        [_reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.mas_top);
            make.width.mas_equalTo(@(150));
        }];
        
        _reviewStar=[[UILabel alloc]init];
        _reviewStar.font=[UIFont systemFontOfSize:14];
        [self addSubview:_reviewStar];
        [_reviewStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(60);
            make.top.equalTo(self.mas_top).offset(25);
            make.width.mas_equalTo(@(80));
        }];
        
        _star=[[StarView alloc]init];
        [self addSubview:_star];
        [_star mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.reviewStar.mas_left).offset(-30);
            make.centerY.equalTo(self.reviewStar.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(60, 17));
        }];
        
        
        _lookReview=[UIButton borderButtonWithBackgroundColor:[UIColor whiteColor]
                                                title:@"查看评论" titleLabelFont:[UIFont systemFontOfSize:15]
                                                        titleColor:[UIColor redColor]
                                                            target:self
                                                       action:@selector(buttonAction)];
        
        [self addSubview:_lookReview];
        [_lookReview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-8);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 40));
        }];
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(200, 340);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, KScreenWidth, 340) collectionViewLayout:flowLayout];
        
      
        _collectionView.backgroundColor=[UIColor colorWithWhite:1 alpha:.1];
        
        [self addSubview: _collectionView];
        
        // 单元格注册
        
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XCFGoodsReviewCell class]) bundle:nil]forCellWithReuseIdentifier:reviewIdentifier];
        
//        _collectionView.automaticallyAdjustsScrollViewInsets=NO;
        
        
    }
    return self;
}



-(void)setGoods:(XCFGoods *)goods
{
    _goods=goods;
    
    _reviewLabel.text=[NSString stringWithFormat:@"%@ 个人评价",goods.n_reviews];
    _reviewStar.text=[NSString stringWithFormat:@"%.1lf 星",goods.average_rate];
    
    _star.score=goods.average_rate;
    
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    
    
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.goods.reviews.count);
    return self.goods.reviews.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XCFGoodsReviewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reviewIdentifier forIndexPath:indexPath];
    
    cell.review=self.goods.reviews[indexPath.item];
    
   
    
    return cell;
}



-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX=(self.frame.size.width-200)/2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
}

-(void)buttonAction{
    
}













@end
