//
//  Json.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/25.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Json : NSObject
// typedef
typedef void(^dataToJson)(id data);

+(Json*) instance;


-(void) dataConvertJson:(NSData *)data complete:(dataToJson) block;

@end
