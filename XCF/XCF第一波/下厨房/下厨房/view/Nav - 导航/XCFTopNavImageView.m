

#import "XCFTopNavImageView.h"

@implementation XCFTopNavImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled=YES;   
        
        _popImage=[[UIImageView alloc]init];
//        _popImage.backgroundColor=RGBA(0, 0, 0, 0.2);
        [self addSubview:_popImage];
        
        [_popImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:14 weight:15];
        _titleLabel.textColor=[UIColor whiteColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
        }];
    }
    
    return self;
}

+(XCFTopNavImageView *)imageViewWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    XCFTopNavImageView *imageView=[[XCFTopNavImageView alloc]init];
    
    imageView.titleLabel.text=title;
    
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:target action:action]];
    
    return imageView;
}

















@end
