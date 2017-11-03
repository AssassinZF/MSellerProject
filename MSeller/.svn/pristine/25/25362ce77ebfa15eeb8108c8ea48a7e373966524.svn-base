//
//  MStoreDescViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreDescViewPage.h"

#import "MStoreInfoModel.h"
#import "MStoreInfoData.h"

#define MAX_LIMIT_NUMS 30


@interface MStoreDescViewPage ()
<UITextViewDelegate, MBaseControllerDelegate>
{
    MPlaceholderTextView *storeDescTV;
    UIButton *_rightNavBtn;
    MStoreInfoModel *infoModel;
    MStoreInfoData *infoData;
}

@end

@implementation MStoreDescViewPage


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MStoreInfoController"];
        infoModel = [self.controller getModelFromListByName:@"MStoreInfoModel"];
    }
    return self;
}


- (void)initWithParam:(NSDictionary *)paramInfo
{
    infoData = [[MStoreInfoData alloc] init];
    infoData = paramInfo[@"infoData"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"店铺描述";
    
    [self setNavRightItemBtn];
    
    storeDescTV = [[MPlaceholderTextView alloc] initWithFrame:CGRectMake(15, 0, self.backgroundView.width-15*2, self.textNumLB.top-13)];
    storeDescTV.font = [MUtilities setFontSizeWith:15.f];
    storeDescTV.placeholderColor = MC_AlertText_Color;
    storeDescTV.placeholderText = @"请输入店铺描述";
    storeDescTV.delegate = self;
    storeDescTV.spellCheckingType = NO;
    storeDescTV.autocorrectionType = NO;
    [self.backgroundView addSubview:storeDescTV];
    [self.backgroundView bringSubviewToFront:storeDescTV];

    self.textNumLB.font = [MUtilities setFontSizeWith:15.0];
    
    if ([infoData.descriptionStr length] > 0 && infoData.descriptionStr)
    {
        storeDescTV.text = infoData.descriptionStr;
        
        NSString  *nsTextContent = storeDescTV.text;
        NSInteger existTextNum = nsTextContent.length;
        self.textNumLB.text = [NSString stringWithFormat:@"%ld/%d",MAX(0, MAX_LIMIT_NUMS-existTextNum),MAX_LIMIT_NUMS];;
    }
}


- (void)setNavRightItemBtn
{
    _rightNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightNavBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_rightNavBtn setTitle:@"完成" forState:UIControlStateSelected];
    [_rightNavBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateDisabled];
    [_rightNavBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateHighlighted];
    [_rightNavBtn setTitleColor:MC_DarkGray_Color forState:UIControlStateNormal];
    _rightNavBtn.titleLabel.font = [MUtilities setFontSizeWith:15];
    _rightNavBtn.frame = CGRectMake(0, 0, 44, 44);
    [_rightNavBtn addTarget:self action:@selector(saveUserInfoToServer) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, [[UIBarButtonItem alloc]initWithCustomView:_rightNavBtn]];
}


- (void)saveUserInfoToServer
{
    [self.controller sendMessageID:mRequestEditShopInfoTag messageInfo:@{@"modType":[NSNumber numberWithInteger:2],@"content":storeDescTV.text}];
}


#pragma mark MBaseControllerDelegate
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    if (errCode == eDataCodeSuccess)
    {
        [self popViewPageAnimated:YES];
        infoData.descriptionStr = storeDescTV.text;
        infoData.indexRow = 2;
        [[NSNotificationCenter defaultCenter] postNotificationName:MNC_EditStore_Info
                                                            object:self
                                                          userInfo:@{MNC_EditStore_Info:infoData}];
    }
    else
    {
        if ([data isKindOfClass:[NSDictionary class]]) {
            [self.view m_makeToast:data[@"message"]];
        }
    }
}


#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger number = [textView.text length];
    if (number >= MAX_LIMIT_NUMS)
    {
        textView.text = [textView.text substringToIndex:MAX_LIMIT_NUMS];
    }
    
    
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (existTextNum >MAX_LIMIT_NUMS){
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        NSString *s = [nsTextContent substringToIndex:MAX_LIMIT_NUMS];
        [textView setText:s];
    }
    //不让显示负数
    self.textNumLB.text = [NSString stringWithFormat:@"%ld/%d",MAX(0, MAX_LIMIT_NUMS-existTextNum),MAX_LIMIT_NUMS];;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""])
    {
        return YES;
    }
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    if (range.location >= MAX_LIMIT_NUMS || [textView.text length] >= MAX_LIMIT_NUMS)
    {
        textView.text = [textView.text substringToIndex:30];
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
