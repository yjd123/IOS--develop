//
//  XCFChatViewController.m
//  XCF第一波
//
//  Created by admin on 16/10/11.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFChatViewController.h"
#import "WechatModel.h"
#import "MessageCell.h"
@interface XCFChatViewController ()

@end

@implementation XCFChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"聊天";
    
    //设置聊天背景,利用图片设置背景颜色，注意:图片后缀名是jpg，不能省略
    _chatTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
    _chatTableView.delegate=self;
    _chatTableView.dataSource=self;
    
    _textfield.delegate = self;
    
    //设置返回键的样式
    _textfield.returnKeyType = UIReturnKeySend;
    //    _textfield.enablesReturnKeyAutomatically = YES;
    
    //监听键盘弹出的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(popKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    
    
    //加载数据
    [self _loadData];
    
    [self loadLeftButton];
    [self loadRightButton];
   
}


-(void)_loadData{
    _dataArray = [NSMutableArray array];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"messages" ofType:@"plist"]];
    //如果在外面写了这句话，只会创建一个model，所以数组当中也只添加这么一个model
    //    WechatModel *model = [[WechatModel alloc]init];
    
    for (NSDictionary *dic in array) {
        WechatModel *model = [[WechatModel alloc]init];
        model.imageName = dic[@"icon"];
        model.content = dic[@"content"];
        model.mySelf = [dic[@"self"]boolValue];
        [_dataArray addObject:model];
    }
}
#pragma mark - popKeyBoard Will Show
-(void)popKeyBoard:(NSNotification *)noti{
    NSLog(@"noti = %@",noti.userInfo);
    //noti.userInfo是一个字典，字典里面的value是经过打包的，使用NSValue解包
    NSValue *value = noti.userInfo[@"UIKeyboardFrameBeginUserInfoKey"];
    //    NSDictionary *userInfo = Notification.noti;
    //    NSValue *value = [userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
    CGRect rect = [value CGRectValue];
    CGFloat height = rect.size.height;
    
    //做动画，让键盘出现时，表视图和工具视图一起飞
    [UIView animateWithDuration:.2 animations:^{
        _toolView.transform = CGAffineTransformMakeTranslation(0, -height);
        _chatTableView.transform = CGAffineTransformMakeTranslation(0, -height);
    }];
    
    //还需要表视图中的单元格进行滑动
    NSIndexPath *path = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
    
    [_chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}
#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.text.length == 0) {
        return NO;
    }
    //1.把输入的内容包装成一个新的model
    WechatModel *model = [[WechatModel alloc]init];
    model.content = textField.text;
    model.mySelf = YES;
    
    //2.加入到数组里面去
    [_dataArray addObject:model];
    
    //3.刷新表视图
    [_chatTableView reloadData];
    
    //4.输入框置空
    textField.text = nil;
    
    //5.发送消息后，跳转到相应的cell
    NSIndexPath *path = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
    
    [_chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return YES;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    //将数据传递给cell
    cell.chatModel = _dataArray[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //不能这么写，为什么？因为此时，这个cell还没有被创建，它的调用在cell创建之后，写在这里会造成递归调用
    //    MessageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    return cell.frame.size.height;
    
    WechatModel *model = _dataArray[indexPath.row];
    
    CGRect rect3 = [model.content boundingRectWithSize:CGSizeMake(160, 8888) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15] , NSParagraphStyleAttributeName : [[NSMutableParagraphStyle alloc]init]} context:nil];
    return rect3.size.height + 60;
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //让前面的toolview回到原来的位置
    [UIView animateWithDuration:.4 animations:^{
        //CGAffineTransformIdentity保存了原先进行的动画的操作
        _chatTableView.transform = CGAffineTransformIdentity;
        _toolView.transform = CGAffineTransformIdentity;
        
    }];
    
    //键盘掉下来
    //注销第一响应者
    [_textfield resignFirstResponder];
    
    //强行结束键盘的编辑状态
    //    [_textfield endEditing:YES];
    
}

//滑动过程中实时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //获取偏移量
    //让前面的toolview回到原来的位置
    [UIView animateWithDuration:.4 animations:^{
        //CGAffineTransformIdentity保存了原先进行的动画的操作
        _chatTableView.transform = CGAffineTransformIdentity;
        _toolView.transform = CGAffineTransformIdentity;
        
    }];
    
    //键盘掉下来
    //注销第一响应者
    [_textfield resignFirstResponder];
}



-(void)loadLeftButton{
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 25, 25);
    [LeftButton setBackgroundImage:[UIImage imageNamed:@"webViewIconBack"] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

-(void)loadRightButton{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 45, 45);
    
    [rightButton addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}


-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

-(void)editAction:(UIButton *)button{
    static BOOL flag = YES;
    if (flag == YES) {
        [_chatTableView setEditing:YES animated:YES];
    }else{
        [_chatTableView setEditing:NO animated:YES];
    }
    flag = !flag;
    
    //让前面的toolview回到原来的位置
    [UIView animateWithDuration:.4 animations:^{
        //CGAffineTransformIdentity保存了原先进行的动画的操作
        _chatTableView.transform = CGAffineTransformIdentity;
        _toolView.transform = CGAffineTransformIdentity;
        
    }];
    
    //键盘掉下来
    //注销第一响应者
    [_textfield resignFirstResponder];
}

@end
