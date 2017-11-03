//
//  MGoodsDetailView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailHeadView.h"
#import "SDCycleScrollView.h"

@interface MGoodsDetailHeadView () <SDCycleScrollViewDelegate>
{
    SDCycleScrollView *_cycleScrollView;
    UILabel *_titleLabel;
    UILabel *_desLabel;
    UILabel *_priceLabel;
}

@end

@implementation MGoodsDetailHeadView

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
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Screen_Width, mLayout_Ratio(335)) delegate:self placeholderImage:mGetImage(mPlaceHolderImage)];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(12), _cycleScrollView.bottom+mLayout_Ratio(10), Screen_Width-mLayout_Ratio(24), 100)];
    _titleLabel.numberOfLines = 2;
    _titleLabel.font = mSystemFont(17);
    _titleLabel.textColor = MC_DarkGray_Color;
    [self addSubview:_titleLabel];
    
    _desLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, 100)];
    _desLabel.font = mSystemFont(15);
    _desLabel.textColor = MC_Orange_Color;
    [self addSubview:_desLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _desLabel.bottom, _titleLabel.width, 100)];
    _priceLabel.font = mSystemFont(16);
    _priceLabel.textColor = MC_DarkGray_Color;
    [self addSubview:_priceLabel];
    
}

- (void)updateGoodsDetailView:(MGoodsDetailData *)detailData
{
    NSArray *imagesURLStrings = @[
                                  @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=22528817,1858323476&fm=27&gp=0.jpg",
                                  @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=725515905,2472463078&fm=27&gp=0.jpg",
                                  @"http://img4.imgtn.bdimg.com/it/u=1254822470,3648184938&fm=200&gp=0.jpg",
                                  @"http://img3.imgtn.bdimg.com/it/u=750314566,3876612813&fm=27&gp=0.jpg",
                                  @"http://dimg09.c-ctrip.com/images/100i070000002enz8ED0A_C_671_10000_Q90.jpg"
                                  ];
    _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
    _titleLabel.text = @"[详情]MX-MJB啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    [_titleLabel sizeToFit];
    
    _desLabel.text = @"详情的描述";
    [_desLabel sizeToFit];
    _desLabel.top = _titleLabel.bottom+mLayout_Ratio(6);
    
    _priceLabel.attributedText = [MUtilities setPriceAttributedWithStr:@"￥88.00 / 约赚￥9.00" price1:@"88.00" price2:@"9.00"];
    [_priceLabel sizeToFit];
    _priceLabel.top = _desLabel.bottom+mLayout_Ratio(10);
    
    self.frame = CGRectMake(0, 0, Screen_Width, _priceLabel.bottom+mLayout_Ratio(10));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark -
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(goodsDetailHeadSelectItemAtIndex:)]) {
        [self.delegate goodsDetailHeadSelectItemAtIndex:index];
    }
}

@end
