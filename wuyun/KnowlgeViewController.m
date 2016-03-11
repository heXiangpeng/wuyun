//
//  KnowlgeViewController.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/26.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "KnowlgeViewController.h"
#import "MMMarkdown.h"

@interface KnowlgeViewController ()
@property(nonatomic,strong) UIWebView *webview;
@end

@implementation KnowlgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:176/255.0 alpha:1.0];
    self.navigationItem.title = _navtitle;
    _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    NSLog(@"结果：%@",_navtitle);
    
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建图片链接
    dispatch_async(globalQueue, ^{
        NSError  *error;
        NSString *htmlString1 = [MMMarkdown HTMLStringWithMarkdown:_text error:&error];
        
        
      
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_webview loadHTMLString:htmlString1 baseURL:nil];

        });
        
    });

    
    
       // Do any additional setup after loading the view.
    
    [self.view addSubview:_webview];
}


-(void)viewDidDisappear:(BOOL)animated{
//    _text = nil;
    
//    [[NSURLCache sharedURLCache] removeAllCachedResponses];
 
    [_webview removeFromSuperview];
    [super viewDidDisappear:animated];
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
