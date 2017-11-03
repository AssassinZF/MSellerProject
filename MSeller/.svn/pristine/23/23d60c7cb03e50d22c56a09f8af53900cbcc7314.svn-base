//
//  MStoreManageHeaderView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MStoreInfoModel.h"

typedef enum : NSInteger {
    MStoreManageHeaderActionTypeLeftBack,       //左侧返回事件
    MStoreManageHeaderActionTypeRightPreview,   //右侧预览事件
    MStoreManageHeaderActionTypeEditAvatar,     //编辑头像事件
    MStoreManageHeaderActionTypeStoreShare,     //店铺分享事件
}MStoreManageHeaderActionType;


@protocol MStoreManageHeaderViewDelegate <NSObject>

- (void)clickManageHeaderBtnActionWithType:(MStoreManageHeaderActionType)type;

@end


@interface MStoreManageHeaderView : UIView


//店铺管理背景图片
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImgView;
//头像图片Imageview
@property (nonatomic, weak) IBOutlet UIImageView *avatarImgView;
//店铺名称
@property (nonatomic, weak) IBOutlet UILabel *storeNameLB;
//店铺提示小字
@property (nonatomic, weak) IBOutlet UILabel *storeTipLB;
//店铺分享按钮
@property (nonatomic, weak) IBOutlet UIButton *storeShareBtn;
//预览按钮
@property (nonatomic, weak) IBOutlet UIButton *previewBtn;
//编辑头像按钮
@property (nonatomic, weak) IBOutlet UIButton *editBtn;
//头像点击事件
@property (nonatomic, weak) IBOutlet UIButton *clickAvatarBtn;
//返回按钮图片
@property (nonatomic, weak) IBOutlet UIImageView *whiteBackImgView;
//返回点击按钮
@property (nonatomic, weak) IBOutlet UIButton *clickBackBtn;

@property (nonatomic, assign) BOOL isStoreHome;


@property (nonatomic, weak) id<MStoreManageHeaderViewDelegate> delegate;


+ (MStoreManageHeaderView *)initSectionViewWithNib:(id)delegate;
- (void)updateStoreHeaderData:(MStoreInfoData *)data isHead:(BOOL)isHead;


@end
