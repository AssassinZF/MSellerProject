//
//  MGoodsDetailInfoModel.h
//  MSeller
//
//  Created by TreeWrite on 2017/11/1.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseModel.h"
#import "MGoodsDetailData.h"
#import "MGoodsDetailPropertyData.h"

#define mRequestDetailInfoTag           1002    //获取商品详情
#define mRequestDetailPropertyTag       1005    //获取规格属性
#define mRequestDetailLikeTag           1020    //添加关注
#define mRequestDetailRecommTag         1030    //添加推荐

@interface MGoodsDetailInfoModel : MBaseModel

@property (nonatomic, strong) MGoodsDetailData *detailData;
@property (nonatomic, strong) MGoodsDetailPropertyData *propertyData;

@end
