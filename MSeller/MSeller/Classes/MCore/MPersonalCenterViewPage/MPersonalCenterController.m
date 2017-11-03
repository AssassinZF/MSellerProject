//
//  MPersonalController.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalCenterController.h"

@interface MPersonalCenterController ()
{
    MPersonalCenterModel *_model;
}

@end

@implementation MPersonalCenterController

- (void)initController
{
    _model = [[MPersonalCenterModel alloc] init];
    [self registerModel:_model];
}

- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    if (msgID == mRequestGetUserInfoTag) {
        [self requestUserInfoDataID:msgID messageInfo:msgInfo];
    }else{
        [self requestMyInfoDataID:msgID messageInfo:msgInfo];
    }
    
}

//用户信息
- (void)requestUserInfoDataID:(int)msgID messageInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_User_GetUserInfo_URL];
    request.action = @"getuserinfo";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1)
        {
            [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:nil msgID:msgID faildCode:eDataCodeSuccess];
        }
        else
        {
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

//收益信息
- (void)requestMyInfoDataID:(int)msgID messageInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_User_GetMyInfo_URL];
    request.action = @"getmyinfo";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1)
        {
            [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:nil msgID:msgID faildCode:eDataCodeSuccess];
        }
        else
        {
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

@end
