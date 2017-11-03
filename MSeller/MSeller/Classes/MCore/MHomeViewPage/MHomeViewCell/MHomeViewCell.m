//
//  MHomeViewCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MHomeViewCell.h"
#import "UIImageView+MImgDownloader.h"

@interface MHomeViewCell ()
{
    NSInteger _index;
}

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UIView *nilBGView;
@property (weak, nonatomic) IBOutlet UILabel *nilLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *heartBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation MHomeViewCell

+ (CGFloat)getHomeCellHeight:(MHomeCateListData *)data
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width-mLayout_Ratio(24), 200)];
    label.font = mLayoutSystemFont(15.f);
    label.numberOfLines = 2;
    label.text = [NSString stringWithFormat:@"%@", STR_IS_NULL(data.goodsname)];
    [label sizeToFit];
    
    return mLayout_Ratio(10)+mLayout_Ratio(150)+mLayout_Ratio(8.f)+label.height+mLayout_Ratio(0.f)+mLayout_Ratio(44.f);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.topView.frame = CGRectMake(0, 0, Screen_Width, mLayout_Ratio(10.f));
    
    self.showImageView.frame = CGRectMake(0, self.topView.bottom, Screen_Width, mLayout_Ratio(150));
    
    self.nilBGView.frame = self.showImageView.frame;
    
    
    self.nilLabel.font = mLayoutSystemFont(28.f);
    self.nilLabel.size = CGSizeMake(mLayout_Ratio(160), mLayout_Ratio(75));
    self.nilLabel.center = self.nilBGView.center;
    [self.nilLabel setLayerBorderWidthWithColor:MC_White_Color width:MCellLineHeight];
    
    self.titleLabel.frame = CGRectMake(mLayout_Ratio(12), self.showImageView.bottom+mLayout_Ratio(8.f), Screen_Width-mLayout_Ratio(24), 200);
    self.titleLabel.font = mLayoutSystemFont(15.f);
    
    self.priceLabel.font = mLayoutSystemFont(15.f);
    self.heartBtn.size = CGSizeMake(mLayout_Ratio(44), mLayout_Ratio(44));
    self.addBtn.size = self.heartBtn.size;
    self.shareBtn.size = self.heartBtn.size;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateHomeCellWith:(MHomeCateListData *)data index:(NSInteger)index
{
    _index = index;
    [self.showImageView m_setImageWithURL:[NSURL URLWithString:STR_IS_NULL(data.goodspictureurl)] placeholderImage:mGetImage(mPlaceHolderImage)];
    
    self.titleLabel.width = Screen_Width-mLayout_Ratio(24);
    self.titleLabel.text = [NSString stringWithFormat:@"%@", STR_IS_NULL(data.goodsname)];
    [self.titleLabel sizeToFit];
    self.titleLabel.left = mLayout_Ratio(12.f);
    self.titleLabel.top = self.showImageView.bottom+mLayout_Ratio(8.f);
    mLayoutView(self.titleLabel);
    
    if (data.issoldout) {
        self.nilLabel.hidden = NO;
    }else{
        self.nilLabel.hidden = YES;
    }
    
    if (data.isattention) {
        self.heartBtn.selected = YES;
    }else{
        self.heartBtn.selected = NO;
    }
    
    if (data.ischoiceness) {
        self.addBtn.selected = YES;
    }else{
        self.addBtn.selected = NO;
    }
    
    self.heartBtn.top = self.titleLabel.bottom+mLayout_Ratio(0.f);
    self.heartBtn.left = Screen_Width-self.heartBtn.width*3-mLayout_Ratio(5);

    self.addBtn.top = self.heartBtn.top;
    self.addBtn.left = self.heartBtn.right;

    self.shareBtn.top = self.heartBtn.top;
    self.shareBtn.left = self.addBtn.right;

    self.priceLabel.frame = CGRectMake(self.titleLabel.left, self.heartBtn.top, self.heartBtn.left-self.titleLabel.left, self.heartBtn.height);

    self.priceLabel.attributedText = [MUtilities setPriceAttributedWithStr:[NSString stringWithFormat:@"￥%0.2f / 约赚￥%0.2f", data.goodsprice, data.goodsprofit] price1:[NSString stringWithFormat:@"%0.2f", data.goodsprice] price2:[NSString stringWithFormat:@"%0.2f", data.goodsprofit]];
    mLayoutView(self.priceLabel);

    self.size = CGSizeMake(Screen_Width, self.heartBtn.bottom);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)heartBtnTouchUpInside:(id)sender {
    if ([self.delegate respondsToSelector:@selector(home_cellSelectItemAtIndex:type:)]) {
        [self.delegate home_cellSelectItemAtIndex:_index type:HomeCell_Type_Heart];
    }
}

- (IBAction)addBtnTouchUpInside:(id)sender {
    if ([self.delegate respondsToSelector:@selector(home_cellSelectItemAtIndex:type:)]) {
        [self.delegate home_cellSelectItemAtIndex:_index type:HomeCell_Type_Add];
    }
}

- (IBAction)shareBtnTouchUpInside:(id)sender {
    if ([self.delegate respondsToSelector:@selector(home_cellSelectItemAtIndex:type:)]) {
        [self.delegate home_cellSelectItemAtIndex:_index type:HomeCell_Type_Share];
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