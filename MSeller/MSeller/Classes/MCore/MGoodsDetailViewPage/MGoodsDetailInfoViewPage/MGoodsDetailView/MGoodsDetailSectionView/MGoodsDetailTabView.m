//
//  MGoodsDetailTabView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailTabView.h"

@interface MGoodsDetailTabView ()
{
    NSMutableArray *_btns;
    UIView *_bottomView;
}

@end

@implementation MGoodsDetailTabView

+ (CGFloat)getGoodsDetailTabViewHeight
{
    return mLayout_Ratio(45);
}

+ (instancetype)initWith:(id)delegate
{
    MGoodsDetailTabView * tabView = [[MGoodsDetailTabView alloc] init];
    tabView.delegate = delegate;
    return tabView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _btns = [[NSMutableArray alloc] initWithCapacity:0];
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.frame = CGRectMake(0, 0, Screen_Width, mLayout_Ratio(45));
    self.backgroundColor = MC_White_Color;
    
    CGFloat width = self.width/3;
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*width, 0, width, self.height);
        btn.titleLabel.font = mSystemFont(15);
        btn.tag = 1000+i;
        if (i == 0) {
            btn.selected = YES;
            [btn setTitle:mLocalizedString(@"mGoods_Detaile_Tab_Detail") forState:UIControlStateNormal];
        }else if (i == 1){
            [btn setTitle:mLocalizedString(@"mGoods_Detaile_Tab_Parameter") forState:UIControlStateNormal];
        }else{
            [btn setTitle:mLocalizedString(@"mGoods_Detaile_Tab_Explain") forState:UIControlStateNormal];
        }
        [btn setTitleColor:MC_AlertText_Color forState:UIControlStateNormal];
        [btn setTitleColor:MC_DarkGray_Color forState:UIControlStateSelected];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnChangeTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];

        [_btns addObject:btn];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
    view.backgroundColor = MC_BGGray_Color;
    [self addSubview:view];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, 100, 1)];
    _bottomView.backgroundColor = MC_DarkGray_Color;
    [self addSubview:_bottomView];
    [self setLineSizeWith:mLocalizedString(@"mGoods_Detaile_Tab_Detail") left:0];
    
}

- (void)setLineSizeWith:(NSString *)string left:(CGFloat)left
{
    CGSize titleSize = [MUtilities getSizeWithText:string textFontSize:mSystemFont(15.f) textHeight:40];
    _bottomView.left = left+(Screen_Width/3-titleSize.width)/2.f;
    if (titleSize.width > Screen_Width/3) {
        _bottomView.width = Screen_Width/3;
    }else{
        _bottomView.width = titleSize.width;
    }
}

- (void)btnChangeTouchUpInside:(UIButton *)btn
{
    if (!btn.selected) {
        for (UIButton *button in _btns) {
            if (button == btn) {
                btn.selected = YES;
                NSInteger index = [_btns indexOfObject:button];
                [self setLineSizeWith:button.titleLabel.text left:index*(Screen_Width/3)];
            }else{
                button.selected = NO;
            }
        }
        if ([self.delegate respondsToSelector:@selector(goodsDetailTabChange:)]) {
            switch (btn.tag-1000) {
                case 0:
                {
                    [self.delegate goodsDetailTabChange:MTab_Type_Detail];
                }
                    break;
                case 1:
                {
                    [self.delegate goodsDetailTabChange:MTab_Type_Property];
                }
                    break;
                case 2:
                {
                    [self.delegate goodsDetailTabChange:MTab_Type_Parameter];
                }
                    break;
                default:
                    break;
            }
        }
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
