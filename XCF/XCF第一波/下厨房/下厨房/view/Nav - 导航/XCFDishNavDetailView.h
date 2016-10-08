

#import <UIKit/UIKit.h>
@class XCFPopEvent;
@interface XCFDishNavDetailView : UIView

// 早餐 ，午餐，晚餐

@property(nonatomic,strong)XCFPopEvent *popEvent;
/** 背景图 */
@property (nonatomic, strong) UIImageView *backImageView;
/** 右侧小图 */
@property (nonatomic, strong) UIImageView *rightImageView;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 作品数label */
@property (nonatomic, strong) UILabel *dishCountLabel;


+(nonnull XCFDishNavDetailView *)viewWithPopEvent:(nonnull XCFPopEvent *)popEvent target:(nullable id)target action:(nullable SEL)action;

@end
