//
//  MGuideModel.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGuideModel.h"

@implementation MGuideModel

- (void)handleSucessData:(id)dataSource messageID:(int)msgID{
    UserModelObj.shopkeeperflag = 1;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:UserModelObj];
    [UserDefaultsObj setObject:data forKey:MUD_Login_UserModel];
    [UserDefaultsObj synchronize];
}

@end
