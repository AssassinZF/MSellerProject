//
//  AppDelegate.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 用户退出登录

 @param toast 提示语
 */
- (void)userLoginOut:(NSString *)toast;

@end

