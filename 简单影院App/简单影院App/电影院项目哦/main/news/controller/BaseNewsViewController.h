//
//  BaseNewsViewController.h
//  电影院项目哦
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 可可. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNewsViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *_webView;
    UIActivityIndicatorView *_activityView;
}
@end
