//
//  HttpRequest.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/24.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest
static HttpRequest *instance;
+(HttpRequest*) instance{
  
    
    if (!instance) {
        instance = [[HttpRequest alloc] init];
    }
    
    return instance;
}


- (void)httprequest:(NSString *)url compilete:(GetString)bolock{
    NSURL *url1 = [NSURL URLWithString:url];
  
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data.length > 0 && error == nil) {
//            NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",json);
            bolock(data);
        }else if (error != nil){
            
        }
        
    }];
    
    [task resume];
}


@end
