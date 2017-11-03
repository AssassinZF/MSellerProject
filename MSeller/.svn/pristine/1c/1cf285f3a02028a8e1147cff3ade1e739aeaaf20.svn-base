//
//  MGoodsDetailInfoController.m
//  MSeller
//
//  Created by TreeWrite on 2017/11/1.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailInfoController.h"
#import "MGoodsDetailInfoModel.h"

@interface MGoodsDetailInfoController ()
{
    MGoodsDetailInfoModel *_infoModel;
}

@end

@implementation MGoodsDetailInfoController

-(void)initController
{
    _infoModel = [[MGoodsDetailInfoModel alloc] init];
    [self registerModel:_infoModel];
}

- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{

    if (msgID == mRequestDetailInfoTag) {
        //获取商品详情
        [self requestDetailInfoMessageID:msgID Info:msgInfo];
    }else if (msgID == mRequestDetailPropertyTag){
        //获取规格属性
        [self requestDetailPropertyMessageID:msgID Info:msgInfo];
    }else if (msgID == mRequestDetailLikeTag){
        //添加关注
        [self requestAddLikeMessageID:msgID Info:msgInfo];

    }else if (msgID == mRequestDetailRecommTag){
        //添加推荐
        [self requestAddRecommMessageID:msgID Info:msgInfo];

    }
}

/**
 商品详情
 */
- (void)requestDetailInfoMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_Detail_URL];
    request.action = @"getdetail";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
            [_infoModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:_infoModel msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];

    
}

/**
 商品规格
 */
- (void)requestDetailPropertyMessageID:(int)msgID Info:(id)msgInfo
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestGet;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Goods_Detail_Getsku_URL];
    request.action = @"getsku";
    request.parameters = msgInfo;
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        
        if (object && [[object objectForKey:mResponseCode] intValue] == 1) {
            [_infoModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:_infoModel msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }
        
    } failure:^(NSError *error) {
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
            [_infoModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
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
            [_infoModel handleSucessData:[object objectForKey:mResponseData] messageID:msgID];
            [ws.delegate update:[object objectForKey:mResponseData] msgID:msgID faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:msgID faildCode:eDataCodeServiceFaild];
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:msgID faildCode:eDataCodeFaild];
    }];
}


@end
