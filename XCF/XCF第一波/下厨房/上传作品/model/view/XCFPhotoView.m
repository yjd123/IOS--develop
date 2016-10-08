//
//  XCFPhotoView.m
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFPhotoView.h"

@implementation XCFPhotoView

-(void)awakeFromNib
{
    [_deleteButton addTarget:self action:@selector(deletePhoto) forControlEvents:UIControlEventTouchUpInside];

}

-(void)deletePhoto{
    !self.callBack ?:self.callBack();
}


+(instancetype)photoViewWithImage:(UIImage *)image deletePhotoBlock:(deletePhotoBlock)callBack
{
    XCFPhotoView *photoView=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]lastObject];
    
    photoView.photoView.image=image;
    
    photoView.callBack=callBack;
    
    return photoView;
}

@end
