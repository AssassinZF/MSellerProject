//
//  MSearchTableViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchResultTableViewCell.h"


@interface MSearchResultTableViewCell ()
{
    NSInteger _index;
}

@end

@implementation MSearchResultTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)updateSearchResultCellWithData:(MSearchResultData *)data index:(NSInteger)index
{
    _index = index;

    [self.goodsImgView m_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data.goodspictureurl]] placeholderImage:mGetImage(mPlaceHolderImage)];
    self.goodsNameLB.text = [NSString stringWithFormat:@"%@",data.goodsname];
    self.goodsPriceLB.attributedText = [MUtilities setPriceAttributedWithStr:[NSString stringWithFormat:@"￥%.2f / 约赚￥%.2f",data.goodsprice,data.goodsprofit] price1:[NSString stringWithFormat:@"%.2f",data.goodsprice] price2:[NSString stringWithFormat:@"%.2f",data.goodsprofit]];
    
    [self.goodsPriceLB sizeToFit];
}


- (IBAction)clickHeartEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSearchCellBtnActionWithType:index:)])
    {
        [self.delegate clickSearchCellBtnActionWithType:SearchCell_Type_Heart index:_index];
    }
}


- (IBAction)clickAddEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSearchCellBtnActionWithType:index:)])
    {
        [self.delegate clickSearchCellBtnActionWithType:SearchCell_Type_Add index:_index];
    }
}


- (IBAction)clickShareEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSearchCellBtnActionWithType:index:)])
    {
        [self.delegate clickSearchCellBtnActionWithType:SearchCell_Type_Share index:_index];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end