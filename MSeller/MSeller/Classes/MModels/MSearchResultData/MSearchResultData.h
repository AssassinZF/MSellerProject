//
//  MSearchResultData.h
//  MSeller
//
//  Created by 1yyg on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"

@interface MSearchResultData : MBaseObjectData

@property (nonatomic, assign) int spuid;//商品ID
@property (nonatomic, copy) NSString *spucode;//商品spu code
@property (nonatomic, assign) int cateid;//商品分类ID
@property (nonatomic, copy) NSString *goodsname;//商品名称
@property (nonatomic, copy) NSString *goodsdescript;//商品描述
@property (nonatomic, assign) CGFloat goodsprice;//商品价格
@property (nonatomic, assign) CGFloat goodsprofit;//商品收益
@property (nonatomic, copy) NSString *goodspictureurl;//商品图片地址
@property (nonatomic, copy) NSString *goodsdetaillink;//商品链接地址
@property (nonatomic, assign) int issoldout;  //是否抢光   0为抢光   1抢光
@property (nonatomic, assign) int ischoiceness; //是否添加推荐
@property (nonatomic, assign) int isattention; //是否添加关注




@end