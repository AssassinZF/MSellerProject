//
//  MUtilities.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//NSUserDefaults
#define UserDefaultsObj [NSUserDefaults standardUserDefaults]
//用户信息model
#define UserModelObj    [MLoginUserInfoData sharedInstance]

//字体设置
#define mSystemFont(size)        [UIFont systemFontOfSize:size]
#define mBoldSystemFont(size)    [UIFont boldSystemFontOfSize:size]
//字体适配
#define mLayoutSystemFont(size)     [MUtilities setFontSizeWith:size]
#define mLayoutBoldSystemFont(size) [MUtilities setBoldFontSizeWith:size]
//UILable适配
#define mLayoutView(labe)      [MUtilities setSolveUIWidgetFuzzy:labe]

@interface MUtilities : NSObject

/**
 获取app版本

 @return 版本号
 */
+ (int)getLocalAppVersion;

+ (NSString *)getRequestLocalAppVersion;

/**
 设置字体大小
 
 @param size 15为标准的字体大小
 
 @return UIFont
 */
+ (UIFont *)setFontSizeWith:(CGFloat)size;

/**
 设置字体大小  加粗
 
 @param size 15为标准的字体大小
 
 @return UIFont
 */
+ (UIFont *)setBoldFontSizeWith:(CGFloat)size;

/**
 适配模糊
 */
+ (void)setSolveUIWidgetFuzzy:(UIView *)view;

/**
 将字典或者数组转化为JSON串
 
 @param theData 数据源
 @return NSData
 */
+ (NSData *)toJSONData:(id)theData;

/**
 将JSON串转化为NSDictionary或NSArray
 
 @param jsonData 数据源
 @return id
 */
+ (id)toArrayOrNSDictionary:(NSData *)jsonData;

#pragma mark -
#pragma mark - 设置AttributedString
/**
 计算String的Size

 @param text 内容
 @param textFont 字体
 @param textWidth 固定宽度
 @return CGSize
 */
+ (CGSize)getSizeWithText:(NSString *)text textFontSize:(UIFont *)textFont textWidth:(CGFloat)textWidth;

/**
 计算String的Size

 @param text 内容
 @param textFont 字体
 @param textHeight 固定高度
 @return CGSize
 */
+ (CGSize)getSizeWithText:(NSString *)text textFontSize:(UIFont *)textFont textHeight:(CGFloat)textHeight;

/**
 设置AttributedString

 @param initStr 内容
 @param needSetStr 适配的内容
 @param color 颜色
 @param textSize 字体大小
 @param forwardSearch YES从头适配，NO从尾适配
 @param lineSpacing 间距
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr:(NSString *)needSetStr color:(UIColor *)color textSize:(CGFloat)textSize forwardSearch:(BOOL)forwardSearch lineSpacing:(CGFloat)lineSpacing;

/**
 设置AttributedString 带背景色

 @param initStr 内容
 @param needSetStr 适配的内容
 @param color 颜色
 @param textSize 字体大小
 @param bgColor 背景颜色
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr:(NSString *)needSetStr color:(UIColor *)color textSize:(CGFloat)textSize backroundColor:(UIColor *)bgColor;

/**
 设置AttributedString  needSetStr1  needSetStr2

 @param initStr 内容
 @param needSetStr1 适配的内容
 @param needSetStr2 适配的内容
 @param color1 适配的内容颜色
 @param color2 适配的内容颜色
 @param textSize1 适配的内容字体大小
 @param textSize2 适配的内容字体大小
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr1:(NSString *)needSetStr1 needSetStr2:(NSString *)needSetStr2 color1:(UIColor *)color1 color2:(UIColor *)color2 textSize1:(CGFloat)textSize1 textSize2:(CGFloat)textSize2;

/**
 设置商品价格
 */
+ (NSMutableAttributedString *)setPriceAttributedWithStr:(NSString *)src price1:(NSString *)price1 price2:(NSString *)price2;


/*手机号码验证 */
+ (BOOL) isValidateMobile:(NSString *)mobile;

#pragma mark -
#pragma mark - 网络请求返回通用提示

+ (NSString *)toastResponseMessage:(NSDictionary *)responseObject;

@end
