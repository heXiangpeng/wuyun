//
//  ViewController.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "ViewController.h"

#import "MMMarkdown.h"

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong) UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
   
    
    
   
    
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
  
    NSURLRequest*request= [NSURLRequest requestWithURL:[NSURL URLWithString:_link]];
    NSLog(@"%@",_link);
    [_webview loadRequest:request];
    [self.view addSubview:_webview];
    [super viewDidDisappear:animated];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"退出");
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    _link = nil;
    [_webview removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
