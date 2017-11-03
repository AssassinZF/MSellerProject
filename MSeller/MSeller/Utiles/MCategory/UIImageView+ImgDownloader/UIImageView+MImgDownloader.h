//
//  UIImageView+MImgDownloader.h
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImageView+WebCache.h"


@interface UIImageView (MImgDownloader)


#pragma mark -showBool  是否显示加载失败默认图
- (void)m_setImageWithURL:(NSURL *)url;

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)m_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;

- (void)m_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;

@end
