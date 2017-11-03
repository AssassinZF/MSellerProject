//
//  MSearchTableViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MSearchResultData.h"


typedef enum : NSUInteger {
    SearchCell_Type_Heart,
    SearchCell_Type_Add,
    SearchCell_Type_Share,
} SearchCell_Type;


@protocol MSearchResultTableViewCellDelegate <NSObject>

- (void)clickSearchCellBtnActionWithType:(SearchCell_Type)type index:(NSInteger)index;

@end


@interface MSearchResultTableViewCell : MBaseTableViewCell


//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *goodsImgView;
//商品名称
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLB;
//商品价格
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLB;
//喜欢按钮
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
//添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
//分享按钮
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@property (weak, nonatomic) id<MSearchResultTableViewCellDelegate> delegate;


- (void)updateSearchResultCellWithData:(MSearchResultData *)data index:(NSInteger)index;


@end
