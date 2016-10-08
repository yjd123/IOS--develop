//
//  XCFRecipeCell.m
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFRecipeCell.h"
#import "XCFItems.h"
#import "XCFContents.h"
#import "XCFImage.h"
#import "XCFIssues.h"
#import "XCFContent.h"
#import "XCFAuthor.h"
@implementation XCFRecipeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        // 图片
        _image=[[UIImageView alloc]init];
        [self.contentView addSubview:_image];
        
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top);
            make.height.mas_equalTo(@(200));
        }];
        
        
     
        
        //   遮盖图片的视图
        _coverView=[[UIView alloc]init];
        _coverView.backgroundColor=XCFCoverViewColor;
        [_image addSubview:_coverView];
        [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.image);
            make.size.equalTo(self.image);
        }];
        
        // 图片上 视频播放按钮
        
        _videoIcon=[[UIImageView alloc]init];
        _videoIcon.image=[UIImage imageNamed:@"playButton"];
        [_image addSubview:_videoIcon];
        [_videoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.image);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        // 图片上的大标题
        _firstTitleLabel=[[UILabel alloc]init];
        _firstTitleLabel.font=[UIFont systemFontOfSize:18 weight:18];
        _firstTitleLabel.textColor=[UIColor whiteColor];
        _firstTitleLabel.numberOfLines=0;
        _firstTitleLabel.textAlignment=NSTextAlignmentCenter;
        [_image addSubview:_firstTitleLabel];
        [_firstTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.image.mas_left).offset(50);
            make.right.equalTo(self.image.mas_right).offset(-50);
            make.centerY.equalTo(self.image.mas_centerY);
        }];
        
        // 图片上小标题
        _secondTitleLabel=[[UILabel alloc]init];
        _secondTitleLabel.font=[UIFont systemFontOfSize:13 weight:13];
        _secondTitleLabel.textColor=[UIColor whiteColor];
        [_image addSubview:_secondTitleLabel];
        [_secondTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.image.mas_centerX);
            make.top.equalTo(self.firstTitleLabel.mas_bottom).offset(10);
        }];
        
        
        _whisperLabel =[[UILabel alloc]init];
        _whisperLabel.font=[UIFont systemFontOfSize:18 weight:18];
        _whisperLabel.textColor=[UIColor whiteColor];
        [_image addSubview:_whisperLabel];
        [_whisperLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.image.mas_centerX);
            make.centerY.equalTo(self.image.mas_centerY);
        }];
        
        
         /******************************************************************/

      //   帖子label
                _talkBigTitleLabel=[[UILabel alloc]init];
                _talkBigTitleLabel.font=[UIFont systemFontOfSize:19];
                _talkBigTitleLabel.numberOfLines=0;
              [self.contentView addSubview:_talkBigTitleLabel];
                [_talkBigTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView.mas_left).offset(15);
                    make.right.equalTo(self.contentView.mas_right).offset(-15);
                    make.top.equalTo(self.contentView.mas_top).offset(10);
                
                }];
        
        // 底部描述视图
        _bottomView=[[UIView alloc]init];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.image.mas_bottom);
            
        }];
        
        // 底部描述大标题
        _titleLabel=[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:16];
        _titleLabel.numberOfLines=0;
        [_bottomView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bottomView.mas_left).offset(5);
            make.right.equalTo(self.bottomView.mas_right).offset(-5);
            make.top.equalTo(self.bottomView.mas_top).offset(5);
        }];
        
        // 底部描述详情
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:12];
        _descLabel.numberOfLines = 0;
        [self.bottomView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left);
            make.right.equalTo(self.titleLabel.mas_right);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
            make.bottom.equalTo(self.bottomView.mas_bottom).offset(-15);
        }];
       
        // 底部 回答人数
        _scoreLabel=[[UILabel alloc]init];
        _scoreLabel.font=[UIFont systemFontOfSize:XCFRecipeCellFontSizeDesc];
        _scoreLabel.textColor=[UIColor grayColor];
        [self.talkBigTitleLabel addSubview:_scoreLabel];
        [_scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.talkBigTitleLabel.mas_left).offset(3);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        
        // 作者头像
        
        _authorIcon=[[UIImageView alloc]init];
        _authorIcon.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(authorIconClick)];
        _authorIcon.layer.cornerRadius=19;
        [_authorIcon addGestureRecognizer:tap];
        [self.bottomView addSubview:_authorIcon];
        [_authorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bottomView.mas_right);
            make.top.equalTo(self.bottomView.mas_top).offset(10);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        // 底部 作者名称
        _authorName=[[UILabel alloc]init];
        _authorName.font=[UIFont systemFontOfSize:XCFRecipeCellFontSizeDesc];
        _authorName.textAlignment=NSTextAlignmentLeft;
        _authorName.textColor=[UIColor grayColor];
        [self.bottomView addSubview:_authorName];
        [_authorName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.authorIcon.mas_bottom).offset(2);
            make.left.equalTo(self.authorIcon.mas_left);
            make.right.equalTo(self.bottomView.mas_right);
        }];
        
        // 做过的人数
        
        _cookedLabel=[[UILabel alloc]init];
        _cookedLabel.font=[UIFont systemFontOfSize:XCFRecipeCellFontSizeDesc];
        _cookedLabel.textColor=[UIColor grayColor];
        [self.bottomView addSubview:_cookedLabel];
        [_cookedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.descLabel.mas_left).offset(1);
            make.top.equalTo(self.descLabel.mas_bottom).offset(5);
        }];
        
        // 独家图标 -- - - --待定
   
    }
    return self;
}

-(void)setItems:(XCFItems *)items
{
    _items=items;
    
    // 给图片一个url地址
    [self.image sd_setImageWithURL:[NSURL URLWithString:items.contents.image.url]];
    
    // 隐藏所有控件
    self.firstTitleLabel.hidden = YES;
    self.secondTitleLabel.hidden = YES;
    self.bottomView.hidden = YES;
    self.authorIcon.hidden = YES;
    self.whisperLabel.hidden = YES;
    self.cookedLabel.hidden = YES;
    self.videoIcon.hidden = YES;
    self.descLabel.hidden = YES;
   self.whisperLabel.hidden = YES;
    self.scoreLabel.hidden = YES;
    self.authorName.hidden = YES;
    self.titleLabel.hidden=YES;
    self.coverView.hidden=YES;
    self.talkBigTitleLabel.hidden=YES;
    
    if (items.template==XCFCellTemplateTopic )  // 帖子 
    {
        self.scoreLabel.hidden=NO;
        self.talkBigTitleLabel.hidden=NO;
        self.talkBigTitleLabel.text=items.contents.title;
        self.scoreLabel.text=[NSString stringWithFormat:@"%ld个人回答",items.contents.n_discussions];

        
    } else if (items.template==XCFCellTemplateRecipe) {  // 菜谱
            self.bottomView.hidden=NO;
            self.titleLabel.hidden=NO;
            self.titleLabel.text=items.contents.title;
            self.videoIcon.hidden=!items.contents.video_url.length;
            self.cookedLabel.hidden=NO;
            self.authorIcon.hidden=NO;
            self.descLabel.hidden=NO;
            self.authorName.hidden=NO;
            self.descLabel.text=items.contents.desc;
            self.authorName.text=items.contents.author.name;
        
            [self.authorIcon sd_setImageWithURL:[NSURL URLWithString:items.contents.author.photo]];
            self.cookedLabel.text=[NSString stringWithFormat:@"%ld个人做过",items.contents.n_cooked];

        
    }else if (items.template==XCFCellTemplateRecipeList){  // 菜单
      
        self.coverView.hidden=NO;
        self.firstTitleLabel.hidden=NO;
        self.secondTitleLabel.hidden=NO;
        self.firstTitleLabel.text=items.contents.title_1st;
        self.secondTitleLabel.text=items.contents.title_2nd;
   
        
    } else if (items.template==XCFCellTemplateTalk)  // 聊天
    {
        self.bottomView.hidden=NO;
        self.titleLabel.hidden=NO;
        self.titleLabel.text=items.contents.title;
        self.descLabel.hidden=NO;
        self.descLabel.text=items.contents.desc;
        
    }else if(items.template==XCFCellTemplatewhisper){  // 最后一张图片
    
        self.coverView.hidden=NO;
        self.whisperLabel.hidden=NO;
        self.whisperLabel.text = items.contents.whisper;
    }
    
}


-(void)authorIconClick
{
    
}





@end
