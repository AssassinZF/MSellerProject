//
//  MGoodsDetailShareView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MGoodsDetailShareViewDelegate <NSObject>



@end

@interface MGoodsDetailShareView : UIView

@property (nonatomic, weak) id <MGoodsDetailShareViewDelegate> delegate;

+ (CGFloat)getGoodsDetailShareViewHeight;

+ (instancetype)initWith:(id)delegate;

@end
