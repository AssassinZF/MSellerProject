//
//  UIView+YGCommon.h
//  IM
//
//  Created by jiangxincai on 15/4/23.
//  Copyright (c) 2015年 1yyg. All rights reserved.
//

#import <UIKit/UIKit.h>

//cell线宽度
#define MCellLineHeight    (Screen_Width > 375.f ? 1/3.0f : 0.5f)

@interface UIView (YGCommon)

/**
 *  画上下边缘线
 *
 *  @param hasUp   画上
 *  @param hasDown 画下
 */
- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown;

/**
 *  画上下边缘线
 *
 *  @param hasUp     画上
 *  @param hasDown   画下
 *  @param color     线颜色
 *  @param leftSpace 左边距
 *  @param length 线长度
 */
- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color leftSpace:(CGFloat)leftSpace lineLength:(CGFloat)length;


/**
 画上下边缘线

 @param hasUp 画上
 @param hasDown 画下
 @param color 线颜色
 @param length 高度
 */
- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color lineHeight:(CGFloat)length;

/**
 *  autolayout画线
 *
 *  @param hasUp   画上
 *  @param hasDown 画下
 */
- (void)addAutoLayoutLineUp:(BOOL)hasUp down:(BOOL)hasDown;

/**
 *  autolayout画线
 *
 *  @param hasUp   画上
 *  @param hasDown 画下
 *  @param color   颜色
 *  @param leftSpace 左边距
 */
- (void)addAutoLayoutLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color leftSpace:(CGFloat)leftSpace;


/**
 *  画左右边缘线
 *
 *  @param hasLeft  画左
 *  @param hasRight 画右
 */
- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight;


/**
 *  画左右边缘线
 *
 *  @param hasLeft  画左
 *  @param hasRight 画右
 *  @param color    颜色
 *  @param heightv   高度
 */
- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight color:(UIColor *)color lineHeight:(CGFloat)heightv;


/**
 *  画左右边缘线
 *
 *  @param hasLeft      画左
 *  @param hasRight     画右
 *  @param color        颜色
 *  @param height       高度
 *  @param rightWidth   右边线宽度
 */
- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight color:(UIColor *)color lineHeight:(CGFloat)height rightWidth:(CGFloat)rightWidth;

/**
 *  清除边缘线
 *
 *  @param up   清除上
 *  @param down 清除下
 */
- (void)cleanLineUp:(BOOL)up down:(BOOL)down;

/**
 *  旋转90度
 *
 *  @param left 向左或者向右
 */
- (void)rotateViewWithRotateLeft:(BOOL)left;


/**
 *  去掉边框线
 */
- (void)removeLayerBorderWidth;

/**
 *  画边框
 *
 *  @param color 颜色
 *  @param width 宽度
 */
- (void)setLayerBorderWidthWithColor:(UIColor*)color width:(CGFloat)width;

/**
 *  画边框
 */
- (void)setLayerBorderWidth;

/**
 *  画圆角
 *
 *  @param radius 圆角半径
 */
- (void)setCornerWithRadius:(CGFloat)radius;

/**
 *  画圆角
 */
- (void)setCornerRadius;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;

/**
 *  获取子view通过tag
 *
 *  @param tag 标准
 *
 *  @return 返回view
 */
- (id)subviewWithTag:(NSInteger)tag;

/**
 *  获取当前view的controller(利用响应者链)
 *
 *  @return UIViewController
 */
- (UIViewController *)next_viewController;

#pragma mark - View坐标方法

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@end
