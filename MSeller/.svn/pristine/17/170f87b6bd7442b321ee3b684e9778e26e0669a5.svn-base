//
//  MSearchTableHeaderView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MSearchTableHeaderViewDelegate <NSObject>

/**
 *  点击回调
 */
- (void)search_selectedBtnWith:(NSString *)selectedStr;

//点击清除历史记录回调
- (void)historyListEmptAction;

@end

@interface MSearchTableHeaderView : UIView


@property (nonatomic, weak) id<MSearchTableHeaderViewDelegate> delegate;



/**
 *  XIB创建
 */
+ (MSearchTableHeaderView *)searchTableHeaderViewNibWith:(id)delegate;


/**
 *  更新UI
 */
- (void)updateViewWithArray:(NSArray *)array;



@end
