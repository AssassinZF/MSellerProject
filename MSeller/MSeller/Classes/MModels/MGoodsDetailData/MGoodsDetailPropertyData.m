//
//  MGoodsDetailPropertyData.m
//  MSeller
//
//  Created by TreeWrite on 2017/11/1.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailPropertyData.h"

@implementation MGoodsDetailPropertyData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"skuattrname" : [MGoodsSKUNameData class],
             @"skuinfo" : [MGoodsSkuinfoData class]};
}

@end

@implementation MGoodsSkuinfoData



@end

@implementation MGoodsTempletData



@end

@implementation MGoodsSKUNameData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"templetvalue" : [MGoodsTempletData class]};
}

@end

/*
{
    "message": "",
    "data": {
        "skuattrname": [
                        {
                            "templetname": "颜色",
                            "ranknum": 1,
                            "templetvalue": [
                                             {
                                                 "attrname": "黑色K版",
                                                 "attrskucode": [
                                                                 "SK00000000004",
                                                                 "SK00000000005"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "金色",
                                                 "attrskucode": [
                                                                 "SK00000000007"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "玫瑰金色",
                                                 "attrskucode": [
                                                                 "SK00000000001",
                                                                 "SK00000000002",
                                                                 "SK00000000003"
                                                                 ]
                                             }
                                             ]
                        },
                        {
                            "templetname": "内存",
                            "ranknum": 2,
                            "templetvalue": [
                                             {
                                                 "attrname": "4G+128G",
                                                 "attrskucode": [
                                                                 "SK00000000005",
                                                                 "SK00000000007"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "4G+256G",
                                                 "attrskucode": [
                                                                 "SK00000000001"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "4G+64G",
                                                 "attrskucode": [
                                                                 "SK00000000002",
                                                                 "SK00000000003",
                                                                 "SK00000000004"
                                                                 ]
                                             }
                                             ]
                        },
                        {
                            "templetname": "版本",
                            "ranknum": 3,
                            "templetvalue": [
                                             {
                                                 "attrname": "11.11预约版",
                                                 "attrskucode": [
                                                                 "SK00000000003"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "标准版",
                                                 "attrskucode": [
                                                                 "SK00000000001",
                                                                 "SK00000000004",
                                                                 "SK00000000007"
                                                                 ]
                                             },
                                             {
                                                 "attrname": "超值套装",
                                                 "attrskucode": [
                                                                 "SK00000000002",
                                                                 "SK00000000005"
                                                                 ]
                                             }
                                             ]
                        }
                        ],
        "skuinfo": [
                    {
                        "skuid": 36,
                        "skucode": "SK00000000001",
                        "spucode": "SP0010000008",
                        "saleprice": 3000,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 37,
                        "skucode": "SK00000000002",
                        "spucode": "SP0010000008",
                        "saleprice": 3100,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 38,
                        "skucode": "SK00000000003",
                        "spucode": "SP0010000008",
                        "saleprice": 2999,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 39,
                        "skucode": "SK00000000004",
                        "spucode": "SP0010000008",
                        "saleprice": 2999,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 40,
                        "skucode": "SK00000000005",
                        "spucode": "SP0010000008",
                        "saleprice": 3199,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 41,
                        "skucode": "SK00000000006",
                        "spucode": "SP0010000008",
                        "saleprice": 2899,
                        "storeincome": 200,
                        "skupic": ""
                    },
                    {
                        "skuid": 42,
                        "skucode": "SK00000000007",
                        "spucode": "SP0010000008",
                        "saleprice": 2999,
                        "storeincome": 200,
                        "skupic": ""
                    }
                    ]
    },
    "code": 1
}
*/


