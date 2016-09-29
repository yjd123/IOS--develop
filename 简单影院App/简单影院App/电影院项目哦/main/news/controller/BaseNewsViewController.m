

#import "BaseNewsViewController.h"
#import "MovieCommonData.h"
#define KSScreenWidth [UIScreen mainScreen].bounds.size.width
#define KSScreenHeight [UIScreen mainScreen].bounds.size.height
@interface BaseNewsViewController ()

@end

@implementation BaseNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KSScreenWidth, KSScreenHeight-64)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
