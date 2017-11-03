//
//  MBaseModel.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/29.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBaseModel : NSObject

/**
 *  处理数据接口，数据可能来自网络，也可能来自本地
 *  由子类实现具体数据处理
 *
 *  @dataSource 数据源
 *  @msgID    消息ID
 */
-(void)handleSucessData:(id)dataSource messageID:(int)msgID;


@end
