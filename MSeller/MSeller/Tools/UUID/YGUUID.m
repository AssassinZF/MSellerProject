//
//  YGUUID.m
//  LswKey
//
//  Created by TreeWrite on 16/7/19.
//  Copyright © 2016年 TreeWrite. All rights reserved.
//

#import "YGUUID.h"
#import "YGKeyChainStore.h"
#import "sys/utsname.h"

@implementation YGUUID

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[YGKeyChainStore load:@"com.mjb.mseller"];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [YGKeyChainStore save:@"com.mjb.mseller" data:strUUID];
        
    }
    return strUUID;
}

@end
