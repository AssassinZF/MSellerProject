//
//  MAuthCodeTimer.m
//  MSeller
//
//  Created by 1yyg on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MAuthCodeTimer.h"

#define MAuthTime 121


@interface MAuthCodeTimer()
{
    NSTimer *acTimer;
}

@end

@implementation MAuthCodeTimer


+ (MAuthCodeTimer *)shared
{
    static MAuthCodeTimer *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _acLoginDic = [[NSMutableDictionary alloc] initWithCapacity:0];
        _isClickGetCode = NO;
    }
    return self;
}


/**
 *  根据类型创建不同验证码倒计时
 *
 *  @param verificationCodeType 类型
 *  @param keyString            key (如 : 注册类型中不同的账号)
 */
- (void)creatTimerTypeWtih:(MAuthCode_Type)verificationCodeType keyWith:(NSString *)keyString
{
    _isClickGetCode = YES;
    
    switch (verificationCodeType)
    {
        case AuthCode_Login:
        {
            [_acLoginDic setObject:[NSNumber numberWithInt:MAuthTime] forKey:keyString];
        }
            break;
            
        default:
            break;
    }
    
    if (acTimer == nil)
    {
        acTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAdvanced:) userInfo:nil repeats:YES];
        [acTimer fire];
    }
}


- (void)timerAdvanced:(NSTimer *)timer
{
    if (_isClickGetCode)
    {
        if ([[self.acLoginDic allKeys] count] <= 0)
        {
            if ([acTimer isValid])
            {
                [acTimer invalidate];
                acTimer = nil;
            }
        }
        else
        {
            if ([[self.acLoginDic allKeys] count] > 0)
            {
                [self setCountdown:self.acLoginDic];
            }
            
            if ([self.delegate respondsToSelector:@selector(updateTime)])
            {
                [self.delegate updateTime];
            }
        }
    }
}


- (void)setCountdown:(NSMutableDictionary *)dictionary
{
    NSArray *array = [dictionary allKeys];
    for (NSString *nameString in array)
    {
        int newValue = [[dictionary objectForKey:nameString] intValue]-1;
        if (newValue <= 0)
        {
            [dictionary removeObjectForKey:nameString];
            if ([self.delegate respondsToSelector:@selector(updateTimeEnd:)])
            {
                [self.delegate updateTimeEnd:nameString];
            }
        }
        else
        {
            [dictionary setObject:[NSNumber numberWithInt:newValue] forKey:nameString];
        }
    }
}


/**
 *  判断是否已经存在倒计时
 *
 *  @param verificationCodeType 类型
 *  @param keyString            key
 *
 *  @return 是否存在
 */
- (BOOL)isKeyExistenceWith:(MAuthCode_Type)verificationCodeType keyWith:(NSString *)keyString
{
    switch (verificationCodeType)
    {
        case AuthCode_Login:
        {
            return [self isKeyExistenceDictionayWith:self.acLoginDic keyWith:keyString];
        }
            break;
            
        default:
            break;
    }
}


/**
 *  判断Key是否已经存在验证码倒计时
 *
 *  @param dictionary 不同类型验证倒计时所存在的NSMutableDictionary
 *  @param keyString  Key
 *
 *  @return 是否存在
 */
- (BOOL)isKeyExistenceDictionayWith:(NSMutableDictionary *)dictionary keyWith:(NSString *)keyString
{
    NSArray *keyArray = [dictionary allKeys];
    for (NSString *string in keyArray)
    {
        if ([string isEqualToString:keyString])
        {
            return YES;
        }
    }
    return NO;
}




@end
