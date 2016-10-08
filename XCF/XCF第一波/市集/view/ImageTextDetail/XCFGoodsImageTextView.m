//
//  XCFGoodsImageTextView.m
//  XCF第一波
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsImageTextView.h"
#import "XCFGoods.h"
#import "XCFGoodsAttrsViewCell.h"

@implementation XCFGoodsImageTextView

static NSString * const detailCellIdentifier = @"detailCell";
static NSString * const attrsCellIdentifier = @"attrsCell";

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        CGFloat navViewWidth = self.bounds.size.width;
        CGFloat navViewHeight = 44;
        // 导航
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, navViewWidth, navViewHeight)];
        [self addSubview:_navView];
        
        
        // 详情
        _detailButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, navViewWidth*0.5, navViewHeight)];
        _detailButton.backgroundColor = XCFDishViewBackgroundColor;
        _detailButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_detailButton setTitle:@"详情" forState:UIControlStateNormal];
        [_detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      
        [self.navView addSubview:_detailButton];
        _detailButton.selected = YES;
        [_detailButton addTarget:self
                          action:@selector(scrollToDetailView)
                forControlEvents:UIControlEventTouchUpInside];
        
        
        // 规格
        _attrsButton = [[UIButton alloc] initWithFrame:CGRectMake(navViewWidth*0.5, 0, navViewWidth*0.5, navViewHeight)];
        _attrsButton.backgroundColor = XCFDishViewBackgroundColor;
        _attrsButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_attrsButton setTitle:@"规格" forState:UIControlStateNormal];
        [_attrsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        [self.navView addSubview:_attrsButton];
        [_attrsButton addTarget:self
                         action:@selector(scrollToAttrsView)
               forControlEvents:UIControlEventTouchUpInside];
        
        // 下标
        _indexView = [[UIView alloc] initWithFrame:CGRectMake(0, navViewHeight-2, navViewWidth*0.5, 2)];
        _indexView.backgroundColor = XCFThemeColor;
        [self.navView addSubview:_indexView];
        
        
        // 加collectionView
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height-44);
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             44,
                                                                             self.bounds.size.width,
                                                                             self.bounds.size.height-44)
                                             collectionViewLayout:flowLayout];
        // 注册2个单元格
        
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:detailCellIdentifier];
        
        [_collectionView registerClass:[XCFGoodsAttrsViewCell class]
            forCellWithReuseIdentifier:attrsCellIdentifier];
        
       
        _collectionView.pagingEnabled = YES;
        
        _collectionView.backgroundColor = XCFGlobalBackgroundColor;
        
        [self addSubview:_collectionView];
        
        
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    
    if (indexPath.item==0) {
       cell = [collectionView dequeueReusableCellWithReuseIdentifier:detailCellIdentifier
                                                         forIndexPath:indexPath];
        NSInteger tag = 111;
        UIWebView *webView = [cell.contentView viewWithTag:tag];
        if (!webView) {
            webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  cell.contentView.bounds.size.width,
                                                                  cell.contentView.bounds.size.height)];
            webView.backgroundColor = XCFGlobalBackgroundColor;
            webView.tag = tag;
            webView.scrollView.delegate = self;
            [cell.contentView addSubview:webView];
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.goods.img_txt_detail_url]];
            
           
            
            [webView loadRequest:request];

         }
        return cell;
    }else if (indexPath.item==1){
        
        XCFGoodsAttrsViewCell *attrscell = [collectionView dequeueReusableCellWithReuseIdentifier:attrsCellIdentifier forIndexPath:indexPath];
        attrscell.attrsArray=self.goods.attrs;
        
        attrscell.viewWillDismissBlock=self.viewWillDismissBlock;
        
        cell=attrscell;
        
    }
    return cell;
}



- (void)setGoods:(XCFGoods *)goods {
    _goods = goods;
   
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
//    [_collectionView reloadData];
}

// 返回上个视图

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView.contentOffset.y <-100) {
        !self.viewWillDismissBlock ? : self.viewWillDismissBlock();
        
    }
}


// collectionview 左右滑动，调用这个方法，使得上面indexView对应起来

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    
    if ([scrollView.superview isKindOfClass:[self class]]) {    // collectionView
        CGFloat width = self.collectionView.frame.size.width;
        NSInteger index = scrollView.contentOffset.x / width;
        [self refreshNavViewByIndex:index];
    }
}



#pragma mark - 事件处理


- (void)scrollToDetailView {
    
    // collectionview 向左滑动
    
    [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    [self refreshNavViewByIndex:0];
}

- (void)scrollToAttrsView {
    
    // collectionview 向右滑动
    
    [self.collectionView setContentOffset:CGPointMake(self.collectionView.frame.size.width, 0) animated:YES];
    [self refreshNavViewByIndex:1];
}

- (void)refreshNavViewByIndex:(NSInteger)index {

    if (index == 0) {
        self.detailButton.selected = YES;
        self.attrsButton.selected = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.indexView.transform = CGAffineTransformIdentity;
        }];
        
    } else if (index == 1) {
        self.detailButton.selected = NO;
        self.attrsButton.selected = YES;
        [UIView animateWithDuration:0.25 animations:^{
            self.indexView.transform = CGAffineTransformMakeTranslation(KScreenWidth*0.5, 0);
        }];
    }
    
    
}

























@end
