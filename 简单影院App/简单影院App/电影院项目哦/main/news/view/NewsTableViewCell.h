//
//  NewsTableViewCell.h
//  电影院项目哦
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsMessage;


@interface NewsTableViewCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
//@property (weak, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UILabel *summary;
//@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UIImageView *image;






@property(nonatomic,strong)NewsMessage *newsMessage;

@end
