//
//  MNetworkManger.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MNetworkManger.h"
#import "AFNetworking.h"
#import "YGUUID.h"
#import "MKey.h"


@implementation MNetworkManger

+ (AFSecurityPolicy *)customSecurityPolicy
{
    //先导入证书，找到证书的路径
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"myWebsite" ofType:@"cer"];
    //    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况 : 客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    //    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    //    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}

+ (void)logError:(NSError *)error
{
    NSArray *values = [error.userInfo allValues];
    for (id object in values) {
        if ([object isKindOfClass:[NSData class]]) {
            NSString *failStr = [[NSString alloc] initWithData:object encoding:NSUTF8StringEncoding];
            MLog(@"%@", failStr);
        }
    }
}

/**
 请求(get/post/上传)
 
 @param model MAPIRequest
 @param progressBlock 进度
 @param success 成功
 @param failure 失败
 @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)sendRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock success:(void (^)(id object))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager setSecurityPolicy:[MNetworkManger customSecurityPolicy]];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = model.timeOut;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    if (model.severHost.length > 0) {
        [manager.requestSerializer setValue:model.severHost forHTTPHeaderField:@"host"];
    }
    
    [manager.requestSerializer setValue:STR_IS_NULL(model.action) forHTTPHeaderField:@"action"];
    if (UserModelObj.token.length > 0) {
        [manager.requestSerializer setValue:UserModelObj.token forHTTPHeaderField:@"token"];
    }
    [manager.requestSerializer setValue:STR_IS_NULL([YGUUID getUUID]) forHTTPHeaderField:@"nonce"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%ld", [MKey getTimeStamp]] forHTTPHeaderField:@"timestamp"];
    [manager.requestSerializer setValue:[MKey getYGEncryptAcitonWith:STR_IS_NULL(model.action) nonce:STR_IS_NULL([YGUUID getUUID])] forHTTPHeaderField:@"signature"];
    [manager.requestSerializer setValue:[MUtilities getRequestLocalAppVersion] forHTTPHeaderField:@"appversion"];

    if (model.type == MApiRequestGet) {
        NSURLSessionDataTask *dataTask = [manager GET:model.requestURL parameters:model.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progressBlock) {
                NSInteger progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
                progressBlock(progress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [MUtilities toArrayOrNSDictionary:responseObject];
            MLog(@"%@\n%@\n", task.response.URL.absoluteString,dic);
            
            if ([[dic objectForKey:mResponseCode] intValue] == 401) {
                [MAppDelegateObj userLoginOut:[MUtilities toastResponseMessage:dic]];
            }
            if (success) {
                success(dic);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            MLog(@"%@\n%@\n", task.response.URL.absoluteString,error);
//            [self logError:error];
            if (failure) {
                failure(error);
            }
        }];
        return dataTask;
    }else if (model.type == MApiRequestPost){
        NSURLSessionDataTask *dataTask = [manager POST:model.requestURL parameters:model.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progressBlock) {
                NSInteger progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
                progressBlock(progress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [MUtilities toArrayOrNSDictionary:responseObject];
            MLog(@"%@\n%@", task.response.URL.absoluteString,dic);
            if ([[dic objectForKey:mResponseCode] intValue] == 401) {
                [MAppDelegateObj userLoginOut:[MUtilities toastResponseMessage:dic]];
            }else{
                
            }
            if (success) {
                success(dic);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            MLog(@"%@\n%@", task.response.URL.absoluteString,error);
//            [self logError:error];
            

            
            if (failure) {
                failure(error);
            }
        }];
        return dataTask;
    }else if (model.type == MApiRequestUpload)
    {
        NSMutableString *tmpURL = [NSMutableString stringWithString:model.requestURL];
        NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:tmpURL parameters:nil error:nil];
        [request setHTTPBody:model.fileData];
        NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (!error) {
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                MLog(@"*****%@",jsonDict);
                success(jsonDict);
            } else {
                failure(error);
            }
        }];
        
        NSInteger returnCount = 0;
        if (model.fileData.length < 1024*100) {
            returnCount = 20;
        } else if (model.fileData.length < 1024*1024) {
            returnCount = 50;
        } else if (model.fileData.length < 1024*1024*10) {
            returnCount = 100;
        } else {
            returnCount = 150;
        }
        
        __block NSInteger length = model.fileData.length/returnCount;
        __block NSInteger nowCount = 1;
        [manager setTaskDidSendBodyDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
            MLog(@"\n 进度为---->百分之%@ \n 当前发送KB == %@  \n 总KB数 == %@",@(totalBytesSent/(CGFloat)totalBytesExpectedToSend*100),@(totalBytesSent/1024.0),@(totalBytesExpectedToSend/1024.0));
            if (nowCount * length < totalBytesSent) {
                nowCount ++;
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (progressBlock)
                    {
                        progressBlock((NSInteger)totalBytesSent);
                    }
                });
            }
        }];
        [uploadTask resume];
        
        return uploadTask;
    }
        /*
    {
        NSURLSessionDataTask *dataTask = [manager POST:model.requestURL parameters:model.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            for (MUploadModel *models in model.uploadArray) {
                [formData appendPartWithFileData:models.data name:models.name fileName:models.fileName mimeType:models.mimeType];
            }
        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [MUtilities toArrayOrNSDictionary:responseObject];
            MLog(@"%@\n%@", task.response.URL.absoluteString,dic);

            if (success) {
                success(dic);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            MLog(@"%@\n%@", task.response.URL.absoluteString,error);

//            [self logError:error];
            if (failure) {
                failure(error);
            }
        }];
        return dataTask;
    }
         */
    return nil;
}


/**
 文件上传
 
 @param model MAPIRequest
 @param progressBlock 进度q
 @param completion 返回
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionUploadTask *)uploadRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock completionHandler:(void (^)(NSURLResponse * response, NSURL * filePath, NSError * error))completion
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *uploadManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    uploadManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    uploadManager.responseSerializer = [AFJSONResponseSerializer serializer];
    uploadManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:model.requestURL]];
    [request setValue:model.action forHTTPHeaderField:@"action"];
    if ((STR_IS_NULL(UserModelObj.token)).length > 0) {
        [request setValue:UserModelObj.token forHTTPHeaderField:@"token"];
    }
    [request setValue:[YGUUID getUUID] forHTTPHeaderField:@"nonce"];
    [request setValue:[NSString stringWithFormat:@"%ld", [MKey getTimeStamp]] forHTTPHeaderField:@"timestamp"];
    [request setValue:[MKey getYGEncryptAcitonWith:model.action nonce:[YGUUID getUUID]] forHTTPHeaderField:@"signature"];
    [request setValue:[MUtilities getRequestLocalAppVersion] forHTTPHeaderField:@"appversion"];
    [request setHTTPBody:model.fileData];
    
    NSURLSessionUploadTask *uploadTask = [uploadManager uploadTaskWithStreamedRequest:request progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (!error) {
            
        } else {
            
        }
    }];
    
    NSInteger returnCount = 0;
    if (model.fileData.length < 1024*100) {
        returnCount = 20;
    } else if (model.fileData.length < 1024*1024) {
        returnCount = 50;
    } else if (model.fileData.length < 1024*1024*10) {
        returnCount = 100;
    } else {
        returnCount = 150;
    }
    
    __block NSInteger length = model.fileData.length/returnCount;
    __block NSInteger nowCount = 1;
    [uploadManager setTaskDidSendBodyDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        MLog(@"\n 进度为---->百分之%@ \n 当前发送KB == %@  \n 总KB数 == %@",@(totalBytesSent/(CGFloat)totalBytesExpectedToSend*100),@(totalBytesSent/1024.0),@(totalBytesExpectedToSend/1024.0));
        if (nowCount * length < totalBytesSent) {
            nowCount ++;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (progressBlock)
                {
                    progressBlock((NSInteger)totalBytesSent);
                }
            });
        }
    }];
    [uploadTask resume];
    return uploadTask;
}



/**
 文件下载
 
 @param model MAPIRequest
 @param progressBlock 进度q
 @param completion 返回
 @return NSURLSessionDownloadTask
 */
+ (NSURLSessionDownloadTask *)downloadRequestWith:(MAPIRequest *)model progressBlock:(void(^)(NSInteger totalBytesSent))progressBlock completionHandler:(void (^)(NSURLResponse * response, NSURL * filePath, NSError * error))completion
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *downloadManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:model.requestURL]];
    
    [request setValue:model.action forHTTPHeaderField:@"action"];
    if ((STR_IS_NULL(UserModelObj.token)).length > 0) {
        [request setValue:UserModelObj.token forHTTPHeaderField:@"token"];
    }
    [request setValue:[YGUUID getUUID] forHTTPHeaderField:@"nonce"];
    [request setValue:[NSString stringWithFormat:@"%ld", [MKey getTimeStamp]] forHTTPHeaderField:@"timestamp"];
    [request setValue:[MKey getYGEncryptAcitonWith:model.action nonce:[YGUUID getUUID]] forHTTPHeaderField:@"signature"];
    [request setValue:[MUtilities getRequestLocalAppVersion] forHTTPHeaderField:@"appversion"];


    NSURLSessionDownloadTask * task = [downloadManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progressBlock) {
            NSInteger progress = 100.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
            progressBlock(progress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return targetPath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (completion) {
            completion(response, filePath, error);
        }
    }];
    return task;
}


@end
