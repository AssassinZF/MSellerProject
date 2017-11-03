//
//  AppDelegate+AppService.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "SDWebImageManager.h"
#import "MLoginUserInfoData.h"


@implementation AppDelegate (AppService)

/**
 *  系统配置
 */
- (void)systemConfigration
{
    
}

/**
 *  SDWebImage设置
 */
- (void)sdImageConfigration
{
    [[SDWebImageManager sharedManager] imageDownloader].headersFilter = ^NSDictionary *(NSURL *url, NSDictionary *headers){
        NSMutableDictionary *mutableHeaders = [headers mutableCopy];
        [mutableHeaders removeObjectForKey:@"host"];
        [mutableHeaders setValue:@"devimg.manjd.net" forKey:@"host"];
        return mutableHeaders;
    };
    [[SDImageCache sharedImageCache] setMaxMemoryCost:1024 * 1024 * 6 / 4];
}

/**
 *  第三方注册
 */
- (void)registerThird
{
    [MPayManger registerApp];
}

/**
 *  注册推送
 */
- (void)registerPush
{
    
}

/**
 *  检查更新
 */
- (void)checkAppUpData
{
    
}

/**
 *  获取用户缓存信息
 */
- (void)getUserData
{
    NSData *data = [UserDefaultsObj objectForKey:MUD_Login_UserModel];
    if (data)
    {
        MLoginUserInfoData *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [UserModelObj setModel:model];
    }
}

@end
