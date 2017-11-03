//
//  UIButton+MImgDownloader.m
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "UIButton+MImgDownloader.h"

#import <objc/runtime.h>


@implementation UIButton (MImgDownloader)


static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;



#pragma mark 增加按钮点击范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state {
    [self m_setImageWithURL:url forState:state placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates completed:nil];
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder {
    [self m_setImageWithURL:url forState:state placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates completed:nil];
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
    [self m_setImageWithURL:url forState:state placeholderImage:placeholder options:options completed:nil];
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock {
    [self m_setImageWithURL:url forState:state placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates completed:completedBlock];
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock {
    [self m_setImageWithURL:url forState:state placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates completed:completedBlock];
}

- (void)m_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock {
    
    NSURL *tmpURL = url;
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
    
    [self sd_setImageWithURL:tmpURL forState:state placeholderImage:placeholder options:options completed:completedBlock];
}



@end
