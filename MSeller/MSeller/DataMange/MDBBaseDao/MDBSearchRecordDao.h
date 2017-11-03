//
//  MDBSearchRecordDao.h
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MDataBase.h"

@interface MDBSearchRecordDao : NSObject


singleton_interface(MDBSearchRecordDao)

-(BOOL) createTable;


- (BOOL)insertDataBaseWith:(NSString *)keyWord;

- (BOOL)delOneKeyWordWith:(NSString *)keyWord;


- (NSString *)selectOneKeyWordWith:(NSString *)keyWord;


- (BOOL)delAllData;


- (NSMutableArray *)selectAllData;


@end
