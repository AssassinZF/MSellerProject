//
//  MStoreManageModel.h
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseModel.h"


#define mRequestChoicenessListTag           1009     //获取精选列表
#define mRequestAttentionListTag            1010     //获取关注列表
#define mRequestEditGoodsStatusTag          1011     //修改店铺商品状态

typedef enum {
    MStoreManageRequestTypeAddAttention = 1,     //添加关注
    MStoreManageRequestTypeAddRecommend = 2,     //添加推荐
    MStoreManageRequestTypeCancelAttention = 3,  //取消关注
    MStoreManageRequestTypeCancelRecommend = 4,  //取消推荐
}MStoreManageRequestType;


@interface MStoreManageModel : MBaseModel



@property (nonatomic, strong) NSMutableArray *choicenessListArray;
@property (nonatomic, strong) NSMutableArray *attentionListArray;


@property (nonatomic, assign) BOOL isChoiceness;//是否为精选选项
@property (nonatomic, assign) BOOL isSort;//是否点击排序按钮
@property (nonatomic, assign) NSInteger listNum;//列表数量


/**
 清除列表数据
 */
- (void)deleteManageListData;


@end