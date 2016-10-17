
/**
 *  顶部导航视图点击事件
 */
typedef NS_ENUM(NSInteger, viewDidClickedAction) {
    viewDidClickedActionPopRecipeView = 0,          // 流行菜谱点击事件
    viewDidClickedActionFeedsView = 1,              // 关注动态点击事件
    
    viewDidClickedActionTopListButton = 102,          // 排行榜
    viewDidClickedActionTalkButton = 101,            // 厨房问答
    viewDidClickedActionBuyButton = 100,              // 买烘焙
    viewDidClickedActionRecipeCategoryButton =103,   // 菜谱分类
    
    viewDidClickedActionBreakfast = 104,              // 早餐
    viewDidClickedActionLunch = 105,                  // 午餐
    viewDidClickedActionSupper = 106                  // 晚餐
    
};

//事件点击Block

typedef void (^viewDidClickBlock)();

#import <UIKit/UIKit.h>

@class XCFDishs,XCFNavContent,XCFTopNavImageView;


@interface XCFKitchenHeader : UIView<UIScrollViewDelegate>

/** 导航模型数据 */
@property (nonatomic, strong) XCFNavContent *navContent;
/** 动态模型数据 */
@property (nonatomic, strong) XCFDishs *dish;

/** viewDidClickedBlock */
@property(nonatomic,copy)viewDidClickBlock clickBlock;


/** 流行菜谱 */
@property (nonatomic, strong) XCFTopNavImageView *popRecipeView;
/** 关注动态 */
@property (nonatomic, strong) XCFTopNavImageView *feedsView;
/** 导航按钮view */
@property (nonatomic, strong) UIView *navButtonView;
/** 餐导航view */
@property (nonatomic, strong) UIView *dishNavView;
/** scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;
/** 个数 */
@property (nonatomic, assign) NSInteger count;






@end
