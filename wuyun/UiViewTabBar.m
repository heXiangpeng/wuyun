//
//  UiViewTabBar.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "UiViewTabBar.h"



@interface UiViewTabBar ()
@property(nonatomic,strong) UINavigationController *navhome;
@end

@implementation UiViewTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _home = [[HomeView alloc] init];
    _sec =  [[KnowlegeViewControllViewController alloc] init];
    
    UIViewController *hom = [self addchildController:_home title:@"漏洞" image:@"home" selectedImage:@"home"];
    UIViewController *sec = [self addchildController:_sec title:@"知识库" image:@"know" selectedImage:@"know"];
    
     _navhome = [[UINavigationController alloc] initWithRootViewController:hom];
     UINavigationController *navKnowlege = [[UINavigationController alloc] initWithRootViewController:sec];
    

   


    
    [self addChildViewController:_navhome];
    [self addChildViewController:navKnowlege];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (UIViewController*)addchildController:(UIViewController *)viewcontroll title:(NSString *)title image:(NSString*) image selectedImage:(NSString *)selectedImage{
    viewcontroll.title = title;
    viewcontroll.tabBarItem.image = [UIImage imageNamed:image];
    viewcontroll.tabBarItem.selectedImage = [UIImage imageNamed:image];
    
    
    return viewcontroll;
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
