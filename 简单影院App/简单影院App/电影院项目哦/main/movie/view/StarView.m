//
//  StarView.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self=[super initWithFrame:frame];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)awakeFromNib {
    [self _creatView];}

-(void)_creatView
{
    _image1=[UIImage imageNamed:@"yellow"];
    _image2=[UIImage imageNamed:@"gray"];
    _yellowView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _image1.size.width*5, _image1.size.height)];
    _yellowView.backgroundColor=[UIColor colorWithPatternImage:_image1];
    
    _grayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _image2.size.width*5, _image2.size.height)];
    _grayView.backgroundColor=[UIColor colorWithPatternImage:_image2];
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    
    CGFloat a=self.frame.size.height/_yellowView.frame.size.height;
    
    CGAffineTransform b=CGAffineTransformMakeScale(a, a);
    _yellowView.transform=b;
    _grayView.transform=b;
    
    CGFloat star5Width = _image1.size.width * 5;
    
    //    CGRect frame = self.frame;
    //    frame.size.width = star5Width;
    //    self.frame = frame;
    //等价于
    self.width = star5Width;
    
    
    //    CGRect f1=_yellowView.frame;
    //    CGRect f2=_grayView.frame;
    //    f1.origin=CGPointZero;
    //    f2.origin=CGPointZero;
    //    _grayView.frame=f2;
    //    _yellowView.frame=f1;
    
    _yellowView.origin=CGPointZero;
    _grayView.origin=CGPointZero;
    
    self.backgroundColor=[UIColor clearColor];
    
}

-(void)setScore:(CGFloat)score
{
//    _score=score;
    
    CGFloat c =score/10.0;
    
    CGFloat width=self.frame.size.height/_image1.size.height*_image1.size.width*c*5;
    _yellowView.width=width;
    
}









@end
