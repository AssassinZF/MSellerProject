//
//  MDragCellTableView.h
//  MSeller
//
//  Created by 1yyg on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MDragCellTableView;
@protocol MDragCellTableViewDataSource <UITableViewDataSource>

@required
/**将外部数据源数组传入，以便在移动cell数据发生改变时进行修改重排*/
- (NSArray *)originalArrayDataForTableView:(MDragCellTableView *)tableView;

@end

@protocol MDragCellTableViewDelegate <UITableViewDelegate>

@required
/**将修改重排后的数组传入，以便外部更新数据源*/
- (void)tableView:(MDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
@optional
/**选中的cell准备好可以移动的时候*/
- (void)tableView:(MDragCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**选中的cell正在移动，变换位置，手势尚未松开*/
- (void)cellIsMovingInTableView:(MDragCellTableView *)tableView;
/**选中的cell完成移动，手势已松开*/
- (void)cellDidEndMovingInTableView:(MDragCellTableView *)tableView;

@end


@interface MDragCellTableView : UITableView



@property(nonatomic,assign)BOOL allowDrage;//允许拖动
@property (nonatomic, assign) id<MDragCellTableViewDataSource> dataSource;
@property (nonatomic, assign) id<MDragCellTableViewDelegate> delegate;


@end
