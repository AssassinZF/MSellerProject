//
//  UIView+YGCommon.m
//  IM
//
//  Created by jiangxincai on 15/4/23.
//  Copyright (c) 2015年 1yyg. All rights reserved.
//

#import "UIView+YGCommon.h"

@implementation UIView (YGCommon)

- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown{
    
    [self addLineUp:hasUp down:hasDown color:mColorFromHex(0xf5f5f5) leftSpace:0 lineLength:mLayout_Ratio(self.width)];
}

- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color leftSpace:(CGFloat)leftSpace lineLength:(CGFloat)length{
    if (hasUp) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, 0, length - leftSpace, MCellLineHeight)];
        lineView.tag = 29086;
        lineView.backgroundColor = color;
        [self addSubview:lineView];
    } 
    if (hasDown) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, CGRectGetMaxY(self.bounds)-MCellLineHeight, length - leftSpace, MCellLineHeight)];
        lineView.backgroundColor = color;
        lineView.tag = 29087;
        [self addSubview:lineView];
    }
}

- (void)addLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color lineHeight:(CGFloat)length{
    if (hasUp) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, length)];
        lineView.tag = 29086;
        lineView.backgroundColor = color;
        [self addSubview:lineView];
    }
    if (hasDown) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bounds)-length, self.width, length)];
        lineView.backgroundColor = color;
        lineView.tag = 29087;
        [self addSubview:lineView];
    }
}

- (void)addAutoLayoutLineUp:(BOOL)hasUp down:(BOOL)hasDown{
    [self addAutoLayoutLineUp:hasUp down:hasDown color:mColorFromHex(0xf5f5f5) leftSpace:0];
}

- (void)addAutoLayoutLineUp:(BOOL)hasUp down:(BOOL)hasDown color:(UIColor *)color leftSpace:(CGFloat)leftSpace{
    if (hasUp) {
        UIView *lineView = [[UIView alloc] init];
        lineView.tag = 29086;
        lineView.backgroundColor = color;
        lineView.translatesAutoresizingMaskIntoConstraints = NO;

        [self addSubview:lineView];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:leftSpace];
        [self addConstraint:leftConstraint];
        
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        [self addConstraint:bottomConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
        [self addConstraint:widthConstraint];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:MCellLineHeight];
        [self addConstraint:heightConstraint];
        
        [self setNeedsUpdateConstraints];

    }
    if (hasDown) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = color;
        lineView.tag = 29087;
        lineView.translatesAutoresizingMaskIntoConstraints = NO;

        [self addSubview:lineView];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:leftSpace];
        [self addConstraint:leftConstraint];
//
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [self addConstraint:bottomConstraint];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
        [self addConstraint:widthConstraint];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:MCellLineHeight];
        [self addConstraint:heightConstraint];
        
        [self setNeedsUpdateConstraints];
    }
}

- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight{
    [self addLineLeft:hasLeft right:hasRight color:mColorFromHex(0xf5f5f5) lineHeight:self.height];
}

- (UIViewController *)next_viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }else if ([nextResponder isKindOfClass:[UIApplication class]]){
            UIApplication *application = (UIApplication *)nextResponder;
            UIViewController *controller = application.keyWindow.rootViewController;
            return controller;
        }
    }
    return nil;
}


- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight color:(UIColor *)color lineHeight:(CGFloat)height{
    if (hasLeft) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MCellLineHeight, height)];
        lineView.tag = 29088;
        lineView.backgroundColor = color;
        [self addSubview:lineView];
    }
    if (hasRight) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bounds)-MCellLineHeight, 0, MCellLineHeight, height)];
        lineView.backgroundColor = color;
        lineView.tag = 29089;
        [self addSubview:lineView];
    }
}

- (void)addLineLeft:(BOOL)hasLeft right:(BOOL)hasRight color:(UIColor *)color lineHeight:(CGFloat)height rightWidth:(CGFloat)rightWidth{
    if (hasLeft) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MCellLineHeight, height)];
        lineView.tag = 29088;
        lineView.backgroundColor = color;
        [self addSubview:lineView];
    }
    if (hasRight) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(rightWidth-MCellLineHeight, 0, MCellLineHeight, height)];
        lineView.backgroundColor = color;
        lineView.tag = 29089;
        [self addSubview:lineView];
    }
}

- (void)cleanLineUp:(BOOL)up down:(BOOL)down{
    for (UIView *view in self.subviews) {
        if (up) {
            if (view.tag == 29086) {
                [view removeFromSuperview];
            }
        }
        if (down) {
            if (view.tag == 29087) {
                [view removeFromSuperview];
            }
        }
    }
}

- (void)rotateViewWithRotateLeft:(BOOL)left{
    [UIView beginAnimations:@"rotate" context:nil ];
    //动画时常
    [UIView setAnimationDuration:0.25];
    //获取transform的值
    CGFloat flt = left ? -M_PI/2.0 : M_PI/2.0;
    self.transform = CGAffineTransformRotate(self.transform,flt);
    //关闭动画
    [UIView commitAnimations];
}

- (void)removeLayerBorderWidth{
    self.layer.borderWidth = 0;
}

- (void)setLayerBorderWidthWithColor:(UIColor*)color width:(CGFloat)width{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)setLayerBorderWidth{
    [self setLayerBorderWidthWithColor:mColorFromHex(0xf5f5f5) width:MCellLineHeight];
}

- (void)setCornerWithRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)setCornerRadius{
    [self setCornerWithRadius:3];
}


- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
    } else {
        return nil;
    }
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (id)subviewWithTag:(NSInteger)tag{
    
    for(UIView *view in [self subviews]){
        if(view.tag == tag){
            return view;
        }
    }
    return nil;
}


#pragma mark - View坐标方法

- (CGFloat)left {
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right {
    if(right == self.right){
        return;
    }
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.top + self.height;
}

- (void)setBottom:(CGFloat)bottom {
    if(bottom == self.bottom){
        return;
    }
    
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    if(height == self.height){
        return;
    }
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end
