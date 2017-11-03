//
//  MStoreImageCollectionViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreImageCollectionViewCell.h"

@implementation MStoreImageCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    CGFloat itemWidth = (Screen_Width-mLayout_Ratio(5)*2*2)/2;
    self.size = CGSizeMake(itemWidth, itemWidth*0.46);
    
    self.storeImgView.frame = CGRectMake(0, 0, self.width, self.height);
    
    self.storePhotoView.frame = self.storeImgView.frame;
    self.selectPhotoImgView.frame = CGRectMake((self.storePhotoView.width-(mLayout_Ratio(17)+mLayout_Ratio(8)+mLayout_Ratio(85)))/2, (self.storePhotoView.height-mLayout_Ratio(17))/2, mLayout_Ratio(17), mLayout_Ratio(17));
    self.selectPhotoLB.frame = CGRectMake(self.selectPhotoImgView.right+mLayout_Ratio(8), 0, mLayout_Ratio(85), self.height);
    self.selectPhotoLB.font = [MUtilities setFontSizeWith:14];
}


+ (NSString *)getCellIdentifier
{
    return NSStringFromClass([self class]);
}


- (void)updateStoreImagesWithURL:(NSString *)url
{
    [self.storeImgView m_setImageWithURL:[NSURL URLWithString:url] placeholderImage:mGetImage(mUserLogoImage)];
}


@end
