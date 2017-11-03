//
//  MGoodsDetailTabView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MTab_Type_Detail,
    MTab_Type_Property,
    MTab_Type_Parameter,
} MGoodsDetail_Tab_Change_Type;

@protocol MGoodsDetailTabViewDelegate <NSObject>

/**
 选择TAB

 @param type MGoodsDetail_Tab_Change_Type
 */
- (void)goodsDetailTabChange:(MGoodsDetail_Tab_Change_Type)type;

@end

@interface MGoodsDetailTabView : UIView

@property (nonatomic, weak) id <MGoodsDetailTabViewDelegate> delegate;

+ (CGFloat)getGoodsDetailTabViewHeight;

+ (instancetype)initWith:(id)delegate;

@end
