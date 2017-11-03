//
//  MDataBaseManager.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MDBSearchRecordService.h"

@interface MDataBaseManager : NSObject

singleton_interface(MDataBaseManager)


@property (nonatomic, strong) MDBSearchRecordService *dbSearchRecordService;


- (MDBSearchRecordService *)getDBSearchRecordService;

@end
