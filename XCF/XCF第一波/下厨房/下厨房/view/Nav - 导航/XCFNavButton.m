

#import "XCFNavButton.h"
#import "XCFNav.h"

@implementation XCFNavButton

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled=YES; // 让覆盖在上面的子视图 imageview 没反应，button有相应
        
        _image = [[UIImageView alloc] init];
        [self addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.mas_top).offset(3);
            make.size.mas_equalTo(CGSizeMake(50, 60));
        }];
        
        _title=[[UILabel alloc]init];
        _title.font=[UIFont systemFontOfSize:12];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-7);
        }];
    }
    return self;
}

+(XCFNavButton *)buttonWithNav:(XCFNav *)nav target:(id)target action:(SEL)action
{
    XCFNavButton *button=[[XCFNavButton alloc]init];
    
    //// 给image一个url, 给title数据
    [button.image sd_setImageWithURL:[NSURL URLWithString:nav.picurl]];
    button.title.text=nav.name;
    
    
    // 这个需要测试！！！！！！
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    return button;
}
         
         
+(XCFNavButton *)buttonwithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    XCFNavButton *button = [[XCFNavButton alloc] init];
    button.image.contentMode = UIViewContentModeScaleAspectFill;
//    [button.image mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(button);
//        make.top.equalTo(button).offset(10);
//        make.size.mas_equalTo(CGSizeMake(20, 20));
//    }];
//    button.image.image = [UIImage imageNamed:name];
    button.title.text = title;
//    [button.title mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(button);
//        make.top.equalTo(button.image.mas_bottom).offset(5);
//    }];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    return button;

}
         

         
         
@end
