//
//  MLoginUtiles.h
//  MSeller
//
//  Created by 1yyg on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>


#define MSaveMaxCount       1 //最大存储个数
#define MSaveKeyName        @"SaveNameList" //存储在NSUserDefaults中的key名
#define MSaveUserPhoneKey   @"userPhone"    //保存用户手机号所用的key
#define MSaveUserTimeKey    @"userTime"     //保存信息的时间用于读取排序所用的key

@interface MLoginUtiles : NSObject


/**
 *  更新用户信息成功后储存用户登录账号名与头像
 *
 *  @param infoDic 新
 */
+ (void)saveLoginInfo:(NSDictionary *)infoDic;

/**
 *  获取保存的数据
 *
 *  @return NSArray
 */
+ (NSArray *)getSaveLoginInfo;

/**
 *  删除指定数据
 *
 */
+ (void)deleteUserPhone:(NSString *)userPhone;



@end
