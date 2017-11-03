//
//  AppDelegate.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ViewController.h"
#import "AppDelegate+AppService.h"

@interface AppDelegate ()

@end

#warning Bundle ID = com.mjb.mseller        

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    
    NSLog(@"这是我的改动臭妞 你能看到吗");
    if ([WXApi handleOpenURL:url delegate:[MPayManger sharedMPayManger]]) {
        return YES;
    }else if ([url.host isEqualToString:@"safepay"]){
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            MLog(@"result = %@",resultDic);
        }];
        return YES;
    }else{
        return YES;
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    if ([WXApi handleOpenURL:url delegate:[MPayManger sharedMPayManger]]) {
        return YES;
    }else if ([url.host isEqualToString:@"safepay"]){
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            MLog(@"result = %@",resultDic);
        }];
        return YES;
    }else{
        return YES;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self registerThird];
    [self sdImageConfigration];
    
    [self getUserData];
    
    [self setRootViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 用户退出登录
 
 @param toast 提示语
 */
- (void)userLoginOut:(NSString *)toast
{

    [UserModelObj clearUserInfoModel];
    [self setRootViewController];
    
    if (toast && toast.length > 0) {
        [MAppDelegateObj.window m_makeToast:toast];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
