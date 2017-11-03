//
//  MGoodsPropertySubCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/28.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsPropertySubCell.h"

@interface MGoodsPropertySubCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation MGoodsPropertySubCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.leftLabel.font = mLayoutSystemFont(13.f);
    self.rightLabel.font = mLayoutSystemFont(13.f);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateViewWithLeft:(NSString *)leftStr rightWith:(NSString *)rightStr
{
    
}



@end
