



#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

-(void)pushWebViewWithURL:(NSString *)url{
    UIViewController *viewController=[[UIViewController alloc]init];
    UIWebView *web=[[UIWebView alloc]initWithFrame:viewController.view.bounds];
    web.backgroundColor=XCFGlobalBackgroundColor;
    
    [viewController.view addSubview:web];
    
    UIButton *LeftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    LeftButton.frame=CGRectMake(0, 0, 40, 30);
    [LeftButton setTitle:@"返回" forState:UIControlStateNormal];
    [LeftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [LeftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftButton];
    viewController.navigationItem.leftBarButtonItem=leftItem;
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [web loadRequest:request];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self.navigationController presentViewController:nav animated:YES completion:NULL];
    
    [viewController.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}


@end
