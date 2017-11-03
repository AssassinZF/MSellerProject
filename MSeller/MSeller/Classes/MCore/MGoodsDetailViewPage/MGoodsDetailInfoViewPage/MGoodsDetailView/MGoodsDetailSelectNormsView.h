//
//  MGoodsDetailSelectNormsView.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGoodsDetailData.h"
#import "MGoodsDetailPropertyData.h"

@interface MGoodsDetailSelectNormsView : UIView

- (void)updataViewWith:(MGoodsDetailData *)detailData propertyWith:(MGoodsDetailPropertyData *)propertyData;

- (void)showNormsView;

@end
