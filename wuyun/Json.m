//
//  Json.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/25.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "Json.h"

@implementation Json

+(Json *)instance{
    static Json *instanse;
    if (!instanse) {
        instanse = [[Json alloc] init];
    }
    
    return instanse;
}


-(void)dataConvertJson:(NSData *)data complete:(dataToJson)block{
    NSError *error = nil;
    id jsonobject = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
    
    if (jsonobject != nil && error == nil) {
        block(jsonobject);
        
        if ([jsonobject isKindOfClass:[NSDictionary class]]) {
            
        }else if ([jsonobject isKindOfClass:[NSArray class]]){
            
        }else{
            NSLog(@"json error");
        }
    }

}

@end
