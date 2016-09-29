//
//  MovieDetails.m
//  电影院项目哦
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "MovieDetails.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieDetails


-(void)awakeFromNib{
    
}



-(void)setMovie:(Movie *)movie
{
    if (_movie!=movie) {
        _movie=movie;
    }
    _titleLabel.text=[NSString stringWithFormat:@"中文:%@",_movie.title];
    _yearLabel.text=[NSString stringWithFormat:@"年份:%@",_movie.year];
    _sourceLabel.text=[NSString stringWithFormat:@"原名:\n%@",_movie.originalTitle];
    NSString *image=[_movie.images objectForKey:@"medium"];
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"pig"]];
    _averageLabel.text=[NSString stringWithFormat:@"%.1f",[_movie.average floatValue]];
    
   _view.score=[_movie.average floatValue];
    
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
