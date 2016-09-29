//
//  PosterView.m
//  电影院项目哦
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "Movie.h"
#import "MovieCommonData.h"
#import "IndexCollectionView.h"
#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation PosterView
{
    UIControl *_maskView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        //创建头部视图
        [self creatImageData];
        [self _creatHeadView];
        [self _creatFootView];
        [self creatIndexCollectionView];
        
        //kvo
        
        [_collectionView addObserver:self forKeyPath:@"currectItem" options:NSKeyValueObservingOptionNew context:NULL];
//
        [_indexCollection addObserver:self forKeyPath:@"currectItem" options:NSKeyValueObservingOptionNew context:NULL];
        
        
        
        
    }
    return self;
}

// kvo 观察者方法

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object//被观察者对象
                       change:(NSDictionary<NSString *,id> *)
                       change // 属性
                      context:(void *)context{
    
    if ([keyPath isEqualToString:@"currectItem"]) {
        // 从change字典中取，取出的值是包装好的，要先转化为NSIntger
        NSNumber *newVaule=[change objectForKey:@"new"];
        NSInteger item=[newVaule integerValue];
        
       if (object==_collectionView && _indexCollection.currectItem!=item) {
        
        _indexCollection.currectItem=item;
        
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:item  inSection:0];
        [_indexCollection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }else if (object==_indexCollection && _collectionView.currectItem!=item){
            _collectionView.currectItem=item;
            NSIndexPath *indexPath=[NSIndexPath indexPathForItem:item  inSection:0];
            [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        if (_array.count>0) {
           
            Movie *movie=[_array objectAtIndex:item];
            _footViewLabel.text=movie.title;
        }
    }
}



-(void)_creatFootView{
    _footViewLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, KSScreenHeight-49-30, KSScreenWidth, 30)];
//    _footViewLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    _footViewLabel.backgroundColor=[UIColor grayColor];
    _footViewLabel.textAlignment=NSTextAlignmentCenter;
    _footViewLabel.font=[UIFont systemFontOfSize:16];
    _footViewLabel.textColor=[UIColor blueColor];
     _footViewLabel.text=@"蚁人";
    [self addSubview:_footViewLabel];
}

-(void)creatIndexCollectionView{
    _indexCollection=[[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 10, KSScreenWidth, 90)];
    _indexCollection.backgroundColor=[UIColor clearColor];
    _indexCollection.pageWidth=70;
    _indexCollection.pictureArray=_dataImageSmall;
    _indexCollection.hidden=YES;
    [_headViewBig addSubview:_indexCollection];
    
}

-(void)setArray:(NSMutableArray *)array
{
    if (_array!=array) {
        _array=array;
    }
    [_collectionView setPictureArray:array];
    
   
}

-(void)creatImageData
{

    _dataImageSmall=[NSMutableArray array];
    
    NSDictionary *jsonDic=(NSDictionary *)[MovieCommonData requestData:@"us_box.json"];
    
    NSArray *array=[jsonDic objectForKey:@"subjects"];
    for (NSDictionary *dic in array)
    {
        Movie *movie=[[Movie alloc]init];
        NSDictionary *subject=[dic objectForKey:@"subject"];
        movie.images=[[subject objectForKey:@"images"]objectForKey:@"large"];
        movie.smallImages=[[subject objectForKey:@"images"]objectForKey:@"small"];
        [_dataImageSmall addObject:movie.smallImages];

    }
    _collectionView=[[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 94, KSScreenWidth, KSScreenHeight-49-64-30-30)];
    
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.pageWidth=220;
   
    
    [self addSubview:_collectionView];
   
}

-(void)_creatHeadView
{
    _headViewBig=[[UIView alloc]initWithFrame:CGRectMake(0, 64-100, KSScreenWidth, 126)];
    _headViewBig.backgroundColor=[UIColor clearColor];
  
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KSScreenWidth, 126)];
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image=[image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    
    imageView.image=image;
    [self addSubview:_headViewBig];
    [_headViewBig addSubview:imageView];
    
    UIButton *showButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    showButton.frame=CGRectMake((KSScreenWidth-15)/2, 106, 15, 15);
    
    [showButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [showButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [showButton addTarget:self action:@selector(showButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    showButton.tag=101;
    [_headViewBig addSubview:showButton];

    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    
    swipe.direction=UISwipeGestureRecognizerDirectionDown;

    [self addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe1Action:)];
    swipe1.direction=UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipe1];
    
}

-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    [self showHeadView];
    
}
-(void)swipe1Action:(UISwipeGestureRecognizer *)swipe
{
    [self hidenHeadView];
    
}

-(void)showButtonAction:(UIButton *)but
{
    but.selected=!but.selected;
    
    if (but.selected==YES) {
        [self showHeadView];
    }else{
        [self hidenHeadView];
    }
}


-(void)showHeadView{
    [UIView animateWithDuration:.2 animations:^{
        _headViewBig.transform=CGAffineTransformMakeTranslation(0, 100);
    }];
    if (_maskView==nil) {
        _maskView=[[UIControl alloc]initWithFrame:self.bounds];
        
        _maskView.backgroundColor=[UIColor colorWithWhite:0 alpha:.3];
        [_maskView addTarget:self action:@selector(maskViewAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self insertSubview:_maskView belowSubview:_headViewBig];
}
    UIButton *button=(UIButton *)[_headViewBig viewWithTag:101];
    button.selected=YES;
    _maskView.hidden=NO;
    _indexCollection.hidden=NO;
}
-(void)hidenHeadView{
    [UIView animateWithDuration:.2 animations:^{
        _headViewBig.transform=CGAffineTransformIdentity;
    }];

    UIButton *button=(UIButton *)[_headViewBig viewWithTag:101];
    button.selected=NO;
    _maskView.hidden=YES;
    _indexCollection.hidden=YES;
    
}

-(void)maskViewAction:(UIControl *)mask
{
    [self hidenHeadView];
}























/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
