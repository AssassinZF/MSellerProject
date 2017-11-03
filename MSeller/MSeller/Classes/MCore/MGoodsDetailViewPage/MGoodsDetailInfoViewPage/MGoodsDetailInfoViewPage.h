//
//  MGoodsDetailInfoViewPage.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseViewCtr.h"

@interface MGoodsDetailInfoViewPage : MBaseViewCtr

@property (nonatomic, assign) int spuid;
@property (nonatomic, copy) NSString *spucode;

- (void)setRightBtn:(UIButton *)rightBtn;

- (void)shareGoodsDetailInfo;

@end