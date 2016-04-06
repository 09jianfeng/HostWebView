//
//  ViewController.m
//  HostWebView
//
//  Created by 陈建峰 on 16/3/31.
//  Copyright © 2016年 DouJinSDK. All rights reserved.
//

#import "ViewController.h"
#import "MyURLProtocolHostEdit.h"

@interface ViewController () <UIWebViewDelegate,NSURLConnectionDelegate>
@property(nonatomic,assign,getter =isAuthed)BOOL authed;
@property(nonatomic,retain) NSMutableURLRequest* originRequest;
@property(nonatomic,strong)NSURL *currenURL;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = (UIWebView *)[self.view viewWithTag:10001];
    webView.delegate = self;
    webView.scrollView.bounces = NO;
    self.currenURL = [NSURL URLWithString:@"https://www.baidu.com/"];
    [MyURLProtocolHostEdit addHost:@"www.baidu.com" ip:@"14.215.177.37"];
    self.originRequest = [[NSMutableURLRequest alloc] initWithURL:self.currenURL];
    [webView loadRequest:self.originRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)awebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* scheme = [[request URL] scheme];
    NSLog(@"scheme = %@",scheme);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
@end
