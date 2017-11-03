//
//  MDiyHudView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MDiyHudView.h"
#import "UIImage+GIF.h"

#define mHudViewTag   6000001

@interface MDiyHudView ()

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *showHudImage;

@end

@implementation MDiyHudView

/**
 加载数据
 
 @param superView 显示所在的位置(居中显示)
 */
+ (void)showDiyHudWithTitleWith:(NSString *)titleString superViewWith:(UIView *)superView{
    
    UIView *showHudView = [superView viewWithTag:mHudViewTag];
    if (showHudView)
    {
        [showHudView removeFromSuperview];
    }
    
    MDiyHudView *hudView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MDiyHudView class]) owner:self options:nil] lastObject];
    hudView.tag = mHudViewTag;
    hudView.frame = superView.bounds;
    [hudView updateView];

    [superView addSubview:hudView];
    

}

- (void)updateView
{
    self.showHudImage.image = [UIImage sd_animatedGIFNamed:@"diy_hud_money_image"];
}

/**
 移除加载
 
 @param superView hud显示所在的VIEW
 */
+ (void)removeHudWith:(UIView *)superView{
    UIView *hudView = [superView viewWithTag:mHudViewTag];
    if (hudView)
    {
        [hudView removeFromSuperview];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
