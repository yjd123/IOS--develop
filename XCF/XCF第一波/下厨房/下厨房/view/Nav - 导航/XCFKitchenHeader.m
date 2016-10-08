//
//  XCFKitchenHeader.m
//  XCF第一波
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFKitchenHeader.h"
#import "XCFTopNavImageView.h"
#import "XCFNavButton.h"
#import "XCFDishNavDetailView.h"

#import "XCFNavContent.h"
#import "XCFDishs.h"
#import "XCFPopEvents.h"
#import "XCFPopEvent.h"

@implementation XCFKitchenHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
      
        // 流行菜谱
        
        _popRecipeView=[[XCFTopNavImageView alloc]init];
        _popRecipeView.titleLabel.text=@"流行菜谱";
        [self addSubview:_popRecipeView];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popDidClicked)];
        [_popRecipeView addGestureRecognizer:tap];
        
        [_popRecipeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self.mas_left).offset(12);
            make.width.mas_equalTo(@(142));
            make.height.equalTo(@(100));
        }];
        
        // 关注动态
        _feedsView=[[XCFTopNavImageView alloc]init];
        _feedsView.titleLabel.text=@"关注动态";
        [self addSubview:_feedsView];
        UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(  feedsDidClicked)];
        [_feedsView addGestureRecognizer:tap1];
        [_feedsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_popRecipeView);
            make.right.equalTo(self.mas_right).offset(-12);
            make.height.equalTo(_popRecipeView);
            make.width.equalTo(_popRecipeView);
        }];
        
        // 导航按钮view
        _navButtonView=[[UIView alloc]init];
        [self addSubview:_navButtonView];
        [_navButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_popRecipeView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(80));
        }];
        
        // 早餐，午餐，晚餐
        _dishNavView=[[UIView alloc]init];
        [self addSubview:_dishNavView];
        
        [_dishNavView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_navButtonView.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(100));
        }];
        
        //  早餐，午餐，晚餐 scrollview
        
        _scrollView=[[UIScrollView alloc]init];
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator =NO;
        _scrollView.backgroundColor=[UIColor whiteColor];
        _scrollView.delegate=self;
        _scrollView.bounces = NO;
        [self.dishNavView addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_dishNavView);
        }];
        
        //  早餐，午餐，晚餐 导航指示器
        _pageControl=[[UIPageControl alloc]init];
        _pageControl.hidesForSinglePage=YES;
        _pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor=XCFThemeColor;
        [self.dishNavView addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_dishNavView);
            make.centerY.equalTo(_dishNavView.mas_bottom).offset(-8);
        }];
    }
    return self;
}


-(void)setNavContent:(XCFNavContent *)navContent{
    
    _navContent=navContent;
    
    // 流行菜谱图片
    [_popRecipeView sd_setImageWithURL:[NSURL URLWithString:navContent.pop_recipe_picurl]];
     
     // 添加4个导航按钮
    CGFloat buttonWidth=self.navButtonView.frame.size.width/4;
    
    for (int index=0; index<4; index++) {
        XCFNavButton *button=[XCFNavButton buttonWithNav:navContent.navs[index] target:self action:@selector(buttonDidClicked:)];
        button.tag=index+100;
        button.frame=CGRectMake(index*buttonWidth, 0, buttonWidth, buttonWidth);
        [self.navButtonView addSubview:button];
    }
    
    // 添加 早餐 午餐，晚餐图片
    
    XCFPopEvents *popEvents=navContent.pop_events;
    _count=popEvents.count;
    
    CGFloat scrollViewWidth=self.scrollView.frame.size.width;
    CGFloat scrollViewHeight=self.scrollView.frame.size.height;
    
    for (int i=0; i<popEvents.count; i++) {
        XCFDishNavDetailView *detailView=[XCFDishNavDetailView viewWithPopEvent:popEvents.events[i] target:self action:@selector(viewDidClicked:)];
        detailView.tag=104+i;
        detailView.frame=CGRectMake(i*scrollViewWidth, 0, scrollViewWidth, scrollViewHeight);
        [self.scrollView addSubview:detailView];
    }
    self.scrollView.contentSize=CGSizeMake(scrollViewWidth*popEvents.count, scrollViewHeight);
    _pageControl.numberOfPages=popEvents.count;
    
}


 // 接收模型设置  关注动态图片

-(void)setDish:(XCFDishs *)dish
{
    _dish=dish;
    [_feedsView sd_setImageWithURL:[NSURL URLWithString:dish.thumbnail]];
}

#pragma mark - UIScrollView Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewWidth=self.scrollView.frame.size.width;
    _pageControl.currentPage=(scrollView.contentOffset.x + scrollViewWidth*0.5)/scrollViewWidth;
}

#pragma  mark - 事件处理

/**
 *  流行菜谱点击事件
 */
- (void)popDidClicked {
    !self.clickBlock ? : self.clickBlock(viewDidClickedActionPopRecipeView);
}

/**
 *  关注动态点击事件
 */
- (void)feedsDidClicked {
    !self.clickBlock ? : self.clickBlock(viewDidClickedActionFeedsView);
}

-(void)viewDidClicked:(XCFDishNavDetailView *)sender{
    
    UITapGestureRecognizer *tap=(UITapGestureRecognizer *)sender;
    
    !self.clickBlock ? : self.clickBlock(tap.view.tag);
}



/**
 *  导航按钮点击事件
 *
 *  @param sender 导航按钮（XCFNavButton）
 */
- (void)buttonDidClicked:(XCFNavButton *)sender {
    !self.clickBlock ? : self.clickBlock(sender.tag);
}






@end
