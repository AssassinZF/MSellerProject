//
//  UIButton+MImgDownloader.h
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIButton+WebCache.h"

@interface UIButton (MImgDownloader)


#pragma mark 增加按钮点击范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;


@end
