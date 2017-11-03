//
//  MHomeController.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MHomeController.h"


@interface MHomeController()
{
    MHomeModel *_model;
}
@end

@implementation MHomeController

-(void)initController
{
    _model = [[MHomeModel alloc] init];
    [self registerModel:_model];
}

- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    if (msgID == mRequestGetCateTag) {
        [self requestGetCateMessageID:msgID];
    }else if (msgID == mRequestGetListTag || msgID == mRequestGetListMoreTag){
        [self requestGetListMessageID:msgID Info:msgInfo];
    }else if (msgID == mRequestAddLikeTag){
        [self requestAddLikeMessageID:msgID Info:msgInfo];
    }else if (msgID == mRequestRecommTag){
        [self requestAddRecommMessageID:msgID Info:msgInfo];
    }
}

/**
 获取分类数据
 */
- (void)requestGetCateMessageID:(int)msgID
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_GetCate_URL];
    request.action = @"getcate";
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
            [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:_model msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}


/**
 获取列表数据
 */
- (void)requestGetListMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_GetList_URL];
    request.action = @"getlist";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (msgID == mRequestGetListTag) {
            [_model deleteCateListData];
        }
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
            [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:_model msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }

    } failure:^(NSError *error) {
        if (msgID == mRequestGetListTag) {
            [_model deleteCateListData];
        }
        [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}


/**
 添加关注
 */
- (void)requestAddLikeMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_RecommAndLike_URL];
    request.action = @"dogoods";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
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
- (void)requestAddRecommMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_RecommAndLike_URL];
    request.action = @"dogoods";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
         if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
             [_model handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
             [ws.delegate update:[object objectForKey:mResponseData] msgID:msgID faildCode:eDataCodeSuccess];
         }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
         }
    } failure:^(NSError *error) {
         [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}



@end