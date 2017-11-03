//
//  MGoodsDetailViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailViewPage.h"
#import "MGoodsDetailShareViewPage.h"
#import "MGoodsDetailInfoViewPage.h"

@interface MGoodsDetailViewPage () {
    UIButton *_detailBtn;
    UIButton *_shareDetailBtn;

    MGoodsDetailInfoViewPage *_detailVC;
    MGoodsDetailShareViewPage *_shareVC;
    
    UIView *_titleLineView;
}

@end

@implementation MGoodsDetailViewPage

- (void)dealloc
{

}


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)initWithParam:(NSDictionary *)paramInfo
{
    if (paramInfo) {
        self.spuid = [[paramInfo objectForKey:@"spuid"] intValue];
        self.spucode = [paramInfo objectForKey:@"spucode"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = MC_White_Color;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    
    _detailVC = [[MGoodsDetailInfoViewPage alloc] init];
    _detailVC.spuid = self.spuid;
    _detailVC.spucode = self.spucode;
    
    [self addChildViewController:_detailVC];
    [_detailVC didMoveToParentViewController:self];
    [self.view addSubview:_detailVC.view];
    
    _shareVC = [[MGoodsDetailShareViewPage alloc] init];
    _shareVC.spuid = self.spuid;

    [self addChildViewController:_shareVC];
    _shareVC.view.left = Screen_Width;
    [_shareVC didMoveToParentViewController:self];
    [self.view addSubview:_shareVC.view];
    
    [self setNavgationBarView];

}

- (void)setNavgationBarView
{
    UIButton *btn = [self rightBarItemWithImage:mGetImage(@"nav_goods_detail_share") target:self action:@selector(rightBtnShareAction)];
    [_detailVC setRightBtn:btn];
    
    NSString *detailText = mLocalizedString(@"mGoods_Detaile_Nav_LeftTitle");
    NSString *shareDetailText = mLocalizedString(@"mGoods_Detaile_Nav_RightTitle");
    
    CGSize detailSize = [MUtilities getSizeWithText:detailText textFontSize:mSystemFont(17.f) textHeight:44];
    CGSize shareDetailSize = [MUtilities getSizeWithText:shareDetailText textFontSize:mSystemFont(17.f) textHeight:44];
    
    _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _detailBtn.backgroundColor = MC_Clear_Color;
    _detailBtn.titleLabel.font = mSystemFont(17.f);
    [_detailBtn setTitle:detailText forState:UIControlStateNormal];
    [_detailBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateNormal];
    [_detailBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateSelected];
    _detailBtn.frame = CGRectMake(0, 0, detailSize.width, 44);
    [_detailBtn addTarget:self action:@selector(showGoodsDetailView) forControlEvents:UIControlEventTouchUpInside];
    _detailBtn.selected = YES;
    
    _shareDetailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareDetailBtn.backgroundColor = MC_Clear_Color;
    _shareDetailBtn.titleLabel.font = mSystemFont(17.f);
    [_shareDetailBtn setTitle:shareDetailText forState:UIControlStateNormal];
    [_shareDetailBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateNormal];
    [_shareDetailBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateSelected];
    _shareDetailBtn.frame = CGRectMake(detailSize.width+30, 0, shareDetailSize.width, 44);
    [_shareDetailBtn addTarget:self action:@selector(showShareDetailView) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, detailSize.width+shareDetailSize.width+30, 44)];
    titleView.backgroundColor = MC_Clear_Color;
    [titleView addSubview:_detailBtn];
    [titleView addSubview:_shareDetailBtn];
    
    _titleLineView = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.height-2, _detailBtn.width, 2)];
    _titleLineView.backgroundColor = MC_DarkGray_Color;
    [titleView addSubview:_titleLineView];
    
    self.navigationItem.titleView = titleView;
}

- (void)leftBarBtnTouchUpInside
{
    if (_shareDetailBtn.selected) {
        [self showGoodsDetailView];
    }else{
        [self popViewPageAnimated:YES];
    }
}

- (void)rightBtnShareAction
{
    [_detailVC shareGoodsDetailInfo];
}

/**
 显示商品详情
 */
- (void)showGoodsDetailView
{
    if (!_detailBtn.selected) {
        _detailBtn.selected = YES;
        _shareDetailBtn.selected = NO;
        
        [self titleBtnChangeAction:NO];
        
        _titleLineView.width = _detailBtn.width;
        _titleLineView.left = _detailBtn.left;
    }
}

/**
 显示分享详情
 */
- (void)showShareDetailView
{
    if (!_shareDetailBtn.selected) {
        _shareDetailBtn.selected = YES;
        _detailBtn.selected = NO;
        
        [self titleBtnChangeAction:YES];
        _titleLineView.width = _shareDetailBtn.width;
        _titleLineView.left = _shareDetailBtn.left;
    }
}

- (void)titleBtnChangeAction:(BOOL)selectShare
{
    if (selectShare) {
        [self.view setNeedsLayout];
        [UIView animateWithDuration:0.25 animations:^{
            _shareVC.view.left = 0;
        }];
    }else{
        [self.view setNeedsLayout];
        [UIView animateWithDuration:0.25 animations:^{
            _shareVC.view.left = Screen_Width;
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
