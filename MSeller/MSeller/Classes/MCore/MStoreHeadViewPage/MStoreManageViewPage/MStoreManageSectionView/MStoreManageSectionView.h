//
//  MStoreManageSectionView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MStoreManageModel.h"

typedef enum : NSInteger {
    StoreManageClickTypeChoiceness,     //精选按钮
    StoreManageClickTypeAttention,      //关注按钮
    StoreManageClickTypeSort,           //排序按钮
}StoreManageClickType;


@protocol MStoreManageSectionViewDeleage <NSObject>

- (void)changeSelectBtnActionWithType:(StoreManageClickType)type;

@end


@interface MStoreManageSectionView : UIView


//底部精选/关注按钮view
@property (nonatomic, weak) IBOutlet UIView *bottomBtnView;
//精选按钮
@property (nonatomic, weak) IBOutlet UIButton *choicenessBtn;
//关注按钮
@property (nonatomic, weak) IBOutlet UIButton *attentionBtn;
//按钮分割竖线
@property (nonatomic, weak) IBOutlet UIView *verticalLineView;


//精选列表头部view
@property (weak, nonatomic) IBOutlet UIView *choicenessSectionView;
//精选左侧数字
@property (weak, nonatomic) IBOutlet UILabel *choicenessLeftTextLB;
//排序图片
@property (weak, nonatomic) IBOutlet UIImageView *storeSortImgView;
//排序文字
@property (weak, nonatomic) IBOutlet UILabel *storeSortLB;
//排序按钮
@property (weak, nonatomic) IBOutlet UIButton *storeSortBtn;


@property (weak, nonatomic) IBOutlet UIView *bottomLineView;


@property (weak, nonatomic) id<MStoreManageSectionViewDeleage> delegate;


+ (MStoreManageSectionView *)initSectionViewWithNib:(id)delegat;
- (void)setActionBtnLineWithBtnType:(StoreManageClickType)type;
- (void)updateSectionSubviewsWithData:(MStoreManageModel *)model;


@end
