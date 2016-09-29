

#import "PosterCollectionViewCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "MovieCommonData.h"
#import "MovieDetails.h"
@implementation PosterCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {

        [self creatView];
    }
    return self;
}

-(void)creatView
{
    _pictureImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.95, self.bounds.size.height * 0.95)];
    _pictureImageView.center=self.contentView.center;
    [self.contentView addSubview:_pictureImageView];
    
    _detailView=[[[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil]lastObject];
    
    _detailView.center=self.contentView.center;
    _detailView.backgroundColor=[UIColor greenColor];
    [self.contentView insertSubview:_detailView belowSubview:_pictureImageView];

}


-(void)flipCell
{
    UIViewAnimationOptions transition=left ? UIViewAnimationOptionTransitionFlipFromLeft:
    UIViewAnimationOptionTransitionFlipFromRight;
    
    NSInteger index1=[self.contentView.subviews indexOfObject:_pictureImageView];
    NSInteger index2=[self.contentView.subviews indexOfObject:_detailView];
    [UIView transitionWithView:self.contentView duration:.5 options:transition animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:NULL];
    left=!left;
    
    _isFlip=!_isFlip;
}



-(void)setMessage:(Movie *)message
{
    if (_message!=message) {
        _message=message;
    }
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:[message.images objectForKey:@"large"]] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    [_detailView setMovie:_message];

}

@end




























