//
//  MShareAlertView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MShareAlertView.h"

@interface MShareAlertView ()
{
    MGoodsShareModel *_shareData;
}

@property (weak, nonatomic) IBOutlet UIView *bottomView;    //底部UIVIEW
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;  //title

@property (weak, nonatomic) IBOutlet UIButton *wxBtn;
@property (weak, nonatomic) IBOutlet UIButton *wxFriendBtn;
@property (weak, nonatomic) IBOutlet UIButton *qqBtn;
@property (weak, nonatomic) IBOutlet UIButton *wbBtn;
@property (weak, nonatomic) IBOutlet UIButton *linkBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@property (weak, nonatomic) IBOutlet UILabel *wxLabel;
@property (weak, nonatomic) IBOutlet UILabel *wxFriendLabel;
@property (weak, nonatomic) IBOutlet UILabel *qqLabel;
@property (weak, nonatomic) IBOutlet UILabel *wbLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;

@end

@implementation MShareAlertView

+ (void)showShareAlertViewWith:(UIView *)supView delegate:(id)delegate data:(MGoodsShareModel *)shareData
{
    MShareAlertView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MShareAlertView class]) owner:self options:nil] lastObject];
    view.delegate = delegate;
    view.frame = supView.bounds;
    [view updateView:supView data:shareData];
    [view startAnimate];
}

- (void)updateView:(UIView *)supView data:(MGoodsShareModel *)shareData
{
    _shareData = shareData;
    
    self.bottomView.frame = CGRectMake(0, self.height-mLayout_Ratio(180), self.width, mLayout_Ratio(180));
    
    self.titleLabel.frame = CGRectMake(0, mLayout_Ratio(5), self.bottomView.width, mLayout_Ratio(45));
    self.titleLabel.text = [NSString stringWithFormat:mLocalizedString(@"mAlert_Share_Title"), shareData.shareProfit];
    
    CGFloat space = (self.width-mLayout_Ratio(45)*5)/6;
    self.wxBtn.size = CGSizeMake(mLayout_Ratio(45), mLayout_Ratio(45));
    self.wxBtn.left = space;
    self.wxBtn.top = self.titleLabel.bottom+mLayout_Ratio(5);
    
    self.wxFriendBtn.size = self.wxBtn.size;
    self.wxFriendBtn.top = self.wxBtn.top;
    self.wxFriendBtn.left = self.wxBtn.right+space;
    
    self.qqBtn.size = self.wxBtn.size;
    self.qqBtn.top = self.wxBtn.top;
    self.qqBtn.left = self.wxFriendBtn.right+space;
    
    self.wbBtn.size = self.wxBtn.size;
    self.wbBtn.top = self.wxBtn.top;
    self.wbBtn.left = self.qqBtn.right+space;
    
    self.linkBtn.size = self.wxBtn.size;
    self.linkBtn.top = self.wxBtn.top;
    self.linkBtn.left = self.wbBtn.right+space;
    
    self.closeBtn.size = self.wxBtn.size;
    self.closeBtn.centerX = self.bottomView.centerX;
    self.closeBtn.bottom = self.bottomView.height-10;
    
    self.wxLabel.size = CGSizeMake(self.wxBtn.width+mLayout_Ratio(10), mLayout_Ratio(25));
    self.wxLabel.top = self.wxBtn.bottom;
    self.wxLabel.centerX = self.wxBtn.centerX;
    
    self.wxFriendLabel.size = self.wxFriendLabel.size;
    self.wxFriendLabel.top = self.wxLabel.top;
    self.wxFriendLabel.centerX = self.wxFriendBtn.centerX;
    
    self.qqLabel.size = self.wxFriendLabel.size;
    self.qqLabel.top = self.wxLabel.top;
    self.qqLabel.centerX = self.qqBtn.centerX;
    
    self.wbLabel.size = self.wxFriendLabel.size;
    self.wbLabel.top = self.wxLabel.top;
    self.wbLabel.centerX = self.wbBtn.centerX;
    
    self.linkLabel.size = self.wxFriendLabel.size;
    self.linkLabel.top = self.wxLabel.top;
    self.linkLabel.centerX = self.linkBtn.centerX;
    
    //动画开始时的位置
    self.bottomView.top = self.height;
    
    [supView addSubview:self];
}

- (void)startAnimate
{
    self.alpha = 0;
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 1.0;
    }];
    
    [UIView animateWithDuration:0.25 delay:0.15 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bottomView.top = self.height-mLayout_Ratio(180);
    } completion:nil];
}


- (IBAction)wxTouchUpInside:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(share_selectedWithType:data:)]) {
        [self.delegate share_selectedWithType:Share_Type_WX data:_shareData];
    }
    [self closeTouchUpInside:nil];
}

- (IBAction)wxFrienTouchUpInside:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(share_selectedWithType:data:)]) {
        [self.delegate share_selectedWithType:Share_Type_WXFriend data:_shareData];
    }
    [self closeTouchUpInside:nil];
}

- (IBAction)qqTouchUpInside:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(share_selectedWithType:data:)]) {
        [self.delegate share_selectedWithType:Share_Type_QQ data:_shareData];
    }
    [self closeTouchUpInside:nil];
}

- (IBAction)wbTouchUpInside:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(share_selectedWithType:data:)]) {
        [self.delegate share_selectedWithType:Share_Type_WB data:_shareData];
    }
    [self closeTouchUpInside:nil];
}

- (IBAction)linkTouchUpInside:(id)sender
{
    [self closeTouchUpInside:nil];
}

- (IBAction)closeTouchUpInside:(id)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomView.top = self.height;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
