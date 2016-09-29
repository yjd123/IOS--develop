//
//  TopCollectionViewCell.m
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "TopViewController.h"
#import "TopModel.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation TopCollectionViewCell


-(void)awakeFromNib
{
    self.backgroundColor=[UIColor clearColor];
}




-(void)setModel:(TopModel *)model
{
   _model=model;
    
    _averageLabel.text=[NSString stringWithFormat:@"%f",[self.model.average floatValue]];
    _titleLabel.text=[NSString stringWithFormat:@"%@",self.model.title];
    _titleLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:.3];
    _titleLabel.numberOfLines=0;
    NSString *str=[self.model.images objectForKey:@"small"];
    
    NSURL *url=[NSURL URLWithString:str];
    [_picturesImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _starView.score=[self.model.average floatValue];
    
    
    
}






@end
