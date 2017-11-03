//
//  MShareAlertView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGoodsShareModel.h"


@protocol MShareAlertViewDelegate <NSObject>

@optional

/**
 分享按钮响应回调

 @param type 类型
 @param shareData 数据
 */
- (void)share_selectedWithType:(Share_Selected_Type)type data:(MGoodsShareModel *)shareData;

@end;

@interface MShareAlertView : UIView

@property (nonatomic, weak) id <MShareAlertViewDelegate> delegate;

+ (void)showShareAlertViewWith:(UIView *)supView delegate:(id)delegate data:(MGoodsShareModel *)shareData;

@end
