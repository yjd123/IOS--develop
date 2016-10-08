//
//  XCFGoodsReviewCell.m
//  XCF第一波
//
//  Created by admin on 16/10/7.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFGoodsReviewCell.h"
#import "XCFReview.h"
#import "XCFAuthor.h"
#import "XCFReviewPhoto.h"
@implementation XCFGoodsReviewCell




-(void)awakeFromNib{
    _authorPhoto=[[UIImageView alloc]initWithFrame:CGRectMake(71, 169, 53, 53)];

    _authorPhoto.layer.cornerRadius=25;
   
    [self addSubview:_authorPhoto];
   

}



-(void)setReview:(XCFReview *)review
{
    _review=review;
    
    _authorName.text=review.author.name;
    _authorName.textAlignment=NSTextAlignmentCenter;
    
    
    _desc.textAlignment=NSTextAlignmentCenter;
    if (_desc.text.length) {
    _desc.text=review.review;
    }else{
        _desc.text=@"该用户未评论";
    }
   
    [_authorPhoto sd_setImageWithURL:[NSURL URLWithString:review.author.photo60]];
    
    NSArray *array=review.photos;
    
    NSDictionary *photo=array[0];
    
    NSString *url=[photo objectForKey:@"url"];
    
    
    [_foodPictures sd_setImageWithURL:[NSURL URLWithString:url]];
}

@end
