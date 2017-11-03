//
//  MHomeCateData.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MHomeCateData.h"

@implementation MHomeCateData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bannerArray":[MHomeBannerData class]};
}

@end
