

#import <UIKit/UIKit.h>

typedef void (^deletePhotoBlock)();

@interface XCFPhotoView : UIView



@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property(nonatomic,strong)UIImage *image;

@property(nonatomic,copy)deletePhotoBlock callBack;

+(instancetype)photoViewWithImage:(UIImage *)image deletePhotoBlock:(deletePhotoBlock)callBack;


@end
