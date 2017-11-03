//
//  MHomeModel.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseModel.h"
#import "MHomeCateData.h"
#import "MHomeCateListData.h"

#define mRequestGetCateTag          100     //获取分类
#define mRequestGetListTag          110     //列表刷新
#define mRequestGetListMoreTag      120     //列表加载更多
#define mRequestAddLikeTag          130     //添加关注
#define mRequestRecommTag           140     //添加推荐

@interface MHomeModel : MBaseModel

@property (nonatomic, strong) NSMutableArray *cateArray;
@property (nonatomic, strong) NSMutableArray *cateListArray;

/**
 清除列表数据
 */
- (void)deleteCateListData;

@end
