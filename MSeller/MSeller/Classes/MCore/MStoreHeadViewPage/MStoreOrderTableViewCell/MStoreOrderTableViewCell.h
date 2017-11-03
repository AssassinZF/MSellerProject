//
//  MStoreOrderTableViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSInteger {
    MStoreOrderActionTypeObligation,     //待付款
    MStoreOrderActionTypeWaitReceive,    //待收货
    MStoreOrderActionTypeCompleted,      //已完成
    MStoreOrderActionTypeAfterSale,      //售后
    MStoreOrderActionTypeManageStore,    //管理我的店铺
}MStoreOrderActionType;


@protocol MyStoreOrderTableViewCellDelegate <NSObject>

- (void)clickStoreOrderActionWithType:(MStoreOrderActionType)type;

@end

@interface MStoreOrderTableViewCell : MBaseTableViewCell


@property (nonatomic, weak) IBOutlet UIView *topLineView;


@property (nonatomic, assign) id<MyStoreOrderTableViewCellDelegate> delegate;

@end
