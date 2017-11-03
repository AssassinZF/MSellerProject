//
//  MRefreshHeader.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MRefreshHeader.h"

#define Logo_Img_WH  18.f
#define pi 3.14159265359
#define DEGREES_TO_RADIANS(degress) ((pi * degress)/180)

@interface MRefreshHeader ()

@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIImageView *logo;
@property (strong, nonatomic) UIView *layerView;

@property(weak, nonatomic) CAShapeLayer *shapeLayer;

@end

@implementation MRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 54.f;
    
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_gray"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
    
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.layerView.backgroundColor = MC_Clear_Color;
    [self addSubview:self.layerView];
    
    
    //添加旋转动画layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = MC_Refresh_Color.CGColor;
    layer.fillColor = nil;
    layer.lineCap = kCALineCapRound;
    layer.lineWidth = 1.0f;
    [self.layerView.layer addSublayer:layer];
    self.shapeLayer = layer;

    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = MC_Refresh_Color;
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label];
    self.label = label;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.frame = CGRectMake(CGRectGetWidth(self.frame)*0.5-Logo_Img_WH-10.f-20.f, (CGRectGetHeight(self.frame)-Logo_Img_WH)*0.5+5, Logo_Img_WH, Logo_Img_WH);
    
    
    CGFloat gap = 2.f;
    CGRect frame = self.logo.frame;
    frame.size.width += gap*2;
    frame.size.height += gap*2;
    
    self.layerView.frame = frame;
    self.layerView.center = self.logo.center;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-90 * M_PI/180.0);
    [self.layerView setTransform:transform];
    
    
    UIBezierPath *thePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layerView.width/2, self.layerView.height/2) radius:self.layerView.width/2-1 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(340) clockwise:YES];
    self.shapeLayer.path = thePath.CGPath;
    
    self.label.frame = CGRectMake(CGRectGetWidth(self.frame)*0.5-20.f, 5.f, CGRectGetWidth(self.frame)*0.5, CGRectGetHeight(self.frame));
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}


#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self endRotaion];
            self.label.text = @"下拉刷新…";
        }
            break;
        case MJRefreshStatePulling:
        {
            [self endRotaion];
            self.label.text = @"放开刷新…";
        }
            break;
        case MJRefreshStateRefreshing:
        {
            [self startRotaion];
            self.label.text = @"正在刷新…";
        }
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    if (pullingPercent == 0) {
        UIBezierPath *thePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layerView.width/2, self.layerView.height/2) radius:self.layerView.width/2-1 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(0.5) clockwise:YES];
        self.shapeLayer.path = thePath.CGPath;
    }else if (pullingPercent > 1){
//        UIBezierPath *thePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layerView.width/2, self.layerView.height/2) radius:self.layerView.width/2-1 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(340) clockwise:YES];
//        self.shapeLayer.path = thePath.CGPath;
    }else{
        UIBezierPath *thePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layerView.width/2, self.layerView.height/2) radius:self.layerView.width/2-1 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(340*pullingPercent) clockwise:YES];
        self.shapeLayer.path = thePath.CGPath;
    }
}



- (void)startRotaion
{
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];//旋转角度
    rotationAnimation.duration = 0.8; //旋转周期
    rotationAnimation.repeatCount = MAXFLOAT;//旋转次数
    [self.layerView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)endRotaion
{
    
    [self.layerView.layer removeAllAnimations];
}
@end
