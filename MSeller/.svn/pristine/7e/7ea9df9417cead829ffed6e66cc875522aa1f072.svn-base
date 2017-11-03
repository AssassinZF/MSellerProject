//
//  MGoodsDetailPropertyView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailPropertyView.h"

@interface MGoodsDetailPropertyView ()

@end

@implementation MGoodsDetailPropertyView

+ (CGFloat)getGoodsDetailPropertyViewHeight
{
    return mLayout_Ratio(66);
}

+ (instancetype)initWith:(id)delegate
{
    MGoodsDetailPropertyView *propertyView = [[MGoodsDetailPropertyView alloc] init];
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
    self.frame = CGRectMake(0, 0, Screen_Width, mLayout_Ratio(66));
    self.backgroundColor = MC_BGGray_Color;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, mLayout_Ratio(8), self.width, self.height-mLayout_Ratio(16));
    btn.backgroundColor = MC_White_Color;
    [self addSubview:btn];
    [btn addTarget:self action:@selector(changePropertyInside) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), btn.top, Screen_Width-mLayout_Ratio(30), btn.height)];
    textLabel.textColor = MC_DarkGray_Color;
    textLabel.font = mSystemFont(15.f);
    textLabel.text = mLocalizedString(@"mGoods_Detaile_Select_Parameter");
    [self addSubview:textLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-mLayout_Ratio(30), 0, mLayout_Ratio(15), mLayout_Ratio(15))];
    imageView.image = mGetImage(@"detail_property_arrow");
    imageView.centerY = btn.centerY;
    [self addSubview:imageView];
}

- (void)changePropertyInside
{
    if ([self.delegate respondsToSelector:@selector(goodsDetailChangeProperty)]) {
        [self.delegate goodsDetailChangeProperty];
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
