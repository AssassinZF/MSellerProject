//
//  MStoreImageViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreImageViewPage.h"

#import "MStoreImageCollectionViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/PHPhotoLibrary.h>
#import "MStoreImageModel.h"
#import "MStoreInfoModel.h"
#import "MStoreInfoData.h"

#define ITEMCOUNT 2


@interface MStoreImageViewPage ()
<UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate,
MBaseControllerDelegate>
{
    MStoreImageModel *imagesModel;
    MStoreInfoData *infoData;
    NSString *uploadImgStr;
    NSString *imgURLStr;
}

@end

@implementation MStoreImageViewPage


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MStoreImageController"];
        imagesModel = [self.controller getModelFromListByName:@"MStoreImageModel"];
    }
    return self;
}


- (void)initWithParam:(NSDictionary *)paramInfo
{
    infoData = [[MStoreInfoData alloc] init];
    infoData = paramInfo[@"infoData"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"店招图";
    
    self.controller.delegate = self;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(mLayout_Ratio(5), mLayout_Ratio(5), mLayout_Ratio(5), mLayout_Ratio(5));
    CGFloat itemWidth = (Screen_Width-mLayout_Ratio(5)*ITEMCOUNT*2)/ITEMCOUNT;
    flowLayout.itemSize = CGSizeMake(itemWidth,itemWidth*0.46);
    self.storeImgTable.collectionViewLayout = flowLayout;
    [self.storeImgTable registerNib:[UINib nibWithNibName:NSStringFromClass([MStoreImageCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[MStoreImageCollectionViewCell getCellIdentifier]];
    
    [self.controller sendMessageID:mRequestGetSignPicsTag messageInfo:nil];
}


#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [imagesModel.storeImgsArray count]+1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MStoreImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MStoreImageCollectionViewCell getCellIdentifier] forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        cell.storePhotoView.hidden = NO;
        cell.storeImgView.hidden = YES;
    }
    else
    {
        cell.storePhotoView.hidden = YES;
        cell.storeImgView.hidden = NO;
        if ([imagesModel.storeImgsArray count] > 0)
        {
            [cell updateStoreImagesWithURL:imagesModel.storeImgsArray[indexPath.row-1]];
        }
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self accessToSystemPhotoAlbum];
    }
    else
    {
        imgURLStr = imagesModel.storeImgsArray[indexPath.row-1];
        uploadImgStr = [imgURLStr stringByReplacingOccurrencesOfString:@"http://devimg.manjd.net/shop/" withString:@""];
        [self.controller sendMessageID:mRequestEditShopInfoTag messageInfo:@{@"modType":[NSNumber numberWithInteger:4],@"content":uploadImgStr}];
    }
}


#pragma mark MBaseControllerDelegate
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    if (errCode == eDataCodeSuccess)
    {
        if (msgid == mRequestGetSignPicsTag)
        {
            [self.storeImgTable reloadData];
        }
        else if (msgid == mRequestEditShopInfoTag)
        {
            if ([imgURLStr length] > 0)
            {
                [self popViewPageAnimated:YES];
                infoData.signpic = uploadImgStr;
                infoData.updateSignPic = imgURLStr;
                infoData.indexRow = 3;
                [[NSNotificationCenter defaultCenter] postNotificationName:MNC_EditStore_Info
                                                                    object:self
                                                                  userInfo:@{MNC_EditStore_Info:infoData}];
            }
        }
    }
    else
    {
        if ([data isKindOfClass:[NSDictionary class]]) {
            [self.view m_makeToast:data[@"message"]];
        }
    }
}


#pragma mark 调起手机系统相册
- (void)accessToSystemPhotoAlbum
{
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0)
    {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用照片" message:@"请在iPhone的\"设置-隐私-照片\"中允许访问照片" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
    }
    else
    {
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if(author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
            //无权限
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无法使用照片" message:@"请在iPhone的\"设置-隐私-照片\"中允许访问照片" delegate:nil  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            return;
        }
    }
    
    UIImagePickerControllerSourceType sourceType;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}


#pragma mark -
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
