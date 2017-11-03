//
//  MPromptView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPromptView.h"

#define kPromptViewTag   10000002
#define kPromptLabelFont   [MUtilities setFontSizeWith:13.f]

@interface MPromptView ()
{
    UIImageView *_imageView;    //显示的图片
    UILabel *_contentLabel;     //说明
    UIButton *_requestBtn;      //重新请求按钮
}


@end

@implementation MPromptView

+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message
{
    UIView *promptView = [showView viewWithTag:kPromptViewTag];
    if (promptView)
    {
        [promptView removeFromSuperview];
    }
    
    MPromptView *view = [[MPromptView alloc] initWithFrame:showView.bounds];
    view.tag = kPromptViewTag;
    [view addViewWithNormal:showView typeWith:promptAlertType messageWith:message];
    [showView addSubview:view];
    return view;
}

+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message blockWith:(BtnTouchUpBlock)btnBlock
{
    UIView *promptView = [showView viewWithTag:kPromptViewTag];
    if (promptView)
    {
        [promptView removeFromSuperview];
    }
    MPromptView *view = [[MPromptView alloc] initWithFrame:showView.bounds];
    view.tag = kPromptViewTag;
    view.block = btnBlock;
    [view addViewWithNormal:showView typeWith:promptAlertType messageWith:message btnTitleWith:nil blockWith:btnBlock];
    [showView addSubview:view];
    return view;
}

/**
 缺省页面（有按钮默认点击刷新）
 
 @param showView 父UIView
 @param promptAlertType 类型
 @param message 提示文字
 @param btnTitle 按钮文字
 @param btnBlock 回调
 @return MPromptView
 */
+ (MPromptView *)show_promptAlertViewWith:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message btnTitleWith:(NSString *)btnTitle blockWith:(BtnTouchUpBlock)btnBlock
{
    UIView *promptView = [showView viewWithTag:kPromptViewTag];
    if (promptView)
    {
        [promptView removeFromSuperview];
    }
    
    MPromptView *view = [[MPromptView alloc] initWithFrame:showView.bounds];
    view.tag = kPromptViewTag;
    [view addViewWithNormal:showView typeWith:promptAlertType messageWith:message btnTitleWith:btnTitle blockWith:btnBlock];
    view.frame = showView.bounds;

    return view;
}


/**
 *  移除缺省页
 *
 *  @param showView 缺省页所在的父UIView
 */
+ (void)remove_promptAlertViewWith:(UIView *)showView
{
    UIView *promptView = [showView viewWithTag:kPromptViewTag];
    if (promptView)
    {
        [promptView removeFromSuperview];
        promptView = nil;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = MC_Clear_Color;
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MC_Clear_Color;
        [self initView];
    }
    return self;
}

- (void)initView{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mLayout_Ratio(148), mLayout_Ratio(135))];
    [self addSubview:_imageView];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mLayout_Ratio(148)+mLayout_Ratio(40), 30)];
    _contentLabel.textColor = MC_AlertText_Color;
    _contentLabel.font = mLayoutSystemFont(13.f);
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    _requestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _requestBtn.frame = CGRectMake(0, 0, mLayout_Ratio(120), mLayout_Ratio(35));
    _requestBtn.titleLabel.font = mLayoutSystemFont(14.f);
    [_requestBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    [_requestBtn setTitle:mLocalizedString(@"mAlert_Request_Refres") forState:UIControlStateNormal];
    [self addSubview:_requestBtn];
    [_requestBtn addTarget:self action:@selector(requestBtnTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
}


- (void)addViewWithNormal:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message btnTitleWith:(NSString *)btnTitle blockWith:(BtnTouchUpBlock)btnBlock
{
    self.block = btnBlock;
    switch (promptAlertType)
    {
        case M_PromptAlert_Type_Normal:
        {
            _imageView.image = [UIImage imageNamed:@"prompt_not_goods"];
            _requestBtn.hidden = YES;
        }
            break;
        case M_PromptAlert_Type_Failure:
        {
            _imageView.image = [UIImage imageNamed:@"prompt_network_failure"];
            _requestBtn.hidden = NO;
        }
            break;
        default:
        {

        }
            break;
    }
    
    if (message.length > 0) {
        _contentLabel.text = message;
        [_contentLabel sizeToFit];
    }else{
        _contentLabel.height = 0;
    }
    
    if (btnTitle && btnTitle.length > 0) {
        [_requestBtn setTitle:btnTitle forState:UIControlStateNormal];
    }
    _requestBtn.layer.masksToBounds = YES;
    _requestBtn.layer.borderWidth = 1;
    _requestBtn.layer.borderColor = MC_Orange_Color.CGColor;
    _requestBtn.layer.cornerRadius = _requestBtn.height/2.0f;
    
    CGFloat height = (self.height-_imageView.height-_contentLabel.height-_requestBtn.height-mLayout_Ratio(12)-mLayout_Ratio(12))/2.f;
    _imageView.top = height;
    _imageView.left = (self.width-_imageView.width)/2.f;
    
    _contentLabel.top = _imageView.bottom+mLayout_Ratio(12);
    _contentLabel.width = mLayout_Ratio(148)+mLayout_Ratio(40);
    _contentLabel.left = (self.width-_contentLabel.width)/2.f;
    
    _requestBtn.top = _contentLabel.bottom+mLayout_Ratio(12);
    _requestBtn.left = (self.width-_requestBtn.width)/2.f;
}

- (void)addViewWithNormal:(UIView *)showView typeWith:(M_PromptAlert_Type)promptAlertType messageWith:(NSString *)message
{
    switch (promptAlertType)
    {
        case M_PromptAlert_Type_Normal:
        {
            _imageView.image = [UIImage imageNamed:@"prompt_not_goods"];
            _requestBtn.hidden = YES;
        }
            break;
        case M_PromptAlert_Type_Failure:
        {
            _imageView.image = [UIImage imageNamed:@"prompt_network_failure"];
            _requestBtn.hidden = NO;
        }
            break;
        default:
        {
            
        }
            break;
    }
    
    if (message.length > 0) {
        _contentLabel.text = message;
        [_contentLabel sizeToFit];
    }else{
        _contentLabel.height = 0;
    }
    

    _requestBtn.hidden = YES;

    
    CGFloat height = (self.height-_imageView.height-_contentLabel.height-mLayout_Ratio(12))/2.f;
    _imageView.top = height;
    _imageView.left = (self.width-_imageView.width)/2.f;
    
    _contentLabel.top = _imageView.bottom+mLayout_Ratio(12);
    _contentLabel.width = mLayout_Ratio(148)+mLayout_Ratio(40);
    _contentLabel.left = (self.width-_contentLabel.width)/2.f;
}


- (void)requestBtnTouchUpInside {
    if (self.block) {
        self.block();
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
