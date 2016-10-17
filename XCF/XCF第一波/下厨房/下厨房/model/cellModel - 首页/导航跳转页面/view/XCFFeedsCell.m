//
//  XCFFeedsCell.m
//  XCF第一波
//
//  Created by admin on 16/10/1.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFFeedsCell.h"
#import "XCFDishs.h"
#import "XCFComment.h"
#import "XCFDiggUsers.h"
#import "XCFPicture.h"
#import "XCFEvents.h"
#import "XCFAuthor.h"

@implementation XCFFeedsCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;

        _headView=[[UIView alloc]init];
        [self.contentView addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.top.equalTo(self.contentView.mas_top);
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.height.equalTo(@(70));
        }];
        
        
        
        
        // 作者头像
        _authorIcon=[[UIImageView alloc]init];
        [_headView addSubview:_authorIcon];
        [_authorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headView.mas_left).offset(10);
            make.top.equalTo(_headView.mas_top).offset(5);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
         // 作者名字
        _authorName=[[UILabel alloc]init];
        _authorName.textColor=[UIColor redColor];
        _authorName.font=[UIFont systemFontOfSize:13];
        _authorName.textAlignment=NSTextAlignmentLeft;
        [_headView addSubview:_authorName];
        [_authorName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.authorIcon.mas_right).offset(3);
            make.top.equalTo(_headView.mas_top).offset(5);
            make.height.mas_equalTo(@(40));
            make.centerY.equalTo(self.authorIcon.mas_centerY);
            
        }];
        
        // 分享时间
        _upLoadTime=[[UILabel alloc]init];
        _upLoadTime.textColor=[UIColor grayColor];
        _upLoadTime.font=[UIFont systemFontOfSize:13];
        _upLoadTime.textAlignment=NSTextAlignmentRight;
        [_headView addSubview:_upLoadTime];
        [_upLoadTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headView.mas_right).offset(-10);
            make.top.equalTo(_headView.mas_top).offset(5);
            make.centerY.equalTo(self.authorIcon.mas_centerY);
            make.width.equalTo(@(70));
           
        }];
        
        /** （推广专题?）标题 */
        
        _tagView=[[UILabel alloc]init];
        _tagView.textColor=[UIColor redColor];
        _tagView.textAlignment=NSTextAlignmentLeft;
        _tagView.font=[UIFont systemFontOfSize:14];
        _tagView.backgroundColor=[UIColor whiteColor];
        [_headView addSubview:_tagView];
        [_tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.authorName.mas_left);
            make.right.equalTo(self.headView.mas_right).offset(-20);
            make.height.mas_equalTo(@(25));
            make.top.equalTo(self.authorName.mas_bottom).offset(5);
        }];

        /** （推广专题?）标题  右边箭头*/
        _rightImage=[[UIImageView alloc]init];
        _rightImage.image=[UIImage imageNamed:@"webViewIconForwardDisable"];
        [_headView addSubview:_rightImage];
        [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.tagView.mas_right).offset(-15);
           make.size.mas_equalTo(CGSizeMake(20, 20));
          make.top.equalTo(self.tagView.mas_top).offset(5);
        }];
        
        // 作品描述
        
        _desc=[[UILabel alloc]init];
        _desc.numberOfLines=0;
        _desc.font=[UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:_desc];
        [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headView.mas_bottom).offset(10);
            make.left.equalTo(_headView.mas_left).offset(50);
            make.right.equalTo(_headView.mas_right).offset(-10);
            make.height.mas_equalTo(@(60));
        }];
    
        // 点赞
        _ndiggsNumber=[[UILabel alloc]init];
        _ndiggsNumber.textColor=[UIColor redColor];
        _ndiggsNumber.textAlignment=NSTextAlignmentLeft;
        _ndiggsNumber.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_ndiggsNumber];
        [_ndiggsNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_desc.mas_bottom).offset(5);
            make.left.equalTo(_desc.mas_left);
            make.right.equalTo(_desc.mas_right);
            make.height.mas_equalTo(@(13));
        }];
        
        
        // 所有评论
        _all_comments=[[UILabel alloc]init];
        _all_comments.textColor=[UIColor grayColor];
        _all_comments.textAlignment=NSTextAlignmentLeft;
        _all_comments.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_all_comments];
        [_all_comments mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ndiggsNumber.mas_bottom).offset(4);
            make.left.equalTo(self.ndiggsNumber.mas_left);
            make.height.mas_equalTo(@(20));
            make.width.mas_equalTo(@(100));
        }];
        
        
        
        
       //  最后一个评论
        
        _latest_comments=[[UILabel alloc]init];
        _latest_comments.numberOfLines=0;
        _latest_comments.textColor=[UIColor redColor];
        _latest_comments.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_latest_comments];
        [_latest_comments mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.all_comments.mas_bottom);
            make.left.equalTo(self.ndiggsNumber.mas_left);
            make.right.equalTo(self.ndiggsNumber.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
//
        
        
        
    }

    return self;
}


-(void)setDish:(XCFDishs *)dish
{
    
    _dish=dish;

    // 评论赋值
    
     XCFComment *firstComment=[dish.latest_comments lastObject];
     if (firstComment) {
    
   _latest_comments.text=[NSString stringWithFormat:@"%@:%@",firstComment.author.name,firstComment.txt];

     }else{
              _latest_comments.text=@"还没有人评论哦，快来抢沙发吧";
     }
    
    //  所有评论
    
    _all_comments.text=[NSString stringWithFormat:@"查看所有%ld人评论",dish.latest_comments.count];
    
    // 作品描述
    
    _desc.text=dish.desc;

    // 作者头像
   
    [_authorIcon sd_setImageWithURL:[NSURL URLWithString:dish.author.photo60]];
    
     // 作者名字
    _authorName.text=[NSString stringWithFormat:@"%@ 分享到",dish.author.name];
     
     // 点赞人数
    _ndiggsNumber.text=[NSString stringWithFormat:@"%@人 赞",dish.ndiggs];
    _count=[dish.ndiggs integerValue];
    
    // 发布时间
    
    _upLoadTime.text=dish.friendly_create_time;
    
  // 这里一直拿不到events，只能用原始方法。
    if (dish.events.count>0) {
    
    NSDictionary *events=[dish.events objectAtIndex:0];
    NSString *name=[events objectForKey:@"name"];
   _tagView.text=[NSString stringWithFormat:@"   %@",name];
    }

}

























- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
