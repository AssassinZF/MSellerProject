//
//  MStoreImageCollectionViewCell.h
//  MSeller
//
//  Created by 1yyg on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MStoreImageCollectionViewCell : UICollectionViewCell


@property (nonatomic, weak) IBOutlet UIImageView *storeImgView;

@property (nonatomic, weak) IBOutlet UIView *storePhotoView;

@property (nonatomic, weak) IBOutlet UIImageView *selectPhotoImgView;

@property (nonatomic, weak) IBOutlet UILabel *selectPhotoLB;



+ (NSString *)getCellIdentifier;

- (void)updateStoreImagesWithURL:(NSString *)url;


@end