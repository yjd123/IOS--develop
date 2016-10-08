//
//  XCFTextAndPhotoView.m
//  XCF第一波
//
//  Created by admin on 16/9/15.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFTextAndPhotoView.h"
#import "XCFPhotoView.h"

@implementation XCFTextAndPhotoView{
    UIButton *_addPhotoButton;
}


-(void)awakeFromNib{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(inputText) name:UITextViewTextDidChangeNotification object:self.textView];

    // 定义增加一个addPhotoButton。
    _addPhotoButton=[UIButton buttonWithType:UIButtonTypeCustom];
   _addPhotoButton.frame=CGRectMake(14, 0, 70,70);
    [_addPhotoButton setBackgroundImage:[UIImage imageNamed:@"addPhotoStyle1" ] forState:UIControlStateNormal];
    [_addPhotoButton setTitle:@"增加" forState:UIControlStateNormal];
    
    [_addPhotoButton addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.photosView addSubview:_addPhotoButton];
}

// retainCount减为0的时候立刻调用dealloc释放
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

// 通知中心 方法
-(void)inputText{
    !self.InputTextBlock ?:self.InputTextBlock(self.textView.text);
}

// 添加图片addphotobutton 方法

-(void)addPhoto{
    !self.AddPhotoBlock ?:self.AddPhotoBlock();
}

// 设置photoArray
-(void)setPhotoArray:(NSMutableArray *)photoArray
{
//    if (_photoArray!=photoArray) {
        _photoArray=photoArray;
//    }
    
    // 清空之前存在的图片
    // 在photosView子视图中遍历
    for (id subview in self.photosView.subviews) {
        // 如果视图不是button类，就移除
        if (![subview isKindOfClass:[UIButton class]]) {
            [subview removeFromSuperview];
        }
    }
    
    NSInteger lineCount=4;
    CGFloat width=70;
    CGFloat height=width;
    
    for ( int index=0; index<photoArray.count; index++) {
        NSInteger line=index/lineCount; // 计算图片所占据的行数
        NSInteger colunms=index % lineCount; // 图片列数
        
        NSInteger x= 14+width*colunms;
        NSInteger y=height*line;
        
        WeakSelf;
        // 拿到XCFPhotoView，并且给前面instancetype的属性赋值
        
        XCFPhotoView *photoView=[XCFPhotoView photoViewWithImage:photoArray[index] deletePhotoBlock:^{
            !weakSelf.DeletePhotoBlock ?:weakSelf.DeletePhotoBlock(index);
        }];
        // 给一个动态的位置，存放照片视图
        photoView.frame=CGRectMake(x, y, width+3, height+3);
        
        [self.photosView addSubview:photoView];
    }
    
    if (photoArray.count) { //如果有照片，就进行addPhotoButton的位移
        NSInteger line1=photoArray.count/lineCount; // 图片所占据的行数
        NSInteger colunms1=photoArray.count % lineCount; // 图片列数
        
        _addPhotoButton.frame=CGRectMake(17+colunms1*width, line1*height*1.1, width,height);
        
    }else{
        _addPhotoButton.frame=CGRectMake(17, 0, width,height);
    }

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
}




    
    















@end
