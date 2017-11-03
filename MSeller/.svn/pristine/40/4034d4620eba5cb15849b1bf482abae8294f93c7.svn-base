//
//  MPersonalSetCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalSetCell.h"

@interface MPersonalSetCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

@implementation MPersonalSetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.font = mLayoutSystemFont(14.f);
    self.subLabel.font = mLayoutSystemFont(13.f);
}

- (void)updateViewWith:(NSString *)titleStr subWith:(NSString *)subStr
{
    self.titleLabel.text = titleStr;
    self.subLabel.text = subStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
