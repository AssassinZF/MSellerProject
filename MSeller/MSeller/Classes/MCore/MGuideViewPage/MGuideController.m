//
//  MGuideController.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGuideController.h"
#import "MGuideModel.h"

@interface MGuideController ()
{
    MGuideModel *_model;
}

@end

@implementation MGuideController

-(void)initController
{
    _model = [[MGuideModel alloc] init];
    [self registerModel:_model];
}

- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo{
    [self sendRequestShopkeeper];
}

#pragma mark 发送用户登录请求
- (void)sendRequestShopkeeper
{
    WS(ws)
    MAPIRequest *request = [[MAPIRequest alloc] init];
    request.type = MApiRequestPost;
    request.requestURL = [NSString stringWithFormat:@"%@%@", M_SeverHost, M_Shop_Create_URL];
    request.action = @"create";
    
    [MNetworkManger sendRequestWith:request progressBlock:nil success:^(id object) {
        if (object && [[object objectForKey:mResponseCode] intValue] == 1)
        {
            //保存登录成功的信息 
            [_model handleSucessData:[object objectForKey:mResponseData] messageID:0];
            [ws.delegate update:_model msgID:0 faildCode:eDataCodeSuccess];
        }else{
            [ws.delegate update:object msgID:0 faildCode:eDataCodeServiceFaild];
        }
    } failure:^(NSError *error) {
        [ws.delegate update:error msgID:0 faildCode:eDataCodeFaild];
    }];
}

@end
