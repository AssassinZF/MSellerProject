//
//  MShareSDKManger.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBaseViewCtr.h"
#import "MGoodsShareModel.h"

@interface MShareSDKManger : NSObject



singleton_interface(MShareSDKManger)

/**
 分享
 
 @param type 类型
 @param vc  跳转的类
 @param shareData  分享数据
 */
- (void)shareActionType:(Share_Selected_Type)type vc:(MBaseViewCtr *)vc data:(MGoodsShareModel *)shareData;

@end
