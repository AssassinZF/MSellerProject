//
//  AppDelegate+ViewController.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "AppDelegate+ViewController.h"
#import "MTabBarController.h"
#import "RTRootNavigationController.h"
#import "MHomeViewPage.h"
#import "MUserLoginViewPage.h"
#import "MPersonalCenterViewPage.h"
#import "MStoreHeadViewPage.h"
#import "MGuideViewPage.h"

@implementation AppDelegate (ViewController)

/**
 设置根视图
 */
- (void)setRootViewController
{
    BOOL firstApp = [UserDefaultsObj boolForKey:@"mFirstApp"];
    if (firstApp)
    {
        //是否登录过
        if (UserModelObj.token && UserModelObj.token.length > 0)
        {
            //是否已开店
            if (UserModelObj.shopkeeperflag) {
                [self setTabBarViewController];
            }else{
                [self setPageViewController:YES];
            }
        }
        else
        {
            //登录
            [self setLoginViewController];
        }
    }
    else
    {
        //第一次启动APP
        [self setPageViewController:firstApp];
        
        [UserDefaultsObj setObject:[NSNumber numberWithBool:YES] forKey:@"mFirstApp"];
        [UserDefaultsObj synchronize];
    }
}

/**
 设置引导页
 
 @param isShop 是否是开店引导  NO不是  YES是
 */
- (void)setPageViewController:(BOOL)isShop
{
    NSArray *backgroundImageNames = nil;
    NSString *btnTitle = @"";
    
    if (isShop) {
        backgroundImageNames = @[@"ggps_1_text", @"ggps_2_text", @"ggps_3_text", @"ggps_4_text"];
        btnTitle = mLocalizedString(@"mGuide_Page_Open");
    }else{
        backgroundImageNames = @[@"ggps_1_bg", @"ggps_2_bg", @"ggps_3_bg", @"ggps_4_bg"];
        btnTitle = mLocalizedString(@"mGuide_Page_Next");
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(Screen_Width*(backgroundImageNames.count-1) + (Screen_Width-mLayout_Ratio(100))/2, (Screen_Height-mLayout_Ratio(40)-mLayout_Ratio(30)), mLayout_Ratio(100), mLayout_Ratio(40));
    button.backgroundColor = MC_Orange_Color;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = button.height/2;
    
    MGuideViewPage *vc = [[MGuideViewPage alloc] initWithCoverWith:isShop imageNames:backgroundImageNames btn:button];
    MAppDelegateObj.window.rootViewController = vc;
}

/**
 设置登录页
 */
- (void)setLoginViewController
{
    MUserLoginViewPage *loginPage = [[MUserLoginViewPage alloc] init];
    self.window.rootViewController = loginPage;
}

/**
 设置显示的主页
 */
- (void)setTabBarViewController
{
    MTabBarController *tabbar = [[MTabBarController alloc] init];
    NSMutableArray *tabBarButtons = [NSMutableArray arrayWithArray:@[
                                                                     @{kItemImgName:@"ic_home",
                                                                       kItemSelImgName:@"ic_home_pressed",
                                                                       kItemTitle:@"选品"},
                                                                     @{kItemImgName:@"ic_found",
                                                                       kItemSelImgName:@"ic_found_pressed",
                                                                       kItemTitle:@"店铺"},
                                                                     @{kItemImgName:@"ic_personal",
                                                                       kItemSelImgName:@"ic_personal_pressed",
                                                                       kItemTitle:@"我的"}
                                                                     ]];
    MHomeViewPage *homeVC = [[MHomeViewPage alloc] init];
    RTRootNavigationController *homeNav = [[RTRootNavigationController alloc] initWithRootViewController:homeVC];
    
    MStoreHeadViewPage *b = [[MStoreHeadViewPage alloc] init];
    RTRootNavigationController *bNav = [[RTRootNavigationController alloc] initWithRootViewController:b];
    
    MPersonalCenterViewPage *pCenterVC = [[MPersonalCenterViewPage alloc] init];
    RTRootNavigationController *pCenterNav = [[RTRootNavigationController alloc] initWithRootViewController:pCenterVC];
    
    tabbar.viewControllers = @[homeNav, bNav, pCenterNav];
    [tabbar initTabBarButtonItems:tabBarButtons];
    self.window.rootViewController = tabbar;
}



@end
