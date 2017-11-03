//
//  MShareSDKManger.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/18.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MShareSDKManger.h"
#import <Social/Social.h>
#import "UIImage+Extend.h"

@interface MShareSDKManger ()
{
    Share_Selected_Type _selectType;
    MBaseViewCtr *_vc;
    MGoodsShareModel *_shareData;
}

@end

@implementation MShareSDKManger

singleton_implementation(MShareSDKManger)

/**
 分享
 
 @param type 类型
 @param vc  跳转的类
 @param shareData  分享数据
 */
- (void)shareActionType:(Share_Selected_Type)type vc:(MBaseViewCtr *)vc data:(MGoodsShareModel *)shareData
{
    _selectType = type;
    _vc = vc;
    _shareData = shareData;
    
    switch (type) {
        case Share_Type_Link:
        {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:STR_IS_NULL(_shareData.shareUrl)];
        }
            break;
        case Share_Type_WB:
        case Share_Type_WX:
        case Share_Type_WXFriend:
        case Share_Type_QQ:
        {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:STR_IS_NULL(_shareData.shareContent)];
            
            [self sharePresentComposeVC];
        }
            break;
        default:
            break;
    }
}


- (void)sharePresentComposeVC
{
    NSString *test = @"";
    switch (_selectType) {
        case Share_Type_WX:
        case Share_Type_WXFriend:
        {
            test = @"com.tencent.xin.sharetimeline";
        }
            break;
        case Share_Type_QQ:
        {
            test = @"com.tencent.mqq.ShareExtension";
        }
            break;
        case Share_Type_WB:
        {
            test = @"com.apple.share.SinaWeibo.post";
        }
            break;
        default:
            break;
    }
    
    if (_selectType == Share_Type_WB && ![SLComposeViewController isAvailableForServiceType:test]) {
        [self showAlertController:mLocalizedString(@"mAlert_Title") message:mLocalizedString(@"mAlert_Share_WeiBo_Message") cancel:mLocalizedString(@"mAlert_Confirm") confirm:nil];
        return;
    }
    
    //创建分享的控制器
    SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:test];
    
    if (composeVc == nil){
        NSString *message = @"";
        if (_selectType == Share_Type_QQ) {
            message = mLocalizedString(@"mAlert_Share_QQ_Message");
        }else if (_selectType == Share_Type_WX || _selectType == Share_Type_WXFriend){
            message = mLocalizedString(@"mAlert_Share_WeiXin_Message");
        }
        [self showAlertController:mLocalizedString(@"mAlert_Title") message:message cancel:mLocalizedString(@"mAlert_Confirm") confirm:nil];
    }else{
        if (_selectType == Share_Type_WB) {
            // 添加要分享的文字
            if (_shareData.shareContent && _shareData.shareContent.length > 0) {
                [composeVc setInitialText:_shareData.shareContent];
            }
            UIImage *image = nil;
            if (_shareData.shareImages && _shareData.shareImages.count > 0) {
                image = _shareData.shareImages[0];
                for (NSInteger i = 1; i < _shareData.shareImages.count; i++) {
                    image = [UIImage combine:image :_shareData.shareImages[i]];
                }
            }
            // 添加要分享的图片
            [composeVc addImage:image];
        }else{
            // 添加要分享的图片
            for ( UIImage *obj in _shareData.shareImages){
                [composeVc addImage:obj];
            }
        }
    
        if (_shareData.shareUrl && _shareData.shareUrl.length > 0) {
            [composeVc addURL:[NSURL URLWithString:_shareData.shareUrl]];
        }
        
        // 弹出分享控制器
        composeVc.completionHandler = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultDone) {
                MLog(@"点击了发送");
            }
            else if (result == SLComposeViewControllerResultCancelled){
                MLog(@"点击了取消");
            }
        };
        [_vc presentViewController:composeVc animated:YES completion:nil];
    }
}

- (void)showAlertController:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel confirm:(NSString *)confirm
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title  message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancel) {
        [alertController addAction:[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:nil]];
    }
    if (confirm) {
        [alertController addAction:[UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDefault handler:nil]];
    }
    [_vc presentViewController:alertController animated:YES completion:nil];
}

@end
