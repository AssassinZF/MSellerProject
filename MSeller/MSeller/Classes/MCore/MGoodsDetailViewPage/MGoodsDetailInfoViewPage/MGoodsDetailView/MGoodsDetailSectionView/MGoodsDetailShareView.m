//
//  MGoodsDetailShareView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailShareView.h"

@interface MGoodsDetailShareView ()
{
    UILabel *_contentLabel;
    UIScrollView *_scrollView;
    UIButton *_moreBtn;
}

@end

@implementation MGoodsDetailShareView

+ (CGFloat)getGoodsDetailShareViewHeight
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), mLayout_Ratio(8), Screen_Width-mLayout_Ratio(30), mLayout_Ratio(50))];
    titleLabel.font = mLayoutSystemFont(14);
    titleLabel.textColor = MC_DarkGray_Color;
    titleLabel.text = mLocalizedString(@"mGoods_Detaile_Nav_RightTitle");
    [titleLabel sizeToFit];
    
    return mLayout_Ratio(8)+mLayout_Ratio(50)+titleLabel.bottom+mLayout_Ratio(8)+mLayout_Ratio(115)+mLayout_Ratio(10)+mLayout_Ratio(30)+mLayout_Ratio(10);
}

+ (instancetype)initWith:(id)delegate
{
    MGoodsDetailShareView *propertyView = [[MGoodsDetailShareView alloc] init];
    propertyView.delegate = delegate;
    return propertyView;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = MC_White_Color;
    
    UIView *topBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, mLayout_Ratio(8))];
    topBGView.backgroundColor = MC_BGGray_Color;
    [self addSubview:topBGView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), topBGView.bottom, Screen_Width-mLayout_Ratio(30), mLayout_Ratio(50))];
    titleLabel.font = mLayoutSystemFont(15);
    titleLabel.textColor = MC_DarkGray_Color;
    titleLabel.text = mLocalizedString(@"mGoods_Detaile_Nav_RightTitle");
    [self addSubview:titleLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width-mLayout_Ratio(30), 0, mLayout_Ratio(15), mLayout_Ratio(15))];
    imageView.image = mGetImage(@"detail_property_arrow");
    imageView.centerY = titleLabel.centerY;
    [self addSubview:imageView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), titleLabel.bottom-1, Screen_Width-mLayout_Ratio(30), 1)];
    lineView.backgroundColor = MC_BGGray_Color;
    [self addSubview:lineView];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), lineView.bottom+mLayout_Ratio(8), Screen_Width-mLayout_Ratio(30), 100)];
    _contentLabel.font = mLayoutSystemFont(14);
    _contentLabel.textColor = MC_DarkGray_Color;
    _contentLabel.text = mLocalizedString(@"mGoods_Detaile_Nav_RightTitle");
    [self addSubview:_contentLabel];
    [_contentLabel sizeToFit];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _contentLabel.bottom+mLayout_Ratio(8), Screen_Width, mLayout_Ratio(115))];
    [self addSubview:_scrollView];
    
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreBtn.frame = CGRectMake((Screen_Width-mLayout_Ratio(110))/2.f, _scrollView.bottom+mLayout_Ratio(10), mLayout_Ratio(110), mLayout_Ratio(30));
    _moreBtn.titleLabel.font = mLayoutSystemFont(13.f);
    [_moreBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    [_moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    _moreBtn.layer.masksToBounds = YES;
    _moreBtn.layer.cornerRadius = mLayout_Ratio(5);
    _moreBtn.layer.borderColor = MC_Orange_Color.CGColor;
    _moreBtn.layer.borderWidth = 1;
    
    [self addSubview:_moreBtn];
    self.frame = CGRectMake(0, 0, Screen_Width, _moreBtn.bottom+mLayout_Ratio(10));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
