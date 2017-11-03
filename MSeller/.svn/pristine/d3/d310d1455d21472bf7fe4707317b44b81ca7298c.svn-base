//
//  MPersonalCenterModel.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalCenterModel.h"

@implementation MPersonalCenterModel

- (void)handleSucessData:(id)dataSource messageID:(int)msgID
{
    if (msgID == mRequestGetUserInfoTag) {
        //用户信息
        MLoginUserInfoData *userData = [MLoginUserInfoData yy_modelWithDictionary:dataSource];
        userData.token = UserModelObj.token;
        userData.estimateamt = UserModelObj.estimateamt;
        userData.totalearningamt = UserModelObj.totalearningamt;
        [UserModelObj setModel:userData];
        
        //缓存用户登录获得的信息model
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userData];
        [UserDefaultsObj setObject:data forKey:MUD_Login_UserModel];
        [UserDefaultsObj synchronize];
        
    }else{
        //收益信息
        UserModelObj.photo = STR_IS_NULL(dataSource[@"photo"]);
        UserModelObj.username = STR_IS_NULL(dataSource[@"nickname"]);
        UserModelObj.balance = [dataSource[@"earningbalance"] floatValue];
        UserModelObj.estimateamt = [dataSource[@"estimateamt"] intValue];
        UserModelObj.totalearningamt = [dataSource[@"totalearningamt"] intValue];
        UserModelObj.realauthflag = [dataSource[@"realauthflag"] intValue];
        
        //缓存用户登录获得的信息model
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:UserModelObj];
        [UserDefaultsObj setObject:data forKey:MUD_Login_UserModel];
        [UserDefaultsObj synchronize];
    }
}

@end
