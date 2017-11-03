//
//  MUserLoginModel.m
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MUserLoginModel.h"

#import "MLoginUserInfoData.h"

@implementation MUserLoginModel


- (void)handleSucessData:(id)dataSource messageID:(int)msgID
{

    if (msgID == mRequestGetCodeTag)
    {
        
    }
    else if (msgID == mRequestLoginTag)
    {
        UserModelObj.token = STR_IS_NULL(dataSource[@"token"]);
    }
    else if (msgID == mRequestGetUserInfoTag)
    {
        MLoginUserInfoData *userInfoData = [MLoginUserInfoData yy_modelWithDictionary:dataSource];
        userInfoData.token = UserModelObj.token;
        [UserModelObj setModel:userInfoData];
        
        //缓存用户登录获得的信息model
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfoData];
        [UserDefaultsObj setObject:data forKey:MUD_Login_UserModel];
        [UserDefaultsObj synchronize];
    }

}


@end
