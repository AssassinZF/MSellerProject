//
//  MGoodsDetailPropertyCell.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseTableViewCell.h"

@interface MGoodsDetailPropertyCell : MBaseTableViewCell

+ (CGFloat)getPropertyCellHeight:(NSArray *)propertys;

- (void)updateViewWith:(NSArray *)propertys;

@end
