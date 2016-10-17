//
//  XCFHeaderImageCell.h
//  XCF第一波
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFHeaderImageCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *headerImage;



@property(nonatomic,strong)NSString *url;

@end
