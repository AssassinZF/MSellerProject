//
//  MStoreInfoController.m
//  MSeller
//
//  Created by 1yyg on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreInfoController.h"

#import "MStoreInfoModel.h"
#import "MUploadModel.h"
#import "AFHTTPSessionManager.h"


@interface MStoreInfoController ()
{
    AFHTTPSessionManager *manager;
    MStoreInfoModel *_storeInfoModel;
    NSInteger modType;//修改类型（1：店铺名称，2：店铺描述，3：店铺风格）
    NSString *content;//修改内容
    UIImage *logoImg;//店铺logo图片
}

@end

@implementation MStoreInfoController


- (void)initController
{
    _storeInfoModel = [[MStoreInfoModel alloc] init];
    [self registerModel:_storeInfoModel];
}


- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    if (msgID == mRequestGetShopInfoTag)
        [self sendRequestGetShopInfoWithMsgID:msgID msgInfo:msgInfo];
    else if (msgID == mRequestEditShopInfoTag)
    {
        modType = [msgInfo[@"modType"] integerValue];
        content = msgInfo[@"content"];
        [self sendRequestEditShopInfoWithMsgID:msgID msgInfo:msgInfo];
    }
    else if (msgID == mRequestUploadLogoTag)
    {
        logoImg = msgInfo[@"logoImg"];
        [self sendRequestUploadStoreLogoWithMsgID:msgID msgInfo:msgInfo];
    }
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


#pragma mark 发送卖家修改店铺信息请求
- (void)sendRequestEditShopInfoWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_EditInfo_URL];
    request.action = @"edit";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:[NSNumber numberWithInteger:modType] forKey:@"modType"];
    [dic setObject:content forKey:@"content"];
    request.parameters = dic;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
     {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
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


#pragma mark 发送设置店铺Logo请求
- (void)sendRequestUploadStoreLogoWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    /*
    [UIImage compressOriginalImage:logoImg toSize:CGSizeMake(80, 80) block:^(NSData *resultData) {
        MAPIRequest *request = [[MAPIRequest alloc] init];
        request.type = MApiRequestUpload;
        request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_SetLogo_URL];
        request.action = @"setLogo";
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
        request.parameters = dic;
        request.fileData = resultData;

        [MNetworkManger uploadRequestWith:request progressBlock:nil completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            
        }];
    }];
    */

    [UIImage compressOriginalImage:logoImg toSize:CGSizeMake(80, 80) block:^(NSData *resultData) {
        MAPIRequest *request = [[MAPIRequest alloc] init];
        request.type = MApiRequestUpload;
        request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_SetLogo_URL];
        request.action = @"setLogo";
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
        request.parameters = dic;
        request.fileData = resultData;
        
        [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
         {
             if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
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
    }];
}



@end
