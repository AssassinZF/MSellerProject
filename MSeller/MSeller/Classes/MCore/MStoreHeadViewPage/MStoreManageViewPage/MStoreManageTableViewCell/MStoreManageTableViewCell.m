//
//  MStoreManageTableViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/10/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreManageTableViewCell.h"

@implementation MStoreManageTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.size = CGSizeMake(Screen_Width, mLayout_Ratio(133));
    
    self.storeImgView.frame = CGRectMake(mLayout_Ratio(7), (self.height-mLayout_Ratio(100))/2, mLayout_Ratio(100), mLayout_Ratio(100));
    self.goodsNameLB.frame = CGRectMake(self.storeImgView.right+mLayout_Ratio(8), self.storeImgView.top, self.width-self.goodsNameLB.left-mLayout_Ratio(10), mLayout_Ratio(36));
    self.goodsPriceLB.frame = CGRectMake(self.goodsNameLB.left, self.goodsNameLB.bottom+mLayout_Ratio(10), self.goodsNameLB.width, mLayout_Ratio(16));
    
    self.choicenessActionView.frame = CGRectMake(self.width-mLayout_Ratio(75), self.height-mLayout_Ratio(31)-mLayout_Ratio(16)+(mLayout_Ratio(31)-mLayout_Ratio(20))/2, mLayout_Ratio(55), mLayout_Ratio(31));
    self.cancelBtn.frame = CGRectMake(0, (self.choicenessActionView.height-mLayout_Ratio(20))/2, mLayout_Ratio(20), mLayout_Ratio(20));
    self.shareBtn.frame = CGRectMake(self.cancelBtn.right+mLayout_Ratio(15), self.cancelBtn.top, self.cancelBtn.width, self.cancelBtn.height);
    
    self.AttentionActionView.frame = CGRectMake(self.width-mLayout_Ratio(110), self.choicenessActionView.top, mLayout_Ratio(90), self.choicenessActionView.height);
    self.deleteBtn.frame = CGRectMake(0, (self.AttentionActionView.height-mLayout_Ratio(20))/2, mLayout_Ratio(20), mLayout_Ratio(20));
    self.addBtn.frame = CGRectMake(self.deleteBtn.right+mLayout_Ratio(15), self.deleteBtn.top, self.deleteBtn.width, self.deleteBtn.height);
    self.AShareBtn.frame = CGRectMake(self.addBtn.right+mLayout_Ratio(15), self.addBtn.top, self.addBtn.width, self.addBtn.height);
    
    self.sortActionView.frame = CGRectMake(self.width-mLayout_Ratio(40), self.AttentionActionView.top, mLayout_Ratio(20), self.AttentionActionView.height);
    self.sortActionBtn.frame = CGRectMake(0, self.AShareBtn.top, self.AShareBtn.width, self.AShareBtn.height);
    
    self.choicenessActionView.hidden = NO;
    self.sortActionView.hidden = YES;
    self.AttentionActionView.hidden = YES;
}


- (IBAction)clickCCancelBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeCCancel AndCell:self];
    }
}


- (IBAction)clickCShareBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeCShare AndCell:self];
    }
}


- (IBAction)clickADeleteBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeADelete AndCell:self];
    }
}


- (IBAction)clickAAddBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeAAdd AndCell:self];
    }
}


- (IBAction)clickAShareBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeAShare AndCell:self];
    }
}


- (IBAction)clickSortBtnEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreManageActionWithType:AndCell:)])
    {
        [self.delegate clickStoreManageActionWithType:MStoreManageActionTypeSort AndCell:self];
    }
}



- (void)updateManageCellWithModel:(MStoreManageModel *)model AndManageData:(MStoreManageData *)data
{
    self.manageData = data;
    if (model.isChoiceness && model.isSort)
    {
        self.choicenessActionView.hidden = YES;
        self.AttentionActionView.hidden = YES;
        self.sortActionView.hidden = NO;
    }
    else if (model.isChoiceness && !model.isSort)
    {
        self.choicenessActionView.hidden = NO;
        self.AttentionActionView.hidden = YES;
        self.sortActionView.hidden = YES;
    }
    else if (!model.isChoiceness)
    {
        self.choicenessActionView.hidden = YES;
        self.sortActionView.hidden = YES;
        self.AttentionActionView.hidden = NO;
    }
    [self.storeImgView m_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data.spuwhitepic]] placeholderImage:mGetImage(mPlaceHolderImage)];
    self.goodsNameLB.text = [NSString stringWithFormat:@"%@",data.title];
    self.goodsPriceLB.attributedText = [MUtilities setPriceAttributedWithStr:[NSString stringWithFormat:@"￥%.2f / 约赚￥%.2f",data.skupricemin,data.maxstoreincome] price1:[NSString stringWithFormat:@"%.2f",data.skupricemin] price2:[NSString stringWithFormat:@"%.2f",data.maxstoreincome]];
    
    [self.goodsPriceLB sizeToFit];
}


#pragma mark 重写 setEditing: animated:方法

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    if (self.editing == editing)
    {
        return;
    }
    
    [super setEditing:editing animated:animated];
    
    CGFloat moveSpace = 38;
    
    //cell本会右移，这里讲其往左边移动30，抵消编辑模式的右移距离
    if (editing)
    {
        self.storeImgView.left -= moveSpace;
        self.goodsNameLB.left -= moveSpace;
        self.goodsPriceLB.left -= moveSpace;
        self.choicenessActionView.left -= moveSpace;
        self.AttentionActionView.left -= moveSpace;
        self.sortActionView.left -= moveSpace;
        
        for (UIView * view in self.subviews) {
            if ([NSStringFromClass([view class]) rangeOfString:@"Reorder"].location != NSNotFound){
                for (UIView * subview in view.subviews) {
                    if ([subview isKindOfClass: [UIImageView class]]) {
                        subview.hidden = YES;
                    }
                }
            }
        }
    }
    else
    {
        self.storeImgView.left += moveSpace;
        self.goodsNameLB.left += moveSpace;
        self.goodsPriceLB.left += moveSpace;
        self.choicenessActionView.left += moveSpace;
        self.AttentionActionView.left += moveSpace;
        self.sortActionView.left += moveSpace;
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
