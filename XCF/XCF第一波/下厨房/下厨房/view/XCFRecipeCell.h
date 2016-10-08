//
//  XCFRecipeCell.h
//  XCF第一波
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFItems;

@interface XCFRecipeCell : UITableViewCell
/** 数据 */
@property(nonatomic,strong)XCFItems *items;

/** 图片 */
@property (nonatomic, strong) UIImageView *image;
/** 分割线 */
@property (nonatomic, strong) UIView *separator;
/** 视频播放按钮 */
@property (nonatomic, strong) UIImageView *videoIcon;
/** 模板1描述 */
@property (nonatomic, strong) UILabel *descLabel;
/** 模板1标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 底部描述view */
@property (nonatomic, strong) UIView *bottomView;
/** 模板2大标题 */
@property (nonatomic, strong) UILabel *firstTitleLabel;
/** 模板2小标题 */
@property (nonatomic, strong) UILabel *secondTitleLabel;
/** 模板4标题 */
@property (nonatomic, strong) UILabel *whisperLabel;
/** coverView */
@property (nonatomic, strong) UIView *coverView;
/** 模板5作者头像 */
@property (nonatomic, strong) UIImageView *authorIcon;
/** 模板5人数 */
@property (nonatomic, strong) UILabel *cookedLabel;

/******************************************************************/

/** 分数 */
@property (nonatomic, strong) UILabel *scoreLabel;
/** 作者名称 */
@property (nonatomic, strong) UILabel *authorName;
/** 独家图标 */
@property (nonatomic, strong) UIButton *exclusiveButton;

@property (nonatomic, strong) UILabel *talkBigTitleLabel;

@property (nonatomic, strong) UILabel *talkSmallTitleLabel;

@property(nonatomic,copy)void(^authorIconClickedBlock)();





@end
