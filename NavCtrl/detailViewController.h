//
//  detailViewController.h
//  NavCtrl project
// shows the web view pushed from child controller
//
//  Created by Sean Reed on 7/17/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) UIWebView *webView;

@end
