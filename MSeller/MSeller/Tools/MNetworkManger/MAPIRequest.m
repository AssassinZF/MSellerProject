//
//  MAPIRequest.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MAPIRequest.h"

@implementation MAPIRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    self.type = MApiRequestGet;
    self.requestURL = @"";
    #warning 域名可以用的时候需要把 severHost的值默认为域名
    self.severHost = M_APIHeadHost;
}

/**
 设置请求类型
 
 @param type MApiRequestType
 */
- (void)setType:(MApiRequestType)type
{
    if (type == MApiRequestGet || type == MApiRequestPost) {
        self.timeOut = mAPIRequestTimeOut;
    }else{
        self.timeOut = mAPIRequestFileTimeOut;
    }
    _type = type;
}

- (void)setRequestURL:(NSString *)requestURL
{
    _requestURL = [NSString stringWithFormat:@"%@%@", M_HeadHost, requestURL];
}


@end
