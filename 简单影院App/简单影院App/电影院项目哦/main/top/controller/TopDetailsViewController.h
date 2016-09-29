//
//  TopDetailsViewController.h
//  电影院项目哦
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopDetailsCollection;
@interface TopDetailsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UILabel *_score;
    UILabel *_name;
    UIImageView *_headPicture;
    UILabel *_content;
    
    
    
    
    
    NSString *_text;
    NSMutableString *_str;
    NSMutableString *_str1;
    
    NSArray *_images;
    NSMutableArray *_arr;
}
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *directorName;
@property (weak, nonatomic) IBOutlet UILabel *movieStar;
@property (weak, nonatomic) IBOutlet UILabel *movieType;
@property (weak, nonatomic) IBOutlet UILabel *movieTime;
@property (weak, nonatomic) IBOutlet UILabel *year;


@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UITableView *table;




@end
