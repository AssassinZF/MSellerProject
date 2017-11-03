//
//  MStoreInfoModel.h
//  MSeller
//
//  Created by 1yyg on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseModel.h"


#import "MStoreInfoData.h"

#define mRequestGetShopInfoTag 1007     //卖家获取店铺基础信息
#define mRequestEditShopInfoTag 1008    //卖家修改店铺信息
#define mRequestUploadLogoTag   1009    //上传设置店铺Logo


typedef enum : NSInteger {
    MStoreInfoCellTypeStoreName,    //店铺名称
    MStoreInfoCellTypeStoreLogo,    //店铺LOGO
    MStoreInfoCellTypeStoreDesc,    //店铺描述
    MStoreInfoCellTypeStoreImage,   //店招图
    MStoreInfoCellTypeMyOrder,      //我的订单
}MStoreInfoCellType;

@interface MStoreInfoModel : MBaseModel


@property (nonatomic, assign) MStoreInfoCellType type;

@property (nonatomic, copy) NSString *leftTextStr;
@property (nonatomic, copy) NSString *rightTextStr;
@property (nonatomic, copy) NSString *rightImgStr;
@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, strong) MStoreInfoData *infoData;

@end
