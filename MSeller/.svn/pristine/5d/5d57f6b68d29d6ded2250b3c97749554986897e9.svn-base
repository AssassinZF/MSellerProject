//
//  MHomeViewCell.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseTableViewCell.h"
#import "MHomeCateListData.h"

typedef enum : NSUInteger {
    HomeCell_Type_Heart,
    HomeCell_Type_Add,
    HomeCell_Type_Share,
} HomeCell_Type;

@protocol MHomeViewCellDelegate <NSObject>

- (void)home_cellSelectItemAtIndex:(NSInteger)index type:(HomeCell_Type)type;

@end

@interface MHomeViewCell : MBaseTableViewCell

@property (nonatomic, weak) id <MHomeViewCellDelegate> delegate;

+ (CGFloat)getHomeCellHeight:(MHomeCateListData *)data;

- (void)updateHomeCellWith:(MHomeCateListData *)data index:(NSInteger)index;

@end
