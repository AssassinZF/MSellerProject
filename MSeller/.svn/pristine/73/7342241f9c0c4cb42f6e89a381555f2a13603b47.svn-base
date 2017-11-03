//
//  MLoginUserInfoData.h
//  MSeller
//
//  Created by 1yyg on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"

@interface MLoginUserInfoData : MBaseObjectData

+ (MLoginUserInfoData *)sharedInstance;

@property (nonatomic, copy) NSString *token;//登录token
@property (nonatomic, assign) int userid;//用户ID ,
@property (nonatomic, copy) NSString *usercode;//用户编码
@property (nonatomic, copy) NSString *username;//用户昵称
@property (nonatomic, copy) NSString *photo;//用户头像
@property (nonatomic, copy) NSString *mobile;//绑定手机号码
@property (nonatomic, copy) NSString *email;//安全邮箱
@property (nonatomic, copy) NSString *birthdate;//出生年月
@property (nonatomic, copy) NSString *sex;//性别 1女 2男 3未知
@property (nonatomic, assign) int areaaid;//省份ID 如江西省ID
@property (nonatomic, assign) int areabid;//地市ID 如赣州市ID
@property (nonatomic, copy) NSString *areaaname;//省份名称 如江西省
@property (nonatomic, copy) NSString *areabname;//地市名称 如赣州市
@property (nonatomic, assign) int shopkeeperflag;//有无开店 0 无 1有
@property (nonatomic, copy) NSString *registertime;//注册时间
@property (nonatomic, assign) int realauthflag;//实名认证标识 0 还未认证 1 已认证
@property (nonatomic, assign) CGFloat balance;//可用收益
@property (nonatomic, assign) CGFloat estimateamt;//预收益
@property (nonatomic, assign) CGFloat totalearningamt;//累计收益


#pragma mark APP重启后上次用户登录未退出读取缓存用户数据
#pragma mark model 缓存的数据
- (void)setModel:(MLoginUserInfoData *)model;

#pragma mark 退出登录后清除用户信息缓存
- (void)clearUserInfoModel;


@end
