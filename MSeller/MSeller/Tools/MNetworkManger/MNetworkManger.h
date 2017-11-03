//
//  MNetworkManger.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUploadModel.h"
#import "MAPIRequest.h"

@interface MNetworkManger : NSObject

/**
 请求(get/post/上传)

 @param model MAPIRequest
 @param progressBlock 进度
 @param success 成功
 @param failure 失败
 @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)sendRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock success:(void (^)(id object))success failure:(void (^)(NSError *error))failure;


/**
 文件上传
 
 @param model MAPIRequest
 @param progressBlock 进度q
 @param completion 返回
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionUploadTask *)uploadRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock completionHandler:(void (^)(NSURLResponse * response, NSURL * filePath, NSError * error))completion;

/**
 文件下载
 
 @param model MAPIRequest
 @param progressBlock 进度q
 @param completion 返回
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionDownloadTask *)downloadRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock completionHandler:(void (^)(NSURLResponse * response, NSURL * filePath, NSError * error))completion;

@end
