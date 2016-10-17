//
//  MessageCell.m
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "MessageCell.h"
#import "WechatModel.h"
@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建子视图
        [self _createSubViews];
        //取消选中效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //将背景颜色设置为透明色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)_createSubViews{
    _bgImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _chatLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    [self.contentView addSubview:_bgImageView];
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_chatLabel];
    [_bgImageView addSubview:_chatLabel];
}

-(void)setChatModel:(WechatModel *)chatModel{
    _chatModel = chatModel;
    
    //程序进入，界面需要显示的时候，系统会自动调用一次layoutSubviews，它属于隐式调用(UI高级详解)
    //    [self layoutSubviews];
    
    //显式调用永远比隐式调用好
    [self setNeedsLayout];
    
}
/*
 类似于controller的loadview方法:
 1.调用时机:界面显示的时候必然调用
 2.作用:类似于loadView方法，装载子视图
 */

-(void)layoutSubviews{
    [super layoutSubviews];
    //因为我们界面上的数据是时时刷新的
    UIImage *image1 = [UIImage imageNamed:@"icon01.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"icon02.jpg"];
    
    CGRect rect1 = CGRectMake(15, 10, 50, 50);
    CGRect rect2 = CGRectMake(KScreenWidth - 65, 10, 50, 50);
    
    _iconImageView.frame = self.chatModel.isSelf ? rect2 : rect1;
    _iconImageView.image = self.chatModel.isSelf ? image1 : image2;
    
    
    _bgImageView.image = self.chatModel.isSelf ? [UIImage imageNamed:@"chatto_bg_normal"] : [UIImage imageNamed:@"chatfrom_bg_normal"];
    _chatLabel.numberOfLines = 0;
    _chatLabel.text = self.chatModel.content;
    
    //因为聊天框文本和背景的图片的frame都是需要计算的，我们待会儿再写
    _bgImageView.image = [_bgImageView.image stretchableImageWithLeftCapWidth:_bgImageView.image.size.width * .5 topCapHeight:_bgImageView.image.size.height *.8];
    
    
    //根据内容动态获取高度
    CGRect rect3 = [_chatLabel.text boundingRectWithSize:CGSizeMake(160, 8888) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] , NSParagraphStyleAttributeName : [[NSMutableParagraphStyle alloc]init]} context:nil];
    
    CGFloat fixWidth = MAX(rect3.size.width, 65);
    
    //这一个背景聊天图片的坐标系大家到时候按照自己喜欢的样子去设置
    _bgImageView.frame = self.chatModel.isSelf ?CGRectMake(KScreenWidth - 93 - MIN(KScreenWidth - 140, rect3.size.width), 3, MIN(KScreenWidth - 140, fixWidth+27), rect3.size.height + 65) : CGRectMake(70, 3, MIN(KScreenWidth - 140, fixWidth), rect3.size.height + 61);
    
    _chatLabel.frame = self.chatModel.isSelf ? CGRectMake(7, 0, _bgImageView.frame.size.width - 20, _bgImageView.frame.size.height) : CGRectMake(20, 0, _bgImageView.frame.size.width - 30, _bgImageView.frame.size.height);
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
