//
//  NewSubmitViewController.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/27.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol clickIndex
-(void) click:(NSString *) link;
@end

@interface NewSubmitViewController : UIViewController

@property (nonatomic,retain) id<clickIndex> delegate;

-(void) request:(NSString *) url;
@end
