//
//  MGoodsDetailPropertyCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailPropertyCell.h"
#import "MGoodsPropertySubCell.h"
#import "MGoodsPropertySubTitleCell.h"

@interface MGoodsDetailPropertyCell () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_propertys;
}

@property (weak, nonatomic) IBOutlet UITableView *pTableView;

@end

@implementation MGoodsDetailPropertyCell

+ (CGFloat)getPropertyCellHeight:(NSArray *)propertys
{
    return mLayout_Ratio(40)+propertys.count*mLayout_Ratio(35);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.pTableView.delegate = self;
    self.pTableView.dataSource = self;
    [self.pTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MGoodsPropertySubCell class]) bundle:nil] forCellReuseIdentifier:[MGoodsPropertySubCell getCellIdentifier]];
    [self.pTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MGoodsPropertySubTitleCell class]) bundle:nil] forCellReuseIdentifier:[MGoodsPropertySubTitleCell getCellIdentifier]];
}

- (void)updateViewWith:(NSArray *)propertys
{
    _propertys = propertys;
    
    self.frame = CGRectMake(0, 0, Screen_Width, mLayout_Ratio(40)+propertys.count*mLayout_Ratio(35));

    self.pTableView.frame = CGRectMake(mLayout_Ratio(12), mLayout_Ratio(20), Screen_Width-mLayout_Ratio(24), self.height-mLayout_Ratio(40));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -
#pragma mark -  UITableViewDelegate、UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _propertys.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mLayout_Ratio(35);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MGoodsPropertySubTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsPropertySubTitleCell getCellIdentifier]];
        return cell;
    }
    MGoodsPropertySubCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsPropertySubCell getCellIdentifier]];
    return cell;
}



@end
