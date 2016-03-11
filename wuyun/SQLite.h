//
//  SQLite.h
//  wuyun
//
//  Created by hexiangpeng on 15/10/28.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"


@interface SQLite : NSObject

-(NSString *) dataFilePath;
-(BOOL) openOrCreateDatabase;

-(BOOL) createTable:(NSString *) sqlCreate;

-(NSMutableArray *) sqlQuery:(NSString*) sqlForQuery;
-(BOOL) insertIntoBugs:(NSMutableArray*) datas;
@end
