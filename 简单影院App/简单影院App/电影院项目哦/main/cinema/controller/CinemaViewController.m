//
//  CinemaViewController.m
//  电影院项目哦
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "CinemaViewController.h"
#import "MovieCommonData.h"
#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height
@interface CinemaViewController ()

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.text=@"影院";
    label.textColor=[UIColor blackColor];
    self.navigationItem.titleView=label;
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KSScreenWidth, KSScreenHeight)];
    //
    //    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    //    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //    [webView loadRequest:request];
    //    [self.view addSubview:webView];
    
    [self.view addSubview:_webView];
    [self _loadData];
    
    
}

-(void)_loadData{
    NSDictionary *dic=(NSDictionary *)[MovieCommonData requestData:@"news_detail.json"];
    NSString *title=[dic objectForKey:@"title"];
    NSString *content=[dic objectForKey:@"content"];
    NSString *source=[dic objectForKey:@"source"];
    NSString *time=[dic objectForKey:@"time"];
    NSString *author=[dic objectForKey:@"author"];
    
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *subTime=[NSString stringWithFormat:@"%@ %@",source,time];
    
    NSString *htmlSting=[NSString stringWithFormat:html,title,subTime,content,author];
    [_webView loadHTMLString:htmlSting baseURL:nil];
    
    _webView.scalesPageToFit=YES;
    
    _activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityView.frame=CGRectMake(0, 0, 50, 50);
    
    _activityView.center=self.view.center;
    
    [self.view addSubview:_activityView];
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activityView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityView stopAnimating];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
