//
//  MStoreInfoTableViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreInfoTableViewCell.h"

@implementation MStoreInfoTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.leftTextLB.font = [MUtilities setFontSizeWith:15.0];
}


- (void)updateSubviewsPropertyWithModel:(MStoreInfoModel *)model
{
    self.leftTextLB.text = model.leftTextStr;
    
    switch (model.type)
    {
        case MStoreInfoCellTypeStoreName:
        {
            self.rightTextLB.hidden = NO;
            self.storeLogoImgView.hidden = YES;
            self.storeImageView.hidden = YES;
            self.rightTextLB.font = [MUtilities setFontSizeWith:14.0];
            self.rightTextLB.textColor = MC_DarkGray_Color;
            self.rightTextLB.text = model.rightTextStr;
        }
            break;
        case MStoreInfoCellTypeStoreLogo:
        {
            self.rightTextLB.hidden = YES;
            self.storeLogoImgView.hidden = NO;
            self.storeImageView.hidden = YES;
            [self.storeLogoImgView m_setImageWithURL:[NSURL URLWithString:model.infoData.logopic] placeholderImage:mGetImage(mUserLogoImage)];
        }
            break;
        case MStoreInfoCellTypeStoreDesc:
        {
            self.rightTextLB.hidden = YES;
            self.storeLogoImgView.hidden = YES;
            self.storeImageView.hidden = YES;
            self.rightTextLB.font = [MUtilities setFontSizeWith:14.0];
            self.rightTextLB.textColor = MC_PlaceGray_Color;
        }
            break;
        case MStoreInfoCellTypeStoreImage:
        {
            self.rightTextLB.hidden = YES;
            self.storeLogoImgView.hidden = YES;
            self.storeImageView.hidden = NO;
            if (model.infoData.updateSignPic)
            {
                [self.storeImageView m_setImageWithURL:[NSURL URLWithString:model.infoData.updateSignPic] placeholderImage:mGetImage(mUserLogoImage)];
            }
            else
            {
                [self.storeImageView m_setImageWithURL:[NSURL URLWithString:model.infoData.signpic] placeholderImage:mGetImage(mUserLogoImage)];
            }
        }
            break;
        case MStoreInfoCellTypeMyOrder:
        {
            self.rightTextLB.hidden = NO;
            self.storeLogoImgView.hidden = YES;
            self.storeImageView.hidden = YES;
            self.rightTextLB.font = [MUtilities setFontSizeWith:14.0];
            self.rightTextLB.textColor = MC_AlertText_Color;
            self.rightTextLB.text = model.rightTextStr;
        }
            break;
            
            
        default:
            break;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end