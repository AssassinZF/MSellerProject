//
//  MSearchResultController.m
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchResultController.h"

#import "MSearchResultModel.h"


@interface MSearchResultController ()
{
    MSearchResultModel *_resultModel;
}

@end

@implementation MSearchResultController


- (void)initController
{
    _resultModel = [[MSearchResultModel alloc] init];
    [self registerModel:_resultModel];
}


- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    //用户搜索结果请求
    if (msgID == mRequestSearchResultTag || msgID == mRequestSearchResultMoreTag)
        [self sendRequestSearchResultWithMsgID:msgID msgInfo:msgInfo];
    else if (msgID == mRequestSearchAddLikeTag)
    {
        [self sendRequestAddLikeMessageID:msgID Info:msgInfo];
    }
    else if (msgID == mRequestSearchRecommTag)
    {
        [self sendRequestAddRecommMessageID:msgID Info:msgInfo];
    }
}


#pragma mark 发送用户搜索结果请求
- (void)sendRequestSearchResultWithMsgID:(int)msgID msgInfo:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_Search_URL];
    request.action = @"search";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:msgInfo[@"search"] forKey:@"search"];
    [dic setObject:msgInfo[@"pagenum"] forKey:@"pagenum"];
    [dic setObject:msgInfo[@"pagesize"] forKey:@"pagesize"];
    request.parameters = dic;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object)
     {
         if (msgID == mRequestSearchResultTag) {
             [_resultModel deleteAllResultListData];
         }
         if (object && [[object objectForKey:@"code"] intValue] == 1)
         {
             [_resultModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
             [ws.delegate update:nil msgID:msgID faildCode:eDataCodeSuccess];
         }
         else
         {
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
         }
     } failure:^(NSError *error) {
         if (msgID == mRequestSearchResultTag) {
             [_resultModel deleteAllResultListData];
         }
         [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
     }];
}


/**
 添加关注
 */
- (void)sendRequestAddLikeMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_RecommAndLike_URL];
    request.action = @"dogoods";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
            [_resultModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:[object objectForKey:mResponseData] msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }

    } failure:^(NSError *error) {
         [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}

/**
 添加推荐
 */
- (void)sendRequestAddRecommMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_RecommAndLike_URL];
    request.action = @"dogoods";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [_resultModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
             [ws.delegate update:[object objectForKey:mResponseData] msgID:msgID faildCode:eDataCodeSuccess];
         }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
         }

    } failure:^(NSError *error) {
         [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}



@end
