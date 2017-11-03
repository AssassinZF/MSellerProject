//
//  MPromptView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    M_PromptAlert_Type_Normal,  //默认
    M_PromptAlert_Type_Failure  //
} M_PromptAlert_Type;       //用于图片显示

typedef void(^BtnTouchUpBlock)();

@interface MPromptView : UIView

@property (nonatomic, copy) BtnTouchUpBlock block;


/**
 缺省页面（没有按钮）

 @param showView 父UIView
 @param promptAlertType 类型
 @param message 提示文字
 @return MPromptView
 */
+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message;


/**
 缺省页面（有按钮默认点击刷新）

 @param showView 父UIView
 @param promptAlertType 类型
 @param message 提示文字
 @param btnBlock 回调
 @return MPromptView
 */
+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message blockWith:(BtnTouchUpBlock)btnBlock;


/**
 缺省页面（有按钮文字自定义）

 @param showView 父UIView
 @param promptAlertType 类型
 @param message 提示文字
 @param btnTitle 按钮文字
 @param btnBlock 回调
 @return MPromptView
 */
+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message btnTitleWith:(NSString *)btnTitle blockWith:(BtnTouchUpBlock)btnBlock;

/**
 *  移除缺省页
 *
 *  @param showView 缺省页所在的父UIView
 */
+ (void)remove_promptAlertViewWith:(UIView *)showView;

@end
