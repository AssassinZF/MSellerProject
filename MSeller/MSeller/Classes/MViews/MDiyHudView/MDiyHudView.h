//
//  MDiyHudView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDiyHudView : UIView

/**
 加载数据
 
 @param superView 显示所在的位置(居中显示)
 */
+ (void)showDiyHudWithTitleWith:(NSString *)titleString superViewWith:(UIView *)superView;

/**
 移除加载
 
 @param superView hud显示所在的VIEW
 */
+ (void)removeHudWith:(UIView *)superView;

@end
