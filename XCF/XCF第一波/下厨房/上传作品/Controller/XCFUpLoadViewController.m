//  UpLoadTableViewController.m
//  XCF第一波
//
//  Created by admin on 16/9/13.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFUpLoadViewController.h"
#import "XCFTextAndPhotoView.h"
#import "XCFMealsAndTagsView.h"
#import "XCFAddTagViewController.h"

@interface XCFUpLoadViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation XCFUpLoadViewController


static CGFloat const textHeight=70;
static CGFloat const mealsAndTags=125;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"上传作品";
    _photoTextHeight=textHeight+80;
    _mealsAndTagsHeight=mealsAndTags;
    _photosArr=[NSMutableArray array];
    _tagsArr=[NSMutableArray array];
    self.tableView.backgroundColor=XCFGlobalBackgroundColor;
    [self.navigationController.navigationBar setBarTintColor:XCFGlobalBackgroundColor];
    [self _loadNavigationItem];
    [self _setUpHeader];
    
}

-(void)_setUpHeader{
    
    
    CGFloat headerHeight=_photoTextHeight+_mealsAndTagsHeight;
    
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, headerHeight)];
    
    
    
    // 接下来导入编辑textphotoView
    
   _textPhotoView=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([XCFTextAndPhotoView class]) owner:self options:nil]lastObject];
    
    WeakSelf;
    
    _textPhotoView.InputTextBlock=^(NSString *text){//编辑文字
        // 这边保存textphotoview里面的文字
    };
    
    // 判断是选择相机还是相册
    _textPhotoView.AddPhotoBlock=^{
        [weakSelf.view endEditing:YES];
        
     UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机"
    otherButtonTitles:@"相册", nil];
        [actionSheet showInView:weakSelf.view];
    };
    
    // 删除图片
    _textPhotoView.DeletePhotoBlock=^(NSUInteger index){
        [weakSelf.photosArr removeObjectAtIndex:index];
        [weakSelf updateTextPhotoView ];
        [weakSelf.tableView reloadData];
    };
    
    _textPhotoView.frame=CGRectMake(0, 0, KScreenWidth, _photoTextHeight);
 
    [_headerView addSubview:_textPhotoView];
    
    
    
    
    
    //接下来导入编辑mealsAndTags;
    
    _mealsAndTags=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([XCFMealsAndTagsView class]) owner:self options:nil]lastObject];
    
    
    // 选择中餐，午餐，or晚餐
    _mealsAndTags.SelsctedMealBlock=^(NSString *mealTags){
       // 传入你选择的类型
    };
    
    // 导入XCFAddTagViewController，添加标签
    
    _mealsAndTags.AddTagBlock=^{
        // 导入
        XCFAddTagViewController *addTags=[[XCFAddTagViewController alloc]init];
        // 用模态视图弹出
        
        // 传入写的标签
         addTags.callBack=^(NSString *tagString){
            [weakSelf.tagsArr addObject:tagString];
           [weakSelf updateMealsAndTagsView];
            [weakSelf.tableView reloadData];
        };

        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:addTags];
        [weakSelf.navigationController presentViewController:nav animated:YES completion:NULL];
     
    };
    // 删除标签
    _mealsAndTags.DeleteTagBlock=^(NSUInteger index) {
      
        [weakSelf.tagsArr removeObjectAtIndex:index];
        [weakSelf updateMealsAndTagsView];
        [weakSelf.tableView reloadData];
    };
    
    _mealsAndTags.frame=CGRectMake(0, _photoTextHeight, KScreenWidth, _mealsAndTagsHeight);

    [_headerView addSubview:_mealsAndTags];
    
    
    self.tableView.tableHeaderView=_headerView;
}

#pragma mark--属性

-(NSMutableArray *)photosArr
{
    if (!_photosArr) {
        _photosArr=[NSMutableArray array];
    }
    return _photosArr;
}

-(NSMutableArray *)tagsArr
{
    if (!_tagsArr) {
        _tagsArr=[NSMutableArray array];
    }
    return _tagsArr;
}



// 图片数量变化之后，需要对textPhotoView重新布局

-(void)updateTextPhotoView{
    
    [_textPhotoView setPhotoArray:_photosArr];
    
    NSUInteger line=_photosArr.count/4;
    
    _photoTextHeight=textHeight+80*(line+1);
    
    _textPhotoView.frame=CGRectMake(0, 0, KScreenWidth, _photoTextHeight);
    _mealsAndTags.frame=CGRectMake(0, _photoTextHeight, KScreenWidth, _mealsAndTagsHeight);
    _headerView.frame=CGRectMake(0, 0, KScreenWidth, _photoTextHeight+_mealsAndTagsHeight);
   
     self.tableView.tableHeaderView=_headerView;
    
}

// TAGS数量变化之后，需要对重新布局

-(void)updateMealsAndTagsView{
    
    [_mealsAndTags setTagsArray:_tagsArr];
    NSUInteger line=0;
    line=_tagsArr.count/3;

    _mealsAndTagsHeight=mealsAndTags+35*line;
    _textPhotoView.frame=CGRectMake(0, 0, KScreenWidth, _photoTextHeight);
    _mealsAndTags.frame=CGRectMake(0, _photoTextHeight, KScreenWidth, _mealsAndTagsHeight);
    _headerView.frame=CGRectMake(0, 0, KScreenWidth, _photoTextHeight+_mealsAndTagsHeight);
    self.tableView.tableHeaderView=_headerView;

}

#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    
    if (buttonIndex==0) {
        BOOL isCamera=[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (isCamera==NO) {
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"没有可用摄像机" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
        }else {
            UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
            imagePicker.delegate=self;
            imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePicker animated:YES completion:NULL];
        }
    }else if(buttonIndex==1){
        UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
        imagePicker.delegate=self;
        imagePicker.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:imagePicker animated:YES completion:NULL];    }
    
}

#pragma mark--UIImagePickerControlleryDeledate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
  
    
    [_photosArr addObject:info[UIImagePickerControllerOriginalImage]];

    [self updateTextPhotoView];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self.tableView reloadData];
    }];
}





#pragma mark -backButton
-(void)_loadNavigationItem
{
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 40, 30);
    [LeftButton setTitle:@"取消" forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;

    
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 40, 30);
    [rightButton setTitle:@"分享" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;

}

-(void)backAction:(UIBarButtonItem *)item
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"是否放弃上传作品" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)rightAction:(UIBarButtonItem *)item
{
    
}

// 关闭键盘

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}







@end
