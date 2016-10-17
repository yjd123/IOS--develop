//
//  XCFKindsView.h
//  XCF第一波
//
//  Created by admin on 16/10/9.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCFCartltem,XCFStepper,XCFGoods;

@interface XCFKindsView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (weak, nonatomic) IBOutlet UILabel *selectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceRangeLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property(nonatomic,strong) UILabel *buyNumber;

@property(nonatomic,copy)UIView *footView;

@property(nonatomic,strong)UITableView *table;

@property (nonatomic, strong) XCFStepper *stepper;           // 计数器

@property (nonatomic, strong) XCFCartltem *cartItem; // 记录属性，确定购买时通过回调传递给控制器
@property (nonatomic, assign) XCFKindsViewType type;    // 弹框类型

@property (nonatomic, strong) XCFGoods *goods;        // 商品数据

@property (nonatomic, copy) void (^dismissBlock)();

@property (nonatomic, copy) void (^confirmBlock)(XCFCartltem *); // 确定回调，回传选择好的商品属性
@property (nonatomic, copy) void (^animationBlock)(UIImage *, CGRect); // 执行图片动画回调，动画要在上一层执行，回传图片以及frame

@end
