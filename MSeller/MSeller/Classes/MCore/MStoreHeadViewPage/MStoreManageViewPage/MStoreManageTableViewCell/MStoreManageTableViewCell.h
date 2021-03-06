//
//  MStoreManageTableViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/10/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MStoreManageModel.h"
#import "MStoreManageData.h"

@class MStoreManageTableViewCell;

typedef enum : NSInteger {
    MStoreManageActionTypeCCancel,      //精选列表取消按钮
    MStoreManageActionTypeCShare,       //精选列表分享按钮
    MStoreManageActionTypeADelete,      //关注列表删除按钮
    MStoreManageActionTypeAAdd,         //关注列表添加按钮
    MStoreManageActionTypeAShare,       //关注列表分享按钮
    MStoreManageActionTypeSort,         //排序条件排序按钮
}MStoreManageActionType;

@protocol MStoreManageTableViewCellDelegate <NSObject>

- (void)clickStoreManageActionWithType:(MStoreManageActionType)type AndCell:(MStoreManageTableViewCell *)cell;

@end

@interface MStoreManageTableViewCell : MBaseTableViewCell


//商品图片
@property (nonatomic, weak) IBOutlet UIImageView *storeImgView;
//商品名称
@property (nonatomic, weak) IBOutlet UILabel *goodsNameLB;
//商品价格
@property (nonatomic, weak) IBOutlet UILabel *goodsPriceLB;

//精选操作view
@property (nonatomic, weak) IBOutlet UIView *choicenessActionView;
//取消按钮
@property (nonatomic, weak) IBOutlet UIButton *cancelBtn;
//分享按钮
@property (nonatomic, weak) IBOutlet UIButton *shareBtn;

//关注操作view
@property (nonatomic, weak) IBOutlet UIView *AttentionActionView;
//删除按钮
@property (nonatomic, weak) IBOutlet UIButton *deleteBtn;
//添加按钮
@property (nonatomic, weak) IBOutlet UIButton *addBtn;
//关注分享按按钮
@property (nonatomic, weak) IBOutlet UIButton *AShareBtn;

//排序操作view
@property (nonatomic, weak) IBOutlet UIView *sortActionView;
//排序按钮
@property (nonatomic, weak) IBOutlet UIButton *sortActionBtn;

@property (nonatomic, strong) MStoreManageData *manageData;


@property (nonatomic, weak) id<MStoreManageTableViewCellDelegate> delegate;


- (void)updateManageCellWithModel:(MStoreManageModel *)model AndManageData:(MStoreManageData *)data;

@end
