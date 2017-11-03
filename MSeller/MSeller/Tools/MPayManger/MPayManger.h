//
//  MPayManger.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

typedef void(^WXCallback)(BaseResp *resp);

@interface MPayManger : NSObject <WXApiDelegate>

@property (nonatomic, weak) WXCallback callback;

/**
 注册
 */
+ (void)registerApp;

singleton_interface(MPayManger)

/**
 微信支付

 @param paramInfo 参数
 @param callback 支付结果回调Block
 */
- (void)m_sendWXPayReq:(NSDictionary *)paramInfo callback:(WXCallback)callback;

/**
 支付宝支付
 *  @param orderString  订单信息
 *  @param completionBlock 支付结果回调Block
 */
- (void)m_sendAilPayReq:(NSString *)orderString callback:(CompletionBlock)completionBlock;

@end
