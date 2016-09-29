//
//  NewsTableViewCell.m
//  电影院项目哦
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsMessage.h"
#import "UIViewExt.h"
#import "NewsViewController.h"
#import "UIImageView+WebCache.h"


@implementation NewsTableViewCell

- (void)awakeFromNib {
    self.backgroundColor=[UIColor clearColor];
}




-(void)setNewsMessage:(NewsMessage *)newsMessage
{
    _newsMessage=newsMessage;
    if (newsMessage!=nil) {
        _newsMessage=newsMessage;
        _title.text=[NSString stringWithFormat:@"%@",self.newsMessage.title];
        _summary.text=[NSString stringWithFormat:@"%@",self.newsMessage.summary];
        NSString *urlString=self.newsMessage.image;
        [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        _summary.transform=CGAffineTransformIdentity;
        NSInteger type=[self.newsMessage.type integerValue];
        if (type==0) {
            _image.hidden=YES;
            CGRect frame1=_image.frame;
            CGRect frame2=_summary.frame;
            CGFloat x1=frame2.origin.x-frame1.origin.x;
            _summary.transform=CGAffineTransformMakeTranslation(-x1, 0);
            
        }else if (type==1)
        {
            _image.hidden=NO;
             _image.image=[UIImage imageNamed:@"sctpxw@2x"];
            
        }else if (type==2)
        {
            _image.hidden=NO;
            _image.image=[UIImage imageNamed:@"scspxw@2x"];
        }
        
    }
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
