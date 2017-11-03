//
//  MAuthCodeTimer.h
//  MSeller
//
//  Created by 1yyg on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSInteger {
    AuthCode_Login = 0, //登录
}MAuthCode_Type;


@protocol MAuthCodeTimerDelegate <NSObject>

//倒计时更新
- (void)updateTime;

//倒计时结束
- (void)updateTimeEnd:(NSString *)keyString;

@end


@interface MAuthCodeTimer : NSObject


@property (nonatomic, strong) NSMutableDictionary *acLoginDic;

@property (nonatomic, weak) id<MAuthCodeTimerDelegate> delegate;

@property (nonatomic, assign) BOOL isClickGetCode;


+ (MAuthCodeTimer *)shared;


/**
 *  根据类型创建不同验证码倒计时
 *
 *  @param verificationCodeType 类型
 *  @param keyString            key (如 : 注册类型中不同的账号)
 */
- (void)creatTimerTypeWtih:(MAuthCode_Type)verificationCodeType keyWith:(NSString *)keyString;

/**
 *  判断是否已经存在倒计时
 *
 *  @param verificationCodeType 类型
 *  @param keyString            key
 *
 *  @return 是否存在
 */
- (BOOL)isKeyExistenceWith:(MAuthCode_Type)verificationCodeType keyWith:(NSString *)keyString;



@end
