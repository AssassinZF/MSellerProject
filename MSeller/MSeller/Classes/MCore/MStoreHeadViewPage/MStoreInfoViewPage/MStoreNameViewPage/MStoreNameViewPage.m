//
//  MStoreNameViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreNameViewPage.h"

#import "MStoreInfoModel.h"
#import "MStoreInfoViewPage.h"
#import "MStoreInfoData.h"

@interface MStoreNameViewPage ()
<MBaseControllerDelegate>
{
    UIButton *_rightNavBtn;
    MStoreInfoModel *infoModel;
    MStoreInfoData *infoData;
}

@end

@implementation MStoreNameViewPage


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
    infoData = STR_IS_NULL(paramInfo[@"infoData"]);
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"店名";
    
    [self setNavRightItemBtn];
    
    self.controller.delegate = self;
    
    if ([infoData.storename length] > 0 && infoData.storename)
    {
        self.inputStoreNameTF.text = infoData.storename;
    }
    self.inputStoreNameTF.font = [MUtilities setFontSizeWith:15.0];
    self.inputStoreNameTF.borderStyle = UITextBorderStyleNone;
    self.storeNameTipLB.font = [MUtilities setFontSizeWith:14.0];
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
    [self.controller sendMessageID:mRequestEditShopInfoTag messageInfo:@{@"modType":[NSNumber numberWithInteger:1],@"content":self.inputStoreNameTF.text}];
}



#pragma mark MBaseControllerDelegate
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    if (errCode == eDataCodeSuccess)
    {
        infoData.storename = self.inputStoreNameTF.text;
        infoData.indexRow = 0;
        [self popViewPageAnimated:YES];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
