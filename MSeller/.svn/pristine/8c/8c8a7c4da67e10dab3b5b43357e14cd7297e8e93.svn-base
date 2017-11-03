//
//  MGoodsTabDetailCell.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsTabDetailCell.h"

@interface MGoodsTabDetailCell ()

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@end

@implementation MGoodsTabDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

+ (CGFloat)getCellHeihgt
{
    return 300;
}

- (void)updateViewCell:(NSString *)imageURL
{
    self.size = CGSizeMake(Screen_Width, 300);
    
    [self.showImageView m_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:mGetImage(mPlaceHolderImage)];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
