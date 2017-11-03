//
//  MHomeCateData.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/24.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseObjectData.h"
#import "MHomeBannerData.h"

@interface MHomeCateData : MBaseObjectData

@property (nonatomic, assign) int cateid;   //分类ID
@property (nonatomic, copy) NSString *catename; //分类名称
@property (nonatomic, strong) NSArray *bannerArray; //分类下的轮播图

@end


