//
//  MHomeHeadView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MHomeHeadViewDelegate <NSObject>

- (void)home_selectItemAtIndex:(NSInteger)index;

@end

@interface MHomeHeadView : UIView

@property (nonatomic, weak) id <MHomeHeadViewDelegate> delegate;

/**
 *  更新UI
 */
- (void)updateViewWithArray:(NSArray *)array;

@end
