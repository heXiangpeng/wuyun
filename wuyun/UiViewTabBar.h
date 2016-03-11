//
//  UiViewTabBar.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "HomeView.h"
#import "KnowlegeViewControllViewController.h"

@interface UiViewTabBar : UITabBarController

@property(nonatomic,strong) HomeView *home;
@property(nonatomic,strong) KnowlegeViewControllViewController *sec;
@property(nonatomic,strong) ViewController *third;


- (UIViewController*) addchildController:(UIViewController*) viewcontroll title:(NSString*) title image:(NSString*) image selectedImage:(NSString*) selectedImage;

@end
