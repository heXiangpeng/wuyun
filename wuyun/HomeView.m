//
//  HomeView.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "HomeView.h"

#import "HttpRequest.h"
#import "tableviewCellTableViewCell.h"
#import "Json.h"
#import "XmlPaser.h"

#import "NewSubmitViewController.h"
#import "NewSubmitViewController.h"
#import "ViewController.h"




@interface HomeView ()<UIScrollViewDelegate,clickIndex>


@property(nonatomic,strong
          ) UIView *navView;
@property(nonatomic,strong
          ) UIPageControl *pageControl;

@property(nonatomic,strong
          ) UILabel *lable1;
@property(nonatomic,strong
          ) UILabel *lable2;
@property(nonatomic,strong
          ) UILabel *lable3;

@property(nonatomic,strong
          ) ViewController *viewController;

@property(nonatomic,strong) UIScrollView *mainScroll;
@property(nonatomic,strong) NewSubmitViewController *con;
@property(nonatomic,strong) NewSubmitViewController *ensure;
@property(nonatomic,strong) NewSubmitViewController *public;
@property(nonatomic) int index;
@end

@implementation HomeView

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
    self.view.backgroundColor = [UIColor whiteColor];
    

    
    self.navigationItem.title = @"";
    self.navigationController.navigationBar.translucent = NO;
  
    
   _viewController = [ViewController alloc];
    
    _mainScroll = [[UIScrollView alloc] init];
    _mainScroll.backgroundColor = [UIColor clearColor];
    _mainScroll.frame = self.view.frame;
    _mainScroll.pagingEnabled = true;
    _mainScroll.showsHorizontalScrollIndicator = false;
    _mainScroll.showsVerticalScrollIndicator = false;
    _mainScroll.delegate = self;
    _mainScroll.bounces = false;
    
    [self.view addSubview:_mainScroll];
    _mainScroll.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
    
    _navView = [[UIView alloc] init];
//    _navView.backgroundColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:176/255.0 alpha:1.0];

    [self.navigationController.navigationBar addSubview:_navView];
    
    
    //    pagercontrol的实现
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake(0, 35, 0, 0);
    _pageControl.backgroundColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:176/255.0 alpha:1.0];

    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:176/255.0 alpha:1.0];


    [_navView addSubview:_pageControl];
    
    
    
    
    _lable1 = [[UILabel alloc] init];
    
    _lable1.text = @"最新提交";
    _lable1.textAlignment = NSTextAlignmentCenter;
    [_navView addSubview:_lable1];
    
    _lable2 = [[UILabel alloc] init];
    
    _lable2.text = @"最新公开";
    _lable2.textAlignment = NSTextAlignmentCenter;
    [_navView addSubview:_lable2];
    _lable3 = [[UILabel alloc] init];
    
    _lable3.text = @"最新确认";
    _lable3.textAlignment = NSTextAlignmentCenter;
    [_navView addSubview:_lable3];
    
   

    
    
    _con = [[NewSubmitViewController alloc] init];
    _con.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    _public = [[NewSubmitViewController alloc] init];
    _public.view.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    _ensure = [[NewSubmitViewController alloc] init];
    _ensure.view.frame = CGRectMake(self.view.bounds.size.width*2, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [_mainScroll addSubview:_con.view];
    [_mainScroll addSubview:_public.view];
    [_mainScroll addSubview:_ensure.view];
    
    
    [_con request:@"http://api.wooyun.org/bugs/submit"];
    [_public request:@"http://api.wooyun.org/bugs/public"];
    [_ensure request:@"http://api.wooyun.org/bugs/confirm"];
    
    
    _con.delegate = self;
    _public.delegate = self;
    _ensure.delegate = self;
    
    
}



-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _navView.frame = CGRectMake(15, 0, self.view.bounds.size.width-20, 44);
}

-(void)click:(NSString *)link{
    NSLog(@"点击");
    [self.navigationController pushViewController:_viewController animated:true];
//    NSDictionary *dic = (NSDictionary*)[_deserialized objectAtIndex:indexPath.row];
    _viewController.link = link;
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat xoffset = scrollView.contentOffset.x;
    
    CGFloat widthOffset = self.view.bounds.size.width / 100;
    CGFloat offsetPostion = 0 - xoffset/widthOffset;
    
    _lable1.frame = CGRectMake(offsetPostion, 8, self.view.bounds.size.width, 20);
    _lable2.frame = CGRectMake(offsetPostion+100, 8, self.view.bounds.size.width, 20);
    _lable3.frame = CGRectMake(offsetPostion+200, 8, self.view.bounds.size.width, 20);
    
    
    _lable1.alpha = 1 - xoffset / self.view.bounds.size.width;
    
    if (xoffset <= self.view.bounds.size.width) {
        _lable2.alpha = xoffset / self.view.bounds.size.width;
    } else {
        _lable2.alpha = 1 - (xoffset - self.view.bounds.size.width) / self.view.bounds.size.width;
    }
    _lable3.alpha = (xoffset - self.view.bounds.size.width) / self.view.bounds.size.width;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat xOffset = scrollView.contentOffset.x;
    
    //Change the pageControl dots depending on the page / offset values
    
    if (xOffset < 1.0) {
        _pageControl.currentPage = 0;
        
    } else if (xOffset < self.view.bounds.size.width+ 1) {
        _pageControl.currentPage = 1;
        
    } else {
        _pageControl.currentPage = 2;
        
    }
    
    
    
    
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
