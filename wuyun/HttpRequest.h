//
//  HttpRequest.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject



typedef void(^GetString)(NSData *string);
+(HttpRequest*) instance;
-(void) httprequest:(NSString*) url compilete: (GetString) bolock ;




@end
