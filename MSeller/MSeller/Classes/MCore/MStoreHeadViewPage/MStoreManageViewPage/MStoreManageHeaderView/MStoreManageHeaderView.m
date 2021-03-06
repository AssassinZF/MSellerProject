//
//  MStoreManageHeaderView.m
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreManageHeaderView.h"


@implementation MStoreManageHeaderView


+ (MStoreManageHeaderView *)initSectionViewWithNib:(id)delegate
{
    MStoreManageHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MStoreManageHeaderView class]) owner:self options:nil] firstObject];
    return headerView;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.size = CGSizeMake(Screen_Width, mLayout_Ratio(175));
    
    self.previewBtn.frame = CGRectMake(self.width-mLayout_Ratio(18)-mLayout_Ratio(55), mLayout_Ratio(20), mLayout_Ratio(55), mLayout_Ratio(35));
    
    self.backgroundImgView.frame = CGRectMake(0, 0, self.width, mLayout_Ratio(175));
    self.avatarImgView.frame = CGRectMake(mLayout_Ratio(20), self.backgroundImgView.height-mLayout_Ratio(17)-mLayout_Ratio(60), mLayout_Ratio(60), mLayout_Ratio(60));
    self.clickAvatarBtn.frame = self.avatarImgView.frame;
    self.storeNameLB.frame = CGRectMake(self.avatarImgView.right+mLayout_Ratio(20), self.avatarImgView.top+(self.avatarImgView.height-mLayout_Ratio(45))/2, self.width-self.storeNameLB.left-mLayout_Ratio(100), mLayout_Ratio(20));
    self.storeTipLB.frame = CGRectMake(self.storeNameLB.left, self.storeNameLB.bottom+mLayout_Ratio(5), self.storeNameLB.width, self.storeNameLB.height);
    self.storeShareBtn.frame = CGRectMake(self.width-mLayout_Ratio(99)+mLayout_Ratio(10), self.backgroundImgView.height-mLayout_Ratio(35)-mLayout_Ratio(28), mLayout_Ratio(99), mLayout_Ratio(28));
    self.storeShareBtn.layer.masksToBounds = YES;
    self.storeShareBtn.layer.cornerRadius = self.storeShareBtn.height/2.0f;
    
    self.editBtn.frame = CGRectMake(self.avatarImgView.right-mLayout_Ratio(9), self.avatarImgView.bottom-mLayout_Ratio(9), mLayout_Ratio(18), mLayout_Ratio(18));
    
    self.whiteBackImgView.frame = CGRectMake(mLayout_Ratio(20), mLayout_Ratio(27), mLayout_Ratio(22), mLayout_Ratio(22));
    self.clickBackBtn.frame = CGRectMake(0, mLayout_Ratio(10), mLayout_Ratio(44), mLayout_Ratio(44));
    self.clickBackBtn.center = self.whiteBackImgView.center;
    
    self.clickBackBtn.centerY = self.whiteBackImgView.centerY = self.previewBtn.centerY;
}

- (void)updateStoreHeaderData:(MStoreInfoData *)data isHead:(BOOL)isHead
{
    if (isHead)
        self.storeTipLB.text = [NSString stringWithFormat:@"在售商品 %d",data.totalgoods];
    else
        self.storeTipLB.text = [NSString stringWithFormat:@"%@",STR_IS_NULL(data.descriptionStr)];
    
    [self.avatarImgView m_setImageWithURL:[NSURL URLWithString:UserModelObj.photo] placeholderImage:mGetImage(mUserLogoImage)];
    self.storeNameLB.text = [NSString stringWithFormat:@"%@",STR_IS_NULL(data.storename)];
}

- (void)setIsStoreHome:(BOOL)isStoreHome
{
    if (isStoreHome)
    {
        self.clickAvatarBtn.hidden = YES;
        self.editBtn.hidden = YES;
        self.whiteBackImgView.image = mGetImage(@"personal_center_message");
    }
    else
    {
        self.clickAvatarBtn.hidden = NO;
        self.editBtn.hidden = NO;
        self.whiteBackImgView.image = mGetImage(@"store_whiteBack");
    }
}


- (IBAction)clikWhiteBackBtn:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickManageHeaderBtnActionWithType:)])
    {
        [self.delegate clickManageHeaderBtnActionWithType:MStoreManageHeaderActionTypeLeftBack];
    }
}

- (IBAction)clikRightPreviewBtn:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickManageHeaderBtnActionWithType:)])
    {
        [self.delegate clickManageHeaderBtnActionWithType:MStoreManageHeaderActionTypeRightPreview];
    }
}


- (IBAction)clikEditAvatarBtn:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickManageHeaderBtnActionWithType:)])
    {
        [self.delegate clickManageHeaderBtnActionWithType:MStoreManageHeaderActionTypeEditAvatar];
    }
}



- (IBAction)clikStoreShareBtn:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickManageHeaderBtnActionWithType:)])
    {
        [self.delegate clickManageHeaderBtnActionWithType:MStoreManageHeaderActionTypeStoreShare];
    }
}



@end
