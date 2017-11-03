//
//  MDataBase.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MDataBase.h"

#define  DBNAME   @"MDataBase.db"

@interface MDataBase()

@end

@implementation MDataBase

singleton_implementation(MDataBase)

-(void)dealloc
{
    [self.dbQueue close];
    self.dbQueue = nil;
    self.db = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = arr[0];
        NSString *dataBasePath;
        
        dataBasePath = [path stringByAppendingPathComponent:DBNAME];
        self.db = [FMDatabase databaseWithPath:dataBasePath];
        if (![self openDatabase]) {
            return nil;
        }
        [self closeDatabase];
        
        if (self.dbQueue) {
            [self.dbQueue close];
            self.dbQueue = nil;
        }
        self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:dataBasePath];

    }
    return self;
}

- (BOOL)openDatabase
{
    return [self.db open];
}

- (BOOL)closeDatabase
{
    return [self.db close];
}

-(void) closeDataBaseQueue
{
    [self.dbQueue close];
}

- (BOOL)delTableWithTableName:(NSString *)tableName
{
    __block BOOL result = NO;
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    if (![dataBase openDatabase]) {
        //数据库打开失败
        return NO;
    }
    NSString *sql = [NSString stringWithFormat:@"DROP TABLE %@",tableName];
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
        
    }];
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    return result;
}

@end
