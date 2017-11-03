//
//  MHomeHeadView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MHomeHeadView.h"
#import "SDCycleScrollView.h"

@interface MHomeHeadView () <SDCycleScrollViewDelegate>
{
    SDCycleScrollView *_cycleScrollView;
}

@end

@implementation MHomeHeadView

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
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Screen_Width, mLayout_Ratio(165)) delegate:self placeholderImage:mGetImage(mPlaceHolderImage)];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollView];
}

/**
 *  更新UI
 */
- (void)updateViewWithArray:(NSArray *)array
{
    if (array && array.count > 0) {
        NSArray *imagesURLStrings = @[
                                      @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=22528817,1858323476&fm=27&gp=0.jpg",
                                      @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=725515905,2472463078&fm=27&gp=0.jpg"
                                      ];
        _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
        _cycleScrollView.height = mLayout_Ratio(165);

    }else{
        _cycleScrollView.height = 0;
    }
    self.frame = CGRectMake(0, 0, Screen_Width, _cycleScrollView.bottom);
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
    if ([self.delegate respondsToSelector:@selector(home_selectItemAtIndex:)]) {
        [self.delegate home_selectItemAtIndex:index];
    }
}

@end
