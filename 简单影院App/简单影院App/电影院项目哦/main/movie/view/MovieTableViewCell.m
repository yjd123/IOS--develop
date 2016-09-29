

#import "MovieTableViewCell.h"
#import "Movie.h"
#import "StarView.h"
#import "UIImageView+WebCache.h"
@implementation MovieTableViewCell

- (void)awakeFromNib {
    self.backgroundColor=[UIColor clearColor];
}

-(void)setMovie:(Movie *)movie
{
    _movie=movie;
    
    _averageLabel.text=[NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    _yearLabel.text=[NSString stringWithFormat:@"年份：%ld",[self.movie.year integerValue]];
    _titleLabel.text=[NSString stringWithFormat:@"%@",self.movie.title];
    
    NSString *small=[self.movie.images objectForKey:@"small"];
    
    NSURL *url=[NSURL URLWithString:small];
    
    [_PictureImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _starImageView.score=[self.movie.average floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}























@end
