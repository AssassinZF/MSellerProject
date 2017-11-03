//
//  MLoginUtiles.m
//  MSeller
//
//  Created by 1yyg on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MLoginUtiles.h"

@implementation MLoginUtiles


/**
 *  更新用户信息成功后储存用户登录账号名与头像
 *
 *  @param infoDic 新
 */
+ (void)saveLoginInfo:(NSDictionary *)infoDic
{
    if ([[infoDic objectForKey:@""] length] <= 0)
    {
        return;
    }
    
}

/**
 *  获取保存的数据
 *
 *  @return NSArray
 */
+ (NSArray *)getSaveLoginInfo
{
    NSMutableArray *userInfoList = [UserDefaultsObj objectForKey:MSaveKeyName];
    
    if (userInfoList)
    {
        return [MLoginUtiles startArraySort:userInfoList keyWith:MSaveUserTimeKey isAscending:NO];
    }
    else
    {
        return [[NSMutableArray alloc] initWithCapacity:0];
    }
}


+ (NSMutableArray *)startArraySort:(NSMutableArray *)array keyWith:(NSString *)keystring isAscending:(BOOL)isAscending
{
    NSSortDescriptor* sortByA = [NSSortDescriptor sortDescriptorWithKey:keystring ascending:isAscending];
    NSMutableArray *sourArray = [[NSMutableArray alloc]initWithArray:[array sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortByA]]];
    return sourArray;
}


/**
 *  删除指定数据
 *
 */
+ (void)deleteUserPhone:(NSString *)userPhone
{
    NSMutableArray *userInfoList = [[NSMutableArray alloc] initWithArray:[UserDefaultsObj objectForKey:MSaveKeyName]];
    if (userInfoList)
    {
        for (int i = 0; i < userInfoList.count; i++)
        {
            NSMutableDictionary *dic = [userInfoList objectAtIndex:i];
            if ([[dic objectForKey:MSaveUserPhoneKey] isEqualToString:userPhone])
            {
                [userInfoList removeObjectAtIndex:i];
                
                [UserDefaultsObj setObject:userInfoList forKey:MSaveKeyName];
                [UserDefaultsObj synchronize];
                return;
            }
        }
    }
}



@end
