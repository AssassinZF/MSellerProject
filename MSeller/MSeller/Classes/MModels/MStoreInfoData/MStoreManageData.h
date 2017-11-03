//
//  MStoreManageData.h
//  MSeller
//
//  Created by 1yyg on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"

@interface MStoreManageData : MBaseObjectData


@property (nonatomic, assign) NSInteger relateid;//店铺商品关联id ,
@property (nonatomic, copy) NSString *spucode;//spu编码 ,
@property (nonatomic, copy) NSString *spuname;//产品名称(spu名) ,
@property (nonatomic, assign) NSInteger producttype;//产品类型，1普通产品 ,
@property (nonatomic, assign) NSInteger brandid;//品牌id ,
@property (nonatomic, assign) NSInteger sortid;//产品分类id,关联产品分类表prodsort ,
@property (nonatomic, copy) NSString *title;//商品标题 ,
@property (nonatomic, copy) NSString *attachtitle;//附加标题 ,
@property (nonatomic, assign) CGFloat skupricemin;//最低sku价格 ,
@property (nonatomic, assign) CGFloat maxstoreincome;//最大预估店主收益 ,
@property (nonatomic, copy) NSString *unitcname;//计量单位中文名 ,
@property (nonatomic, copy) NSString *unitename;//计量单位英文名 ,
@property (nonatomic, copy) NSString *spulargerpic;// SPU大图 ,
@property (nonatomic, copy) NSString *spuwhitepic;//SPU白底图 ,
@property (nonatomic, assign) NSInteger skustockqty;//库存量 ,
@property (nonatomic, assign) NSInteger spuid;//spuid


@end
