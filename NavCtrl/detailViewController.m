//
//  detailViewController.m
//  NavCtrl
//
//  Created by Sean Reed on 7/17/14.
//  Copyright (c) 2014 Aditya Narayan. All rights reserved.
//

#import "detailViewController.h"

@implementation detailViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    if(!self.webView)
    {
     
        //Added by Aditya
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
        
        //Added by Aditya
        [self.view addSubview:self.webView];
        
    }
    self.url = [NSURL URLWithString:self.title];

    
    self.webView.scalesPageToFit = YES;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Title is %@", self.title);
    
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"\nwebViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
        NSLog(@"\nwebViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"\n didFailLoadWithError: %@", error);
}

@end
