//
//  MGoodsDetailData.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"

@interface MGoodsDetailData : MBaseObjectData

@property (nonatomic, assign) int spuid;
@property (nonatomic, copy) NSString *spucode; //spu编码
@property (nonatomic, copy) NSString *spuname; //产品名称(spu名)
@property (nonatomic, assign) int sortid; //产品分类id,关联产品分类表prodsort
@property (nonatomic, assign) CGFloat skupricemin; //最低sku价格
@property (nonatomic, assign) CGFloat minstoreincome; //最小预估店主收益
@property (nonatomic, assign) CGFloat maxstoreincome; //最大预估店主收益
@property (nonatomic, copy) NSString *title; //商品标题
@property (nonatomic, copy) NSString *attachtitle; //附加标题
@property (nonatomic, copy) NSString *prefix; //标题前缀
@property (nonatomic, copy) NSString *tradrulepic; //购买须知图片名(交易规则须知)
@property (nonatomic, strong) NSArray *intro; //详情介绍
@property (nonatomic, copy) NSString *specinfo; //规格参数信息
@property (nonatomic, strong) NSArray *spupic; //spu图片信息
@property (nonatomic, assign) int issoldout;  //是否抢光   0为抢光   1抢光
@property (nonatomic, assign) int ischoiceness; //是否添加推荐
@property (nonatomic, assign) int isattention; //是否添加关注

@end
