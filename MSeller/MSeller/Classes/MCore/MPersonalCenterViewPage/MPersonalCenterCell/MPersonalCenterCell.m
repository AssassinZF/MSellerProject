//
//  MPersonalCenterCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalCenterCell.h"

@interface MPersonalCenterCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation MPersonalCenterCell

+ (CGFloat)getCellHeihgt
{
    return mLayout_Ratio(50);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.font = mLayoutSystemFont(16);
}

- (void)updateCellWith:(NSString *)title imageWith:(UIImage *)image
{
    self.leftImageView.image = image;
    self.titleLabel.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
