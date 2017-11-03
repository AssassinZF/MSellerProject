//
//  MAPIRequest.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mAPIRequestTimeOut      20      //网络请求的超时时间
#define mAPIRequestFileTimeOut  120     //文件上传下载的超时时间

typedef enum {
    MApiRequestGet = 0,                     // Get方式
    MApiRequestPost = 1,                    // Post方式
    MApiRequestUpload = 2,                  // 上传图片
    MApiRequestDownload= 3                  // 下载图片
}MApiRequestType;


@interface MAPIRequest : NSObject

#pragma mark - 基本属性
@property (nonatomic, assign) MApiRequestType type; //请求类型
@property (nonatomic, assign) NSTimeInterval timeOut;   //请求超时时间(默认:GET/POST 20秒, 文件上传下载 120秒)
@property (nonatomic, copy) NSString *severHost;   //服务器域名(默认:api.manjd.com)
@property (nonatomic, copy) NSString *requestURL;   //请求URL
@property (nonatomic, copy) NSString *action; // 如/V1/user/login 则action为login
@property (nonatomic, strong) NSDictionary *parameters;  //参数
@property (nonatomic, strong) NSArray *uploadArray;//文件上传数据
@property (nonatomic, strong) NSData *fileData;//文件数据data

- (void)setRequestURL:(NSString *)requestURL;

/**
 设置请求类型

 @param type MApiRequestType
 */
- (void)setType:(MApiRequestType)type;

@end
