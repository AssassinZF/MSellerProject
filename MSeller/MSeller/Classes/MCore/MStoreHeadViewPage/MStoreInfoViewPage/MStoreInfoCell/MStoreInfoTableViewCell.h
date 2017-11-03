//
//  MStoreInfoTableViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MStoreInfoModel.h"
#import "MStoreInfoData.h"

@interface MStoreInfoTableViewCell : MBaseTableViewCell


@property (nonatomic, weak) IBOutlet UILabel *leftTextLB;

@property (nonatomic, weak) IBOutlet UILabel *rightTextLB;

@property (nonatomic, weak) IBOutlet UIImageView *storeLogoImgView;

@property (nonatomic, weak) IBOutlet UIImageView *storeImageView;


- (void)updateSubviewsPropertyWithModel:(MStoreInfoModel *)model;


@end
