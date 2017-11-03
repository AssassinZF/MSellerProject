//
//  MDataBaseManager.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MDataBaseManager.h"

#import "MDataBase.h"

@implementation MDataBaseManager

singleton_implementation(MDataBaseManager)


- (MDBSearchRecordService *)getDBSearchRecordService
{
    [[MDataBase sharedMDataBase] delTableWithTableName:@"SearchRecord"];
    [UserDefaultsObj synchronize];
    
    self.dbSearchRecordService = [[MDBSearchRecordService alloc] init];

    return self.dbSearchRecordService;
}



@end
