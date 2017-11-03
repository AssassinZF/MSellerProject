//
//  MGoodsDetailPropertyData.h
//  MSeller
//
//  Created by TreeWrite on 2017/11/1.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"

@class MGoodsSKUNameData;
@class MGoodsTempletData;
@class MGoodsSkuinfoData;

@interface MGoodsDetailPropertyData : MBaseObjectData

@property (nonatomic, strong) NSArray *skuattrname;
@property (nonatomic, strong) NSArray *skuinfo;

@end

@interface MGoodsSKUNameData : MBaseObjectData

@property (nonatomic, copy) NSString *templetname;
@property (nonatomic, strong) NSArray *templetvalue;

@end

@interface MGoodsTempletData : MBaseObjectData

@property (nonatomic, copy) NSString *attrname;
@property (nonatomic, strong) NSArray *attrskucode;

@end

@interface MGoodsSkuinfoData : MBaseObjectData

@property (nonatomic, copy) NSString *skuid;
@property (nonatomic, copy) NSString *skucode;
@property (nonatomic, copy) NSString *spucode;
@property (nonatomic, copy) NSString *skupic;
@property (nonatomic, assign) CGFloat saleprice;
@property (nonatomic, assign) CGFloat storeincome;

@end

