//
//  MGoodsDetailPropertyView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MGoodsDetailPropertyViewDelegate <NSObject>

/**
 点击规格回调
 */
- (void)goodsDetailChangeProperty;

@end

@interface MGoodsDetailPropertyView : UIView

@property (nonatomic, weak) id <MGoodsDetailPropertyViewDelegate> delegate;

+ (CGFloat)getGoodsDetailPropertyViewHeight;

+ (instancetype)initWith:(id)delegate;

@end
