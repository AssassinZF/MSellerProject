//
//  MPersonalCenterHeaderView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalCenterHeaderView.h"

@interface MPersonalCenterHeaderView ()
{
    UIImageView *_imageView;    //底部View
    UIButton *_messageBtn;      //消息按钮
    UIButton *_carBtn;          //购物车按钮
    UIImageView *_userImageView;    //用户图片
    UILabel *_userNameLabel;  //用户名称

    UILabel *_balanceTxtLabel;  //可用收益
    UILabel *_balanceLabel;     //
    
    UILabel *_estimateTxtLabel; //预计收益
    UILabel *_estimateLabel;    //
    
    UILabel *_cumulativeTxtLabel;   //累计收益
    UILabel *_cumulativeLabel;      //
    
    UIButton *_reflectBtn;  //提现
    
    UIView *_horLineView;
    UIView *_verLineView;

    UIView *_bottomView;
    
}

@end

@implementation MPersonalCenterHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    
    self.backgroundColor = MC_White_Color;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, mLayout_Ratio(165))];
    _imageView.image = mGetImage(@"personal_center_bg");
    [self addSubview:_imageView];
    
    _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _messageBtn.frame = CGRectMake(0, 20, mLayout_Ratio(52), mLayout_Ratio(52));
    _messageBtn.backgroundColor = MC_Clear_Color;
    [_messageBtn setImage:mGetImage(@"personal_center_message") forState:UIControlStateNormal];
    [self addSubview:_messageBtn];
    
    _carBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _carBtn.frame = CGRectMake(Screen_Width-_messageBtn.width, _messageBtn.top, _messageBtn.width, _messageBtn.height);
    _carBtn.backgroundColor = MC_Clear_Color;
    [_carBtn setImage:mGetImage(@"personal_center_car") forState:UIControlStateNormal];
    [self addSubview:_carBtn];
    
    _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_Width-mLayout_Ratio(64))/2, mLayout_Ratio(54), mLayout_Ratio(64), mLayout_Ratio(64))];
    _userImageView.image = mGetImage(@"personal_center_bg");
    [self addSubview:_userImageView];
    _userImageView.layer.masksToBounds = YES;
    _userImageView.layer.cornerRadius = _userImageView.height/2;
    _userImageView.layer.borderWidth = 1;
    _userImageView.layer.borderColor = MC_White_Color.CGColor;
    
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake((Screen_Width-mLayout_Ratio(150))/2, _userImageView.bottom+mLayout_Ratio(12), mLayout_Ratio(150), mLayout_Ratio(30))];
    _userNameLabel.textAlignment = NSTextAlignmentCenter;
    _userNameLabel.textColor = MC_White_Color;
    _userNameLabel.font = mLayoutSystemFont(16);
    _userNameLabel.numberOfLines = 1;
    _userNameLabel.text = mLocalizedString(@"mPersonal_Balance");
    [_userNameLabel sizeToFit];
    _userNameLabel.text = @"";
    _userNameLabel.width = mLayout_Ratio(150);
    [self addSubview:_userNameLabel];
    
    //可用收益
    CGFloat blaTextHeith = [MUtilities getSizeWithText:mLocalizedString(@"mPersonal_Balance") textFontSize:mLayoutSystemFont(14) textWidth:(Screen_Width-mLayout_Ratio(15))/2].height;
    CGFloat blaHeight = [MUtilities getSizeWithText:@"￥123456789.0" textFontSize:mLayoutSystemFont(21) textWidth:(Screen_Width-mLayout_Ratio(15))/2].height;
    
    CGFloat spHeight = (mLayout_Ratio(78)-blaTextHeith-blaHeight-mLayout_Ratio(12))/2;
    
    _balanceTxtLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), _imageView.bottom+spHeight, Screen_Width-mLayout_Ratio(110), blaTextHeith)];
    _balanceTxtLabel.textColor = MC_AlertText_Color;
    _balanceTxtLabel.font = mLayoutSystemFont(14);
    _balanceTxtLabel.numberOfLines = 1;
    _balanceTxtLabel.text = mLocalizedString(@"mPersonal_Balance");
    [self addSubview:_balanceTxtLabel];
    
    _balanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_balanceTxtLabel.left, _balanceTxtLabel.bottom+mLayout_Ratio(12), _balanceTxtLabel.width, blaHeight)];
    _balanceLabel.textColor = MC_Orange_Color;
    _balanceLabel.font = mLayoutSystemFont(21);
    _balanceLabel.numberOfLines = 1;
    _balanceLabel.attributedText = [MUtilities setLabelAttributedTextWithInitStr:@"￥0.00" needSetStr1:@"￥" needSetStr2:@"0.00" color1:MC_Orange_Color color2:MC_Orange_Color textSize1:18 textSize2:21];
    [self addSubview:_balanceLabel];
    
    _horLineView = [[UIView alloc] initWithFrame:CGRectMake(mLayout_Ratio(10), _imageView.bottom+mLayout_Ratio(76), Screen_Width-mLayout_Ratio(20), 1)];
    _horLineView.backgroundColor = MC_BGGray_Color;
    [self addSubview:_horLineView];
    
    //预计收益
    _estimateTxtLabel = [[UILabel alloc] initWithFrame:CGRectMake(_balanceTxtLabel.left, _imageView.bottom+mLayout_Ratio(78)+mLayout_Ratio(15), Screen_Width/2-mLayout_Ratio(25), 100)];
    _estimateTxtLabel.textColor = MC_AlertText_Color;
    _estimateTxtLabel.font = mLayoutSystemFont(13);
    _estimateTxtLabel.numberOfLines = 1;
    _estimateTxtLabel.text = mLocalizedString(@"mPersonal_Estimate");
    [self addSubview:_estimateTxtLabel];
    [_estimateTxtLabel sizeToFit];
    _estimateTxtLabel.width = Screen_Width/2-mLayout_Ratio(25);

    _estimateLabel = [[UILabel alloc] initWithFrame:CGRectMake(_balanceTxtLabel.left, _estimateTxtLabel.bottom+mLayout_Ratio(12), _estimateTxtLabel.width, blaTextHeith)];
    _estimateLabel.textColor = MC_DGray_Color;
    _estimateLabel.font = mLayoutSystemFont(14);
    _estimateLabel.numberOfLines = 1;
    _estimateLabel.text = @"0.00";
    [self addSubview:_estimateLabel];
    [_estimateLabel sizeToFit];
    _estimateLabel.width = _estimateTxtLabel.width;
    
    _verLineView = [[UIView alloc] initWithFrame:CGRectMake((Screen_Width-1)/2, _estimateTxtLabel.top, 1, _estimateTxtLabel.height+mLayout_Ratio(12)+_estimateLabel.height)];
    _verLineView.backgroundColor = MC_BGGray_Color;
    [self addSubview:_verLineView];
    
    //累计收益
    _cumulativeTxtLabel = [[UILabel alloc] initWithFrame:CGRectMake(Screen_Width/2+mLayout_Ratio(15), _estimateTxtLabel.top, _estimateTxtLabel.width, _estimateTxtLabel.height)];
    _cumulativeTxtLabel.textColor = MC_AlertText_Color;
    _cumulativeTxtLabel.font = mLayoutSystemFont(13);
    _cumulativeTxtLabel.numberOfLines = 1;
    _cumulativeTxtLabel.text = mLocalizedString(@"mPersonal_Cumulative");
    [self addSubview:_cumulativeTxtLabel];

    _cumulativeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_cumulativeTxtLabel.left, _estimateLabel.top, _estimateLabel.width, _estimateLabel.height)];
    _cumulativeLabel.textColor = MC_DGray_Color;
    _cumulativeLabel.font = mLayoutSystemFont(14);
    _cumulativeLabel.numberOfLines = 1;
    _cumulativeLabel.text = @"0.00";
    [self addSubview:_cumulativeLabel];
    
    //提现
    _reflectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _reflectBtn.size = CGSizeMake(mLayout_Ratio(70), mLayout_Ratio(30));
    _reflectBtn.left = (Screen_Width-_reflectBtn.width-mLayout_Ratio(15));
    _reflectBtn.top = _imageView.bottom+(mLayout_Ratio(78)-_reflectBtn.height)/2;
    _reflectBtn.titleLabel.font = mLayoutSystemFont(15);
    [_reflectBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    [_reflectBtn setTitle:mLocalizedString(@"mPersonal_Reflect") forState:UIControlStateNormal];
    [self addSubview:_reflectBtn];
    _reflectBtn.layer.masksToBounds = YES;
    _reflectBtn.layer.cornerRadius = mLayout_Ratio(5);
    _reflectBtn.layer.borderWidth = 1;
    _reflectBtn.layer.borderColor = MC_Orange_Color.CGColor;
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _estimateLabel.bottom+mLayout_Ratio(12), Screen_Width, mLayout_Ratio(20))];
    _bottomView.backgroundColor = MC_BGGray_Color;
    [self addSubview:_bottomView];
    
    self.frame = CGRectMake(0, 0, Screen_Width, _bottomView.bottom);
}

- (void)updateHeaderView
{
    [_userImageView m_setImageWithURL:[NSURL URLWithString:UserModelObj.photo] placeholderImage:mGetImage(mUserLogoImage)];
    _userNameLabel.text = UserModelObj.username;
    //可用收益
    NSString *srcStr = [NSString stringWithFormat:@"￥%0.2f", UserModelObj.balance];
    _balanceLabel.attributedText = [MUtilities setLabelAttributedTextWithInitStr:srcStr needSetStr:@"￥" color:MC_Orange_Color textSize:16 backroundColor:MC_Clear_Color];
    //[NSString stringWithFormat:@"￥%0.2f", UserModelObj.balance];
    //预计收益
    _estimateLabel.text = [NSString stringWithFormat:@"%0.2f", UserModelObj.estimateamt];
    //累计收益
    _cumulativeLabel.text = [NSString stringWithFormat:@"%0.2f", UserModelObj.totalearningamt];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
