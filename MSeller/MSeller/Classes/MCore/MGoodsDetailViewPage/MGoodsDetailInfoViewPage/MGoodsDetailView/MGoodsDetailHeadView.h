//
//  MGoodsDetailView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGoodsDetailData.h"

@protocol MGoodsDetailHeadViewDelegate <NSObject>

- (void)goodsDetailHeadSelectItemAtIndex:(NSInteger)index;

@end

@interface MGoodsDetailHeadView : UIView

@property (nonatomic, weak) id <MGoodsDetailHeadViewDelegate> delegate;

- (void)updateGoodsDetailView:(MGoodsDetailData *)detailData;

@end
