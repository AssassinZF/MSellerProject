//
//  MStoreHeadController.m
//  MSeller
//
//  Created by 1yyg on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreHeadController.h"

#import "MStoreInfoModel.h"


@interface MStoreHeadController ()
{
    MStoreInfoModel *_storeInfoModel;
}

@end

@implementation MStoreHeadController


- (void)initController
{
    _storeInfoModel = [[MStoreInfoModel alloc] init];
    [self registerModel:_storeInfoModel];
}


- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    if (msgID == mRequestGetShopInfoTag)
        [self sendRequestGetShopInfoWithMsgID:msgID msgInfo:msgInfo];
}


#pragma mark 发送卖家获取店铺基础信息请求
- (void)sendRequestGetShopInfoWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_GetInfo_URL];
    request.action = @"getShop";
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
     {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [_storeInfoModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
             [ws.delegate update:[object objectForKey:mResponseData] msgID:msgID faildCode:eDataCodeSuccess];
         }else{
             if (object)
             {
                 [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
             }else{
                 [ws.delegate update:object msgID:msgID faildCode:eDataCodeJsonError];
             }
         }
     } failure:^(NSError *error) {
         [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
     }];
}



@end
