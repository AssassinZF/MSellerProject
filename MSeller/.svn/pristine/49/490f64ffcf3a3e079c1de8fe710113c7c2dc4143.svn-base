//
//  UIImageView+MImgDownloader.m
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "UIImageView+MImgDownloader.h"

#include <pthread.h>
#import "UIImageView+AFNetworking.h"


@implementation UIImageView (MImgDownloader)


- (void)m_setImageWithURL:(NSURL *)url {
    [self m_setImageWithURL:url placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates progress:nil completed:nil];
}
- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self m_setImageWithURL:url placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates progress:nil completed:nil];
}

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
    [self m_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)m_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock {
    [self m_setImageWithURL:url placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates progress:nil completed:completedBlock];
}

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock {
    [self m_setImageWithURL:url placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates progress:nil completed:completedBlock];
}

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock {
    [self m_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock {
    
//    NSURL *tmpURL = url;
    /*
    if (DPlusState) {
        YGDPlusModel *model = [[YGDPlusUtiles sharedDPlusUtiles] dplusGetModeWith:url.host];
        if (model) {
            tmpURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@",url.scheme,model.ipStr,url.path]];
        }else{
            [[YGHTTPClient sharedClient] requestDPlusHost:url.host];
        }
    }
     */
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize, expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock)
        {
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}


@end
