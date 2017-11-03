//
//  MGoodsShareModel.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGoodsShareModel : NSObject

@property (nonatomic, copy) NSString *shareProfit;//收益
@property (nonatomic, copy) NSString *shareContent;  //分享内容
@property (nonatomic, copy) NSString *shareUrl;//分享URL
@property (nonatomic, strong) NSArray *shareImages;//分享图片

@end
