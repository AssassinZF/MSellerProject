//
//  MDataBase.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface MDataBase : NSObject

@property (strong, nonatomic) FMDatabase *db;
@property (strong, nonatomic) FMDatabaseQueue *dbQueue;

singleton_interface(MDataBase)

- (BOOL)openDatabase;

- (BOOL)closeDatabase;

-(void) closeDataBaseQueue;

- (BOOL)delTableWithTableName:(NSString *)tableName;

@end
