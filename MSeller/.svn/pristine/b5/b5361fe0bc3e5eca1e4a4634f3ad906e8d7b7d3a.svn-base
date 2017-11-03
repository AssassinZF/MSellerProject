//
//  MUtilities.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MUtilities.h"

@implementation MUtilities

#pragma mark -
#pragma mark - 手机配置信息
//获取app版本
+ (int)getLocalAppVersion
{
    int systemVersion = 0;
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    for (NSString *str in [versionStr componentsSeparatedByString:@"."]) {
        systemVersion = systemVersion*10 + str.intValue;
    }
    
    return systemVersion;
}

+ (NSString *)getRequestLocalAppVersion
{
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"iOS-%@", versionStr];
}

#pragma mark -
#pragma mark - 字体大小适配
/**
 设置字体大小
 
 @param size 15为标准的字体大小
 
 @return UIFont
 */
+ (UIFont *)setFontSizeWith:(CGFloat)size
{
    if (ScreenSizeScale > 1)
    {
        return mSystemFont(size+1);
    }
    else if (ScreenSizeScale == 1)
    {
        return mSystemFont(size);
    }
    else
    {
        return mSystemFont(size-1);
    }
}

/**
 设置字体大小  加粗
 
 @param size 15为标准的字体大小
 
 @return UIFont
 */
+ (UIFont *)setBoldFontSizeWith:(CGFloat)size
{
    if (ScreenSizeScale > 1)
    {
        return mBoldSystemFont(size+2);
    }
    else if (ScreenSizeScale == 1)
    {
        return mBoldSystemFont(size+1);
    }
    else
    {
        return mBoldSystemFont(size);
    }
}

+ (void)setSolveUIWidgetFuzzy:(UIView *)view
{
    CGRect frame = view.frame;
    float x = floor(frame.origin.x);
    float y = floor(frame.origin.y);
    float w = floor(frame.size.width)+1;
    float h = floor(frame.size.height)+1;
    
    view.frame = CGRectMake(x, y, w, h);
}

#pragma mark -
#pragma mark - 数据解析与转换
/**
 将字典或者数组转化为JSON串

 @param theData 数据源
 @return NSData
 */
+ (NSData *)toJSONData:(id)theData{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        
        return jsonData;
    }else{
        return nil;
    }
}

/**
 将JSON串转化为NSDictionary或NSArray

 @param jsonData 数据源
 @return id
 */
+ (id)toArrayOrNSDictionary:(NSData *)jsonData{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil && error == nil) {
        return jsonObject;
    } else {
        // 解析错误
        return nil;
    }
}

#pragma mark -
#pragma mark - 设置AttributedString
//计算String的Size  固定宽度
+ (CGSize)getSizeWithText:(NSString *)text textFontSize:(UIFont *)textFont textWidth:(CGFloat)textWidth
{
    CGSize size = CGSizeMake(0, 0);
    
    if ([text isKindOfClass:[NSString class]] && text) {
        size = [text boundingRectWithSize:CGSizeMake(textWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,nil] context:nil].size;
    }
    
    
    return size;
}
//计算String的Size  固定高度
+ (CGSize)getSizeWithText:(NSString *)text textFontSize:(UIFont *)textFont textHeight:(CGFloat)textHeight
{
    CGSize size = CGSizeMake(0, 0);
    if ([text isKindOfClass:[NSString class]] && text) {
        size = [text boundingRectWithSize:CGSizeMake(1000, mLayout_Ratio(textHeight)) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,nil] context:nil].size;
    }
    return size;
}

//设置AttributedString  needSetStr
+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr:(NSString *)needSetStr color:(UIColor *)color textSize:(CGFloat)textSize forwardSearch:(BOOL)forwardSearch lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:initStr];
    
    if (lineSpacing > 0.1) {
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle1.lineSpacing = lineSpacing;
        [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, initStr.length)];
    }
    
    NSRange range;
    if (forwardSearch) {
        range = [initStr rangeOfString:needSetStr];
    }else{
        range = [initStr rangeOfString:needSetStr options:NSBackwardsSearch];
    }
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(textSize) range:range];
    
    return str;
}

+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr:(NSString *)needSetStr color:(UIColor *)color textSize:(CGFloat)textSize backroundColor:(UIColor *)bgColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:initStr];
    NSRange range = [initStr rangeOfString:needSetStr];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    [str addAttribute:NSBackgroundColorAttributeName value:bgColor range:range];
    
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(textSize) range:range];
    
    return str;
}

//设置AttributedString  needSetStr1  needSetStr2
+ (NSMutableAttributedString *)setLabelAttributedTextWithInitStr:(NSString *)initStr needSetStr1:(NSString *)needSetStr1 needSetStr2:(NSString *)needSetStr2 color1:(UIColor *)color1 color2:(UIColor *)color2 textSize1:(CGFloat)textSize1 textSize2:(CGFloat)textSize2
{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:initStr];
    
    NSRange range1 = [initStr rangeOfString:needSetStr1];
    NSRange range2 = [initStr rangeOfString:needSetStr2 options:NSBackwardsSearch];
    
    [str addAttribute:NSForegroundColorAttributeName value:color1 range:range1];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(textSize1) range:range1];
    
    [str addAttribute:NSForegroundColorAttributeName value:color2 range:range2];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(textSize2) range:range2];
    
    return str;
}

+ (NSMutableAttributedString *)setPriceAttributedWithStr:(NSString *)src price1:(NSString *)price1 price2:(NSString *)price2
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:src];
    
    NSRange range1 = [src rangeOfString:@"￥"];
    NSRange range2 = [src rangeOfString:@"￥" options:NSBackwardsSearch];
    
    NSRange priceRange1 = [src rangeOfString:price1];
    NSRange priceRange2 = [src rangeOfString:price2 options:NSBackwardsSearch];
    
    NSRange otherRange1 = [src rangeOfString:@"/"];
    
    NSRange otherRange2 = [src rangeOfString:@"约赚"];

    
    [str addAttribute:NSForegroundColorAttributeName value:MC_DarkGray_Color range:range1];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(12) range:range1];
    
    [str addAttribute:NSForegroundColorAttributeName value:MC_Orange_Color range:range2];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(12) range:range2];
    
    [str addAttribute:NSForegroundColorAttributeName value:MC_DarkGray_Color range:priceRange1];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(15) range:priceRange1];
    
    [str addAttribute:NSForegroundColorAttributeName value:MC_Orange_Color range:priceRange2];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(15) range:priceRange2];
    
    [str addAttribute:NSForegroundColorAttributeName value:MC_LightGray_Color range:otherRange1];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(15) range:otherRange1];
    
    [str addAttribute:NSForegroundColorAttributeName value:MC_Orange_Color range:otherRange2];
    [str addAttribute:NSFontAttributeName value:mLayoutSystemFont(12) range:otherRange2];

    return str;
}

#pragma mark -
#pragma mark - 手机号码验证
/*手机号码验证 */
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    if (mobile.length != 11)
    {
        return NO;
    }
    else
    {
        if ([[mobile substringToIndex:1] isEqualToString:@"1"])
        {
            NSScanner* scan = [NSScanner scannerWithString:mobile];
            int val;
            return[scan scanInt:&val] && [scan isAtEnd];
        }
        else
        {
            return NO;
        }
    }
    return YES;
}

#pragma mark -
#pragma mark - 网络请求返回通用提示

+ (NSString *)toastResponseMessage:(NSDictionary *)responseObject
{
    if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
        switch ([[responseObject objectForKey:mResponseCode] intValue]) {
            case 400:
            {
                //请求参数不完整或不正确
                return @"请求参数不完整或不正确";
            }
                break;
            case 401:
            {
                //无效Token,需重新登录
                return @"登录异常,请重新登录";
            }
                break;
            case 406:
            {
                //HTTP请求不合法,请求参数可能被篡改
                return @"HTTP请求不合法,请求参数可能被篡改";
            }
                break;
            case 407:
            {
                //该URL已经失效
                return @"该URL已经失效";
            }
                break;
            case 408:
            {
                //页码为0
                return @"页码为0";
            }
                break;
            case 500:
            {
                //内部请求出错
                return @"内部请求出错";
            }
                break;
            case -3:
            {
                //接口请求次数超限
                return @"接口请求次数超限";
            }
                break;
            case -2:
            {
                //参数验证失败
                return @"参数验证失败";
            }
                break;
            case -1:
            {
                //失败Fail
                return @"失败";
            }
                break;
            default:
            {
                return STR_IS_NULL([responseObject objectForKey:mResponseMessage]);
            }
                break;
        }
    }else{
        return mLocalizedString(@"mPublic_Sever_Error");
    }
}

@end
