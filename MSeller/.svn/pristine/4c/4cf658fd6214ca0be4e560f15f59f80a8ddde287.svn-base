//
//  MUserLoginController.m
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MUserLoginController.h"

@interface MUserLoginController()
{
    MUserLoginModel *_loginModel;
    NSString *phoneNumStr;
    NSString *authCodeStr;
    NSInteger smstype;//业务类型，1登录验证码 2找回密码 3换绑手机号 4收益提现
}

@end

@implementation MUserLoginController


- (void)initController
{
    _loginModel = [[MUserLoginModel alloc] init];
    [self registerModel:_loginModel];
}


- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    phoneNumStr = msgInfo[@"phoneNum"];
    authCodeStr = msgInfo[@"authCode"];
    //获取验证码请求
    if (msgID == mRequestGetCodeTag)
    {
        smstype = [msgInfo[@"smstype"] integerValue];
        [self sendRequestGetCode:msgInfo];
    }
    //用户登录请求
    else if (msgID == mRequestLoginTag)
        [self sendRequestUserLogin:msgInfo];
    else if (msgID == mRequestGetUserInfoTag)
        [self sendRequestGetUserInfoWithMsgID:msgID msgInfo:msgInfo];
}


#pragma mark 发送获取验证码请求
- (void)sendRequestGetCode:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_User_SMSCode_URL];
    request.action = @"getcode";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:phoneNumStr forKey:@"mobile"];
    [dic setObject:[NSNumber numberWithInteger:smstype] forKey:@"smstype"];
    request.parameters = dic;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
     {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [ws.delegate update:nil msgID:mRequestGetCodeTag faildCode:eDataCodeSuccess];
         }else{
             if (object)
             {
                 [ws.delegate update:object msgID:mRequestGetCodeTag faildCode:eDataCodeServiceFaild];
             }else{
                 [ws.delegate update:nil msgID:mRequestGetCodeTag faildCode:eDataCodeJsonError];
             }
         }
     } failure:^(NSError *error) {
         [ws.delegate update:error msgID:mRequestGetCodeTag faildCode:eDataCodeFaild];
     }];
}


#pragma mark 发送获取用户个人信息请求
- (void)sendRequestGetUserInfoWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_User_GetUserInfo_URL];
    request.action = @"getuserinfo";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    request.parameters = dic;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1)
        {
            [_loginModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:_loginModel msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            if (object)
            {
                [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
            }else{
                [ws.delegate update:nil msgID:msgID faildCode:eDataCodeJsonError];
            }
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}


#pragma mark 发送用户登录请求
- (void)sendRequestUserLogin:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_User_Login_URL];
    request.action = @"login";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:phoneNumStr forKey:@"mobile"];
    [dic setObject:authCodeStr forKey:@"smscode"];
    request.parameters = dic;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1)
        {
            //保存登录成功的账号
            [UserDefaultsObj setValue:phoneNumStr forKey:MUD_Login_PhoneNum];
            [UserDefaultsObj synchronize];
            
            [_loginModel handleSucessData:[object objectForKey:mResponseData] messageID:mRequestLoginTag];
            
            [ws.delegate update:_loginModel msgID:mRequestLoginTag faildCode:eDataCodeSuccess];
        }else{
            if (object)
            {
                [ws.delegate update:object msgID:mRequestLoginTag faildCode:eDataCodeServiceFaild];
            }else{
                [ws.delegate update:nil msgID:mRequestLoginTag faildCode:eDataCodeJsonError];
            }
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:mRequestLoginTag faildCode:eDataCodeFaild];
    }];
}



@end
