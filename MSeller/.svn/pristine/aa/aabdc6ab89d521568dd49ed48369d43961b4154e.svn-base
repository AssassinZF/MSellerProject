//
//  MStoreImageController.m
//  MSeller
//
//  Created by 1yyg on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreImageController.h"


#import "MStoreImageModel.h"
#import "MStoreInfoModel.h"


@interface MStoreImageController ()
{
    MStoreImageModel *_imageModel;
    NSInteger modType;
    NSString *content;
}

@end

@implementation MStoreImageController


- (void)initController
{
    _imageModel = [[MStoreImageModel alloc] init];
    [self registerModel:_imageModel];
}


- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    if (msgID == mRequestGetSignPicsTag)
        [self sendRquestGetSignPicsWithMsgID:msgID msgInfo:msgInfo];
    else if (msgID == mRequestEditShopInfoTag)
    {
        modType = [msgInfo[@"modType"] integerValue];
        content = msgInfo[@"content"];
        [self sendRequestEditShopInfoWithMsgID:msgID msgInfo:msgInfo];
    }
}


#pragma mark 发送获取店招图列表，返回路径数组请求
- (void)sendRquestGetSignPicsWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_GetSignPics_URL];
    request.action = @"getSignPics";
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
     {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [_imageModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
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



@end
