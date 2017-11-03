//
//  MOtherDefine.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#ifndef MOtherDefine_h
#define MOtherDefine_h


#pragma mark NSUserDefaults 宏定义-------
//保存最近一次登录成功的账户手机号
#define MUD_Login_PhoneNum  @"MUD_Login_PhoneNum"
//用户信息model实例缓存
#define MUD_Login_UserModel @"MUD_Login_UserModel"
//本地历史搜索记录
#define MUD_Search_History  @"MUD_Search_History"

//请求返回通用KEY
#define mResponseMessage    @"message"
#define mResponseData       @"data"
#define mResponseCode       @"code"
//请求条数
#define mRequestPageSize    @"10"
//默认图片
#define mPlaceHolderImage   @"ic_found_pressed"
//默认图片
#define mUserLogoImage      @"login_Logo"

//屏幕bounds
#define Screen_Bounds   [[UIScreen mainScreen] bounds]
//屏幕size
#define Screen_Size     [[UIScreen mainScreen] bounds].size
//屏幕高度
#define Screen_Height   [[UIScreen mainScreen] bounds].size.height
//屏幕宽度
#define Screen_Width    [[UIScreen mainScreen] bounds].size.width
//屏幕比例
#define ScreenSizeScale     Screen_Width/375.f
//屏幕适配
#define mLayout_Ratio(x)    (x*ScreenSizeScale)

//keyWindow
#define mWindow     [UIApplication sharedApplication].keyWindow
#define MAppDelegateObj  ((AppDelegate *)[UIApplication sharedApplication].delegate)

//16进制颜色
#define mColorFromHex(s)    mColorFromAHex(s,1.0)
#define mColorFromAHex(s,a) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0 alpha:a]
//随机颜色
#define MRandomColor    [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//RGB颜色
#define MRGBColor(r, g, b)      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define MRGBAColor(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//判断字符串是否为空
#define STR_IS_NULL(str)    (str)?(str):@""

//强弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define STRONG_SELF if (!weakSelf) return; \
__strong typeof(weakSelf) strongSelf = weakSelf

//获取本地化文字
#define mLocalizedString(key)   NSLocalizedStringFromTable(key,@"LocalizedString", nil)

//获取图片资源
#define mGetImage(imageName)    [UIImage imageNamed:imageName]

//获取沙盒目录
#define mPathTemp NSTemporaryDirectory()    //temp
#define mPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] //Document
#define mPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]  //Cache

//单列
#define singleton_interface(class) + (instancetype)shared##class;
#define singleton_implementation(class) \
static class *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
if (_instance == nil) { \
_instance = [[class alloc] init]; \
} \
return _instance; \
}

//打印
#ifdef DEBUG
#define MLog(...) NSLog(__VA_ARGS__)
#else
#define MLog(...)

#endif


#endif /* MOtherDefine_h */
