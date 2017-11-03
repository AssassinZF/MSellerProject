//
//  MUserLoginViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MUserLoginViewPage.h"

#import "MUserLoginController.h"
#import "MUserLoginModel.h"
#import "MAuthCodeTimer.h"
#import "MLoginUtiles.h"
#import "MLoginUserInfoData.h"
#import "MTabBarController.h"
#import "MHomeViewPage.h"
#import "MPersonalCenterViewPage.h"
#import "MStoreInfoViewPage.h"
#import "AppDelegate+ViewController.h"

@interface MUserLoginViewPage ()
<MAuthCodeTimerDelegate, UITextFieldDelegate,
MBaseControllerDelegate>
{
    MUserLoginModel *loginModel;        //用户登录所获信息model
    NSMutableSet *_codeNumberSet;       //用户登录手机号码集合
}

@end

@implementation MUserLoginViewPage


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MUserLoginController"];
        loginModel = [self.controller getModelFromListByName:@"MUserLoginModel"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[MAuthCodeTimer shared] setDelegate:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:self.phoneNumTF];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:self.authCodeTF];
    
    [self setCurrentLoginBtnState];
    [self showCodeNumberLabel:NO timerWith:nil phoneWith:self.phoneNumTF.text];
    [MAuthCodeTimer shared].isClickGetCode = NO;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self.view endEditing:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _codeNumberSet = [[NSMutableSet alloc] initWithCapacity:0];
    
    self.controller.delegate = self;
    
    self.loginBtn.enabled = NO;
    
    NSString *phoneNum = [UserDefaultsObj objectForKey:MUD_Login_PhoneNum];
    if ([phoneNum length] > 0)
    {
        self.phoneNumTF.text = phoneNum;
    }
    
    [self setSubviewsProperty];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark 子视图属性设置
- (void)setSubviewsProperty
{
    NSString *initStr = mLocalizedString(@"mLogin_Check_Protocol");
    NSString *needStr = mLocalizedString(@"mLogin_Text_Protocol");
    [self.phoneNumTF becomeFirstResponder];
    self.userProtocolLB.attributedText = [MUtilities setLabelAttributedTextWithInitStr:initStr needSetStr:needStr color:MC_Protocol_Color textSize:12.0 forwardSearch:NO lineSpacing:0];
    self.phoneNumTF.borderStyle = self.authCodeTF.borderStyle = UITextBorderStyleNone;
    self.phoneNumTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.phoneNumTF.placeholder attributes:@{NSForegroundColorAttributeName:MC_Placeholder_Color}];
    self.authCodeTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.authCodeTF.placeholder attributes:@{NSForegroundColorAttributeName:MC_Placeholder_Color}];
    
    self.phoneNumLB.font = self.authCodeLB.font = [MUtilities setFontSizeWith:16.0];
    self.phoneNumTF.font = self.authCodeTF.font = [MUtilities setFontSizeWith:16.0];
    self.getAuthCodeBtn.titleLabel.font = [MUtilities setFontSizeWith:15.0];
}


#pragma mark 获取验证码按钮点击事件
- (IBAction)clickGetAuthCodeBtnAction:(id)sender
{
    if ([self.phoneNumTF.text length] <= 0)
    {
        [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Empt_Phone")];

        return;
    }
    else if (![MUtilities isValidateMobile:self.phoneNumTF.text])
    {
        [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Wrong_Phone")];

        return;
    }
    //业务类型，1登录验证码 2找回密码 3换绑手机号 4收益提现 = ['1', '2', '3', '4']
    [self.controller sendMessageID:mRequestGetCodeTag messageInfo:@{@"phoneNum":self.phoneNumTF.text,@"smstype":[NSNumber numberWithInteger:1]}];
}



#pragma mark 登录按钮点击事件
- (IBAction)clickUserLoginBtnAction:(id)sender
{
    if ([self.phoneNumTF.text length] <= 0)
    {
        [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Empt_Phone")];

        return;
    }
    else if (![MUtilities isValidateMobile:self.phoneNumTF.text])
    {
        [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Wrong_Phone")];

        return;
    }
    else if ([self.authCodeTF.text length] <= 0)
    {
        [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Empt_AuthCode")];

        return;
    }
    else
    {
        [self.view endEditing:YES];
        self.loginBtn.enabled = NO;
        [self.loginBtn setTitle:mLocalizedString(@"mLogin_Button_Disable_Title") forState:UIControlStateNormal];
        [self.controller sendMessageID:mRequestLoginTag messageInfo:@{@"phoneNum":self.phoneNumTF.text,@"authCode":self.authCodeTF.text}];
    }
}


#pragma mark 用户协议点击事件
- (IBAction)clickUserProtocolBtnClick:(id)sender
{
    MTIPSAlertView *mAlertView = [[MTIPSAlertView alloc] initWithTitle:nil message:mLocalizedString(@"mLogin_Alert_Request_Busy") sureBtn:mLocalizedString(@"mAlert_Confirm") cancleBtn:nil];
    mAlertView.resultIndex = ^(NSInteger index){
        //回调---处理一系列动作
    };
    [mAlertView showMAlertView];
}


/**
 *  获取验证码倒计时是否显示
 *
 *  @param isBool      Yes显示倒计时  NO不显示
 *  @param timerString 倒计时显示时时间  isBool为NO传NIL
 */
- (void)showCodeNumberLabel:(BOOL)isBool timerWith:(NSString *)timerString phoneWith:(NSString *)phone
{
    if (isBool)
    {
        self.getAuthCodeBtn.hidden = YES;
        self.timeLabel.hidden = NO;
        self.timeLabel.text = timerString;
    }
    else
    {
        if ([_codeNumberSet containsObject:phone])
        {
            [self.getAuthCodeBtn setTitle:mLocalizedString(@"mLogin_Button_Resend") forState:UIControlStateNormal];
        }
        else
        {
            [self.getAuthCodeBtn setTitle:mLocalizedString(@"mLogin_Button_GetCode") forState:UIControlStateNormal];
        }
        
        self.getAuthCodeBtn.hidden = NO;
        self.timeLabel.hidden = YES;
    }
}


#pragma mark - MAuthCodeTimerDelegate
//更新倒计时
- (void)updateTime
{
    NSNumber *number = [[MAuthCodeTimer shared].acLoginDic objectForKey:self.phoneNumTF.text];
    if (number)
    {
        [self showCodeNumberLabel:YES timerWith:[NSString stringWithFormat:@"%@(%@)",mLocalizedString(@"mLogin_Button_Resend"),number] phoneWith:self.phoneNumTF.text];
    }
}

//倒计时结束
- (void)updateTimeEnd:(NSString *)keyString
{
    if ([keyString isEqualToString:self.phoneNumTF.text])
    {
        [self showCodeNumberLabel:NO timerWith:nil phoneWith:self.phoneNumTF.text];
    }
}


#pragma mark 设置登录按钮的是否可用状态
- (void)setCurrentLoginBtnState
{
    if ((self.phoneNumTF.text.length > 0) && (self.authCodeTF.text.length == 6))
    {
        self.loginBtn.enabled = YES;
    }
    else
    {
        self.loginBtn.enabled = NO;
    }
}


#pragma mark -
#pragma mark - UITextFieldDelegate
- (void)textFieldTextDidChange
{
    [self setCurrentLoginBtnState];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneNumTF)
    {
        if (range.location >= 11)
        {
            return NO;
        }
    }
    else if (textField == self.authCodeTF)
    {
        if (range.location >= 6)
        {
            return NO;
        }
    }
    
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if (textField == self.phoneNumTF)
    {
        [self showCodeNumberLabel:NO timerWith:nil phoneWith:self.phoneNumTF.text];
    }
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark MBaseControllerDelegate
#pragma mark 发送请求完成回调方法
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    //获取验证码请求
    if (msgid == mRequestGetCodeTag)
    {
        if (errCode == eDataCodeSuccess)
        {
            [_codeNumberSet addObject:self.phoneNumTF.text];
            [[MAuthCodeTimer shared] creatTimerTypeWtih:AuthCode_Login keyWith:self.phoneNumTF.text];
            
            [self setCurrentLoginBtnState];
            
            self.timeLabel.hidden = NO;
            self.getAuthCodeBtn.hidden = YES;
            self.timeLabel.text = mLocalizedString(@"mLogin_Toast_sending");
        }
        else
        {
            [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Send_Fail")];
        }
    }
    //登录请求
    else if (msgid == mRequestLoginTag)
    {
        //登录成功
        if (errCode == eDataCodeSuccess)
        {
            [self.controller sendMessageID:mRequestGetUserInfoTag messageInfo:nil];
        }
        //返回值不为1
        else if (errCode == eDataCodeServiceFaild)
        {
            [self.view m_makeToast:[MUtilities toastResponseMessage:data]];

            self.loginBtn.enabled = YES;
            [self.loginBtn setTitle:mLocalizedString(@"mLogin_Button_Title") forState:UIControlStateNormal];
        }
        //登录失败
        else
        {
            [self.view m_makeToast:[MUtilities toastResponseMessage:data]];

            
//            [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Login_Fail")];

            self.loginBtn.enabled = YES;
            [self.loginBtn setTitle:mLocalizedString(@"mLogin_Button_Title") forState:UIControlStateNormal];
        }
    }
    //获取用户个人信息
    else if (msgid == mRequestGetUserInfoTag)
    {
        self.loginBtn.enabled = YES;
        [self.loginBtn setTitle:mLocalizedString(@"mLogin_Button_Title") forState:UIControlStateNormal];
        
        //登录成功
        if (errCode == eDataCodeSuccess)
        {
            [MAppDelegateObj setRootViewController];
        }
        //返回值不为1
        else if (errCode == eDataCodeServiceFaild)
        {
            [self.view m_makeToast:[MUtilities toastResponseMessage:data]];

        }
        //登录失败
        else
        {
            [self.view m_makeToast:mLocalizedString(@"mLogin_Toast_Login_Fail")];
        }
    }
}

@end
