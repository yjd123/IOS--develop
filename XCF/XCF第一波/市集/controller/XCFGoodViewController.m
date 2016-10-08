//
//  XCFGoodViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodViewController.h"
#import "XCFGoodsDetailView.h"    // 第二部分头视图
#import "XCFHeaderImageCell.h"    // 第一部分头视图图片
#import "ImageViewController.h"    // 图片点击之后
#import "XCFGoodsBottomView.h"     // 尾视图
#import "XCFGoodsShopCell.h"    // 子类化cell
#import "XCFGoodsReviewView.h"   // 尾视图


#import "XCFGoods.h"
#import "XCFReviewPhoto.h"
#import "XCFShop.h"

@interface XCFGoodViewController (){
    UIView *test;
}

@end

@implementation XCFGoodViewController

static NSString * const headerIdentifier = @"mealHeader";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64) style:UITableViewStyleGrouped];
    [self.view addSubview:_table];
    
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1090)];
    
    _footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 800)];
    
    
    _table.tableFooterView=_footView;
   
    
    _table.tableHeaderView=_headView;
    _table.backgroundColor=XCFGlobalBackgroundColor;
    _table.showsVerticalScrollIndicator = NO;
    _table.delegate=self;
    _table.dataSource=self;
    
    [self setNav];
    [self loadData];
    [self loadHeaderView];
    [self loadBottomView];
   
    
}

#pragma - mark loadTableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCFGoodsShopCell  *cell=[[[NSBundle mainBundle]loadNibNamed:@"XCFGoodsShopCell" owner:nil options:nil]lastObject];
    cell.layer.borderWidth = 5.0;
    cell.layer.borderColor = XCFGlobalBackgroundColor.CGColor;
    cell.shop=self.goods.shop;
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    
//    
//    return 100;
//}

#pragma - mark loadHeaderView

-(void)loadHeaderView{
 
    _images=[[NSMutableArray alloc]init];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(KScreenWidth, 310);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 310) collectionViewLayout:flowLayout];
    

    _collectionView.pagingEnabled=YES;
    flowLayout.minimumLineSpacing=0;
    [_headView addSubview: _collectionView];
    
    // 单元格注册
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XCFHeaderImageCell class]) bundle:nil]forCellWithReuseIdentifier:headerIdentifier];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(150,260,20,10)];  //创建UIPageControl，
    _pageCtrl.currentPage = 0; //当前页
    [_headView addSubview:_pageCtrl];  //将UIPageControl添加到主界面上。
    

    test=[[UIView alloc]initWithFrame:CGRectMake(0,
                                                self.view.bounds.size.height,
                                                self.view.bounds.size.width,
                                                self.view.bounds.size.height-64-44)];
    test.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:test];
    
    // 第二部分头视图
    
    _goodsDetail = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XCFGoodsDetailView class])owner:self options:nil] lastObject];
  
    [_headView addSubview:_goodsDetail];
    
    [_goodsDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom);
        make.left.equalTo(self.headView.mas_left);
        make.right.equalTo(self.headView.mas_right);
        make.height.equalTo(@(780));
        
    }];
    
    // 评论视图
    
    _reviewView=[[XCFGoodsReviewView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 450)];
   
    [_footView addSubview:_reviewView];
}





-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   _pageCtrl.numberOfPages = _images.count;//总的图片页数
    return _images.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XCFHeaderImageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:headerIdentifier forIndexPath:indexPath];
    
    cell.url=_images[indexPath.item];
    
    _pageCtrl.currentPage=indexPath.item;

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ImageViewController *imageViewController=[[ImageViewController alloc]init];
    
    imageViewController.imageArr=_images;
    
    imageViewController.indexPath=indexPath;
    
    
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:imageViewController];
    
       [self.navigationController presentViewController:nav animated:YES completion:NULL];
    
    
    
}

//#pragma mark - UIScrollViewDelegate
//// 向上拖动到一定程度，切换至图文详情界面
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    // 预定值为100
//    
//    if (scrollView.contentOffset.y > self.headView.frame.size.height+100-(KScreenHeight-44-64) + 100) {
//        // 隐藏商品信息
//        _table.hidden = YES;
//        // 动画
//        [UIView animateWithDuration:0.5 animations:^{
//            self.table.transform = CGAffineTransformMakeTranslation(0, -(self.view.bounds.size.height-44));
//            test.transform = CGAffineTransformMakeTranslation(0, -(self.view.bounds.size.height-64));
//        } completion:NULL];
//    }
//}


#pragma - mark loadData

-(void)loadData{
    // 关注动态数据
    
    [[AFHTTPSessionManager manager] GET:XCFRequestGoods
                             parameters:nil
                               progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                
                                   
                    self.goods = [XCFGoods mj_objectWithKeyValues:responseObject[@"content"][@"goods"]];
                                  
                                   [_images addObject:self.goods.main_pic.url];
                                   for (NSDictionary *dic in self.goods.extra_pics) {
                                       NSString *url=[dic objectForKey:@"url"];
                                       [_images addObject:url];
                                   }
                                    self.reviewView.goods=self.goods;
                                   self.goodsDetail.goods=self.goods;
                                   
                                   
                                    _collectionView.dataSource = self;
                                    _collectionView.delegate = self;
                                   
                               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                   NSLog(@"加载失败了，呜呜......");
                               }];
    
}


#pragma - mark loadBottomView

-(void)loadBottomView
{
    _bottomView = [[XCFGoodsBottomView alloc] initWithFrame:CGRectMake(0,KScreenHeight-44,KScreenWidth,44)];
    [self.view addSubview:_bottomView];
    
    WeakSelf;
    
    _bottomView.actionBlock=^(BottomViewClicked type){
      
        if (type==BottomViewClickedGoToShop) {
            [weakSelf goToShop];
        }
        
        
        
        
        
        
    };
    
}

//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
// completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler
//{
//    NSLog(@"didReceiveChallenge");
//    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
//}

































-(void)goToShop
{
    [self pushWebViewWithURL:self.goods.shop.url];
}









-(void)setNav{
  
   self.view.backgroundColor=XCFGlobalBackgroundColor;
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"shoppingCart"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)backAction{
     [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}




@end
