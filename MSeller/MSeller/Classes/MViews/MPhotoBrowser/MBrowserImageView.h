//
//  MBrowserImageView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+MImgDownloader.h"

typedef enum : NSUInteger {
    MBrowser_ImageView_Success,
    MBrowser_ImageView_Loding,
    MBrowser_ImageView_Error,
} MBrowser_ImageView_State;

@interface MBrowserImageView : UIView

@property(nonatomic,strong) UIScrollView *imageScrollView;
@property(nonatomic,strong) UIImageView  *showImg;
@property(nonatomic,assign) MBrowser_ImageView_State imageViewState;

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
-(void)doubleZoomRect:(CGPoint)point;
@property(nonatomic,strong)NSURL* mainUrl;
@property(nonatomic,assign)NSInteger utag;

@end
