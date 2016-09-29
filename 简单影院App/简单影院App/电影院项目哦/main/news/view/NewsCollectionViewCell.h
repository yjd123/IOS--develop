//
//  NewsCollectionViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsMessage;
@interface NewsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property(nonatomic,strong)NewsMessage *message;



@end
