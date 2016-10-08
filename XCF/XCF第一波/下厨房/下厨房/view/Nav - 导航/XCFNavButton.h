

#import <UIKit/UIKit.h>
@class XCFNav;

@interface XCFNavButton : UIButton

/** 标题 */
@property (nonatomic, copy) UILabel *title;
/** url */
@property (nonatomic, copy) NSString *url;
// 图片
@property (nonatomic, copy) UIImageView *image;

+(nonnull XCFNavButton *)buttonWithNav:(nonnull XCFNav *)nav target:(nonnull id)target action:(nonnull SEL)action;

+(nonnull XCFNavButton *)buttonwithTitle:(nonnull NSString *)title target:(nullable id)target action:(nullable SEL)action;
































@end
