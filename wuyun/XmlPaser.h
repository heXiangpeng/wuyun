//
//  XmlPaser.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/25.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlPaser : NSObject
typedef void(^getXml)(NSMutableArray * array);
+(XmlPaser*) instance;
-(void) dataToXml:(NSData *)data complite:(getXml) block;
@end
