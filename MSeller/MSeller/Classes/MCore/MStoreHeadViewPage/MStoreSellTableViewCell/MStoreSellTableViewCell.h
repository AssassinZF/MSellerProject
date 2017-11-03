//
//  MStoreSellTableViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MStoreInfoData.h"


typedef enum : NSInteger {
    MStoreSellActionTypeOrder,      //今日订单
    MStoreSellActionTypeSell,       //本月销售
    MStoreSellActionTypeVisit,      //累计访问
}MStoreSellActionType;


@protocol MStoreSellTableViewCellDelegate <NSObject>

- (void)clickSellBtnActionWithType:(MStoreSellActionType)type;

@end


@interface MStoreSellTableViewCell : MBaseTableViewCell


@property (nonatomic, assign) id<MStoreSellTableViewCellDelegate> delegate;

@property (nonatomic, strong) MStoreInfoData *infoData;


- (void)updateStoreSellData:(MStoreInfoData *)data;

@end