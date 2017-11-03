//
//  MDBSearchRecordDao.m
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MDBSearchRecordDao.h"

@implementation MDBSearchRecordDao


singleton_implementation(MDBSearchRecordDao)


-(BOOL) createTable
{
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return NO;
    }
    
    NSString *sql = @"CREATE TABLE if not exists SearchRecord (ID integer PRIMARY KEY AUTOINCREMENT,KeyWord TEXT)";
    __block BOOL result = NO;
    
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
        
    }];
    
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    return result;
}


- (BOOL)insertDataBaseWith:(NSString *)keyWord
{
    __block BOOL result = NO;
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return NO;
    }
    
    NSString *sql =@"INSERT INTO SearchRecord (KeyWord) VALUES (?)";
    
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql,keyWord];
        
    }];
    
    
    [dataBase closeDataBaseQueue];
    
    
    [dataBase closeDatabase];
    
    
    return result;
}


- (BOOL)delOneKeyWordWith:(NSString *)keyWord
{
    __block BOOL result = NO;
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return NO;
    }
    
    NSString *sql =@"DELETE from SearchRecord WHERE KeyWord=?";
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql,keyWord];
        
    }];
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    
    return result;
}


- (NSString *)selectOneKeyWordWith:(NSString *)keyWord
{
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return nil;
    }
    
    __block NSString *str;
    
    NSString *sql =@"Select * from SearchRecord WHERE KeyWord=?";
    
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *set = [db executeQuery:sql,keyWord];
        while ([set next]) {
            str = [set stringForColumn:@"KeyWord"];
        }
    }];
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    
    return str;
}


- (BOOL)delAllData
{
    __block BOOL result = NO;
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return NO;
    }
    
    NSString *sql = @"DELETE from SearchRecord";
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
        
    }];
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    
    return result;
}


- (NSMutableArray *)selectAllData
{
    MDataBase *dataBase = [MDataBase sharedMDataBase];
    if (![dataBase openDatabase]) {
        MLog(@"数据库打开失败");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    
    [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * set = [db executeQuery:@"Select * from SearchRecord"];
        while ([set next]) {
            NSString *str = [set stringForColumn:@"KeyWord"];
            
            [arr addObject:str];
        }
    }];
    
    [dataBase closeDataBaseQueue];
    
    [dataBase closeDatabase];
    
    if (arr.count == 0) {
        return nil;
    }
    return arr;
}


@end
