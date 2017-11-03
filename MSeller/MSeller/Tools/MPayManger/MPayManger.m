//
//  MPayManger.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPayManger.h"

@implementation MPayManger

singleton_implementation(MPayManger)

+ (void)registerApp
{
    [WXApi registerApp:@"wxb4ba3c02aa476ea1"];
}

- (void)m_sendWXPayReq:(NSDictionary *)paramInfo callback:(WXCallback)callback
{
    self.callback = callback;
    NSMutableString *stamp  = [paramInfo objectForKey:@"timestamp"];

    PayReq* req = [[PayReq alloc] init];
    req.partnerId = [paramInfo objectForKey:@"partnerid"];
    req.prepayId = [paramInfo objectForKey:@"prepayid"];
    req.nonceStr = [paramInfo objectForKey:@"noncestr"];
    req.timeStamp = stamp.intValue;
    req.package = [paramInfo objectForKey:@"package"];
    req.sign = [paramInfo objectForKey:@"sign"];
    [WXApi sendReq:req];
}

- (void)m_sendAilPayReq:(NSString *)orderString callback:(CompletionBlock)completionBlock
{
    /*
    将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                             orderInfoEncoded, signedString];
     */
    
    //调用支付的app注册在info.plist中的scheme
    NSString *appScheme = @"mjbseller";
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        NSLog(@"reslut = %@",resultDic);
        if (completionBlock) {
            completionBlock(resultDic);
        }
    }];
}


#pragma mark - 微信支付回调
#pragma mark - WXApiDelegate

- (void)onResp:(BaseResp *)resp {
    if([resp isKindOfClass:[PayResp class]]){
        if (self.callback) {
            self.callback(resp);
        }
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case WXSuccess:
                MLog(@"支付结果：成功！");
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                MLog(@"%@",[NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr]);
                break;
        }
    }
}

@end
