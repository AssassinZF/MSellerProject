//
//  MLoginUserInfoData.m
//  MSeller
//
//  Created by 1yyg on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MLoginUserInfoData.h"

@implementation MLoginUserInfoData


static MLoginUserInfoData *userInfo = nil;


+ (MLoginUserInfoData *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[MLoginUserInfoData alloc] init];
    });
    return userInfo;
}


#pragma mark APP重启后上次用户登录未退出读取缓存用户数据
#pragma mark model 缓存的数据
- (void)setModel:(MLoginUserInfoData *)model
{
    self.token = STR_IS_NULL(model.token);
    self.userid = model.userid;
    self.usercode = STR_IS_NULL(model.usercode);
    self.username = STR_IS_NULL(model.username);
    self.photo = STR_IS_NULL(model.photo);
    self.mobile = STR_IS_NULL(model.mobile);
    self.email = STR_IS_NULL(model.email);
    self.birthdate = STR_IS_NULL(model.birthdate);
    self.sex = STR_IS_NULL(model.sex);
    self.areaaid = model.areaaid;
    self.areabid = model.areabid;
    self.areaaname = STR_IS_NULL(model.areaaname);
    self.areabname = STR_IS_NULL(model.areabname);
    self.shopkeeperflag = model.shopkeeperflag;
    self.registertime = STR_IS_NULL(model.registertime);
    self.realauthflag = model.realauthflag;
    self.balance = model.balance;
    self.estimateamt = model.estimateamt;
    self.totalearningamt = model.totalearningamt;
}

#pragma mark 退出登录后清除用户信息缓存
- (void)clearUserInfoModel
{
    self.token = @"";
    self.userid = 0;
    self.usercode = @"";
    self.username = @"";
    self.photo = @"";
    self.mobile = @"";
    self.email = @"";
    self.birthdate = @"";
    self.sex = @"";
    self.areaaid = 0;
    self.areabid = 0;
    self.areaaname = @"";
    self.areabname = @"";
    self.shopkeeperflag = 0;
    self.registertime = @"";
    self.realauthflag = 0;
    self.balance = 0;
    self.estimateamt = 0;
    self.totalearningamt = 0;
    
    [UserDefaultsObj removeObjectForKey:MUD_Login_UserModel];
    [UserDefaultsObj synchronize];
}


#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _token = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(token))];
        _userid = [aDecoder decodeIntForKey:NSStringFromSelector(@selector(userid))];
        _usercode = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(usercode))];
        _username = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(username))];
        _photo = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(photo))];
        _mobile = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mobile))];
        _email = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(email))];
        _birthdate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(birthdate))];
        _sex = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(sex))];
        _areaaid = [aDecoder decodeIntForKey:NSStringFromSelector(@selector(areaaid))];
        _areabid = [aDecoder decodeIntForKey:NSStringFromSelector(@selector(areabid))];
        _areaaname = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(areaaname))];
        _areabname = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(areabname))];
        _shopkeeperflag = [aDecoder decodeIntForKey:NSStringFromSelector(@selector(shopkeeperflag))];
        _registertime = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(registertime))];
        _realauthflag = [aDecoder decodeIntForKey:NSStringFromSelector(@selector(realauthflag))];
        _balance = [aDecoder decodeDoubleForKey:NSStringFromSelector(@selector(balance))];
        _estimateamt = [aDecoder decodeDoubleForKey:NSStringFromSelector(@selector(estimateamt))];
        _totalearningamt = [aDecoder decodeDoubleForKey:NSStringFromSelector(@selector(totalearningamt))];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.token forKey:NSStringFromSelector(@selector(token))];
    [aCoder encodeInt:self.userid forKey:NSStringFromSelector(@selector(userid))];
    [aCoder encodeObject:self.usercode forKey:NSStringFromSelector(@selector(usercode))];
    [aCoder encodeObject:self.username forKey:NSStringFromSelector(@selector(username))];
    [aCoder encodeObject:self.photo forKey:NSStringFromSelector(@selector(photo))];
    [aCoder encodeObject:self.mobile forKey:NSStringFromSelector(@selector(mobile))];
    [aCoder encodeObject:self.email forKey:NSStringFromSelector(@selector(email))];
    [aCoder encodeObject:self.birthdate forKey:NSStringFromSelector(@selector(birthdate))];
    [aCoder encodeObject:self.sex forKey:NSStringFromSelector(@selector(sex))];
    [aCoder encodeInt:self.areaaid forKey:NSStringFromSelector(@selector(areaaid))];
    [aCoder encodeInt:self.areabid forKey:NSStringFromSelector(@selector(areabid))];
    [aCoder encodeObject:self.areaaname forKey:NSStringFromSelector(@selector(areaaname))];
    [aCoder encodeObject:self.areabname forKey:NSStringFromSelector(@selector(areabname))];
    [aCoder encodeInt:self.shopkeeperflag forKey:NSStringFromSelector(@selector(shopkeeperflag))];
    [aCoder encodeObject:self.registertime forKey:NSStringFromSelector(@selector(registertime))];
    [aCoder encodeInt:self.realauthflag forKey:NSStringFromSelector(@selector(realauthflag))];
    [aCoder encodeDouble:self.balance forKey:NSStringFromSelector(@selector(balance))];
    [aCoder encodeDouble:self.estimateamt forKey:NSStringFromSelector(@selector(estimateamt))];
    [aCoder encodeDouble:self.totalearningamt forKey:NSStringFromSelector(@selector(totalearningamt))];
}


@end
