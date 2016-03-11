//
//  SQLite.m
//  wuyun
//
//  Created by hexiangpeng on 15/10/28.
//  Copyright © 2015年 hexiangpeng. All rights reserved.
//

#import "SQLite.h"
#import "Bugs.h"

#define dbName "wuyun.sqlite"
@implementation SQLite
-(NSString *)dataFilePath{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *document = [path objectAtIndex:0];
    
    NSLog(@dbName);
    
    return [document stringByAppendingPathComponent:@dbName];
}

-(BOOL)openOrCreateDatabase{
    sqlite3 *database;
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        
        NSLog(@"error to create database");
        
        return NO;
    }
    
    return YES;
    
}


-(BOOL)createTable:(NSString *) sqlCreate{
    sqlite3 *database;
    char *ERROR;
    
    if (sqlite3_exec(database,[sqlCreate UTF8String], NULL, NULL, &ERROR) != SQLITE_OK) {
        NSLog(@"create table error");
        
        return NO;
    }
    
    return YES;
    
}


-(NSMutableArray *)sqlQuery:(NSString *)sqlForQuery{
    sqlite3_stmt *stmt;
    sqlite3 *database;
    NSMutableArray *queryResult = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, [sqlForQuery UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        
        
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Bugs *bugs= [[Bugs alloc] init];
            
            char *title = (char *) sqlite3_column_text(stmt, 1);
            
            bugs.title = [[NSString alloc] initWithUTF8String:title];
            
            char *author = (char *) sqlite3_column_text(stmt, 2);
            
            bugs.creator = [[NSString alloc] initWithUTF8String:author];
            
            
            char *link = (char *) sqlite3_column_text(stmt, 3);
            
            bugs.link = [[NSString alloc] initWithUTF8String:link];
            
            int type = sqlite3_column_int(stmt, 4);
            
            
            
            bugs.type = type;
            
            
            [queryResult addObject:bugs];
            
            
            
            
        }
    }
    
    return queryResult;
}


-(BOOL)insertIntoBugs:(NSMutableArray *)datas{
    char *error = NULL;
    sqlite3_stmt *stmt;
    sqlite3 *database;
    
    
    for (int i=0; i<[datas count]; i++) {
        char *insert = "INSERT INTO bugs(Title,Author,Link,type) VALUES(?,?,?,?)";
        
        if (sqlite3_prepare_v2(database, insert, -1, &stmt, nil) == SQLITE_OK) {
            
            Bugs *bugs = [datas objectAtIndex:i];
            sqlite3_bind_text(stmt, 1, [bugs.title UTF8String], -1, NULL);
            sqlite3_bind_text(stmt, 2, [bugs.creator UTF8String], -1, NULL);
            sqlite3_bind_text(stmt, 3, [bugs.link UTF8String], -1, NULL);
            
            sqlite3_bind_int(stmt, 4, bugs.type);
        }
        
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            return NO;
        }
    }
    
    
    
    return YES;
    
    
}




@end
