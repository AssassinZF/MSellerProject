//
//  MDBSearchRecordService.m
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MDBSearchRecordService.h"

#import "MDBSearchRecordDao.h"

@implementation MDBSearchRecordService


- (instancetype)init
{
    self = [super init];
    if (self) {
        [[MDBSearchRecordDao sharedMDBSearchRecordDao] createTable];
    }
    return self;
}
- (BOOL)insertDataBaseWith:(NSString *)keyWord
{
    NSString *str = [self selectOneKeyWordWith:keyWord];
    
    BOOL result = YES;
    if (str) {
        result = [self delOneKeyWordWith:keyWord];
    }
    
    if (result) {
        return [[MDBSearchRecordDao sharedMDBSearchRecordDao] insertDataBaseWith:keyWord];
    }
    
    return NO;
}

- (BOOL)delOneKeyWordWith:(NSString *)keyWord
{
    return [[MDBSearchRecordDao sharedMDBSearchRecordDao] delOneKeyWordWith:keyWord];
}

- (NSString *)selectOneKeyWordWith:(NSString *)keyWord
{
    return [[MDBSearchRecordDao sharedMDBSearchRecordDao] selectOneKeyWordWith:keyWord];
}

- (BOOL)delAllData
{
    return [[MDBSearchRecordDao sharedMDBSearchRecordDao] delAllData];
}

- (NSMutableArray *)selectAllData
{
    return [[MDBSearchRecordDao sharedMDBSearchRecordDao] selectAllData];
}



@end
