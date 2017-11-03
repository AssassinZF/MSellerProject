//
//  MStoreInfoViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/10/26.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreInfoViewPage.h"

#import "MStoreInfoModel.h"
#import "MStoreInfoTableViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/PHPhotoLibrary.h>
#import "MStoreInfoData.h"


@interface MStoreInfoViewPage ()
<MBaseControllerDelegate, UITableViewDelegate,
UITableViewDataSource,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UIActionSheetDelegate>
{
    MStoreInfoModel *infoModel;
    MStoreInfoData *infoData;
    NSMutableArray *storeInfoArray;
    NSMutableArray *_imageArray;//上传图片数组
    
}

@end

@implementation MStoreInfoViewPage


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MStoreInfoController"];
        infoModel = [self.controller getModelFromListByName:@"MStoreInfoModel"];
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
    
    self.title = @"店铺信息";
    
    self.controller.delegate = self;
    
    [self.storeInfoTable registerNib:[UINib nibWithNibName:NSStringFromClass([MStoreInfoTableViewCell class]) bundle:nil] forCellReuseIdentifier:[MStoreInfoTableViewCell getCellIdentifier]];
    self.storeInfoTable.tableFooterView = [UIView new];
    
    [self initData];
    [self.storeInfoTable reloadData];
}


#pragma mark 初始化本地数据
- (void)initData
{
    storeInfoArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    MStoreInfoModel *model0 = [[MStoreInfoModel alloc] init];
    model0.type = MStoreInfoCellTypeStoreName;
    model0.leftTextStr = @"店铺名称";
    model0.rowHeight = mLayout_Ratio(50);
    [storeInfoArray addObject:model0];
    
    MStoreInfoModel *model1 = [[MStoreInfoModel alloc] init];
    model1.type = MStoreInfoCellTypeStoreLogo;
    model1.leftTextStr = @"店铺Logo";
    model1.rowHeight = mLayout_Ratio(73);
    [storeInfoArray addObject:model1];
    
    MStoreInfoModel *model2 = [[MStoreInfoModel alloc] init];
    model2.type = MStoreInfoCellTypeStoreDesc;
    model2.leftTextStr = @"店铺描述";
    model2.rowHeight = mLayout_Ratio(50);
    [storeInfoArray addObject:model2];
    
    MStoreInfoModel *model3 = [[MStoreInfoModel alloc] init];
    model3.type = MStoreInfoCellTypeStoreImage;
    model3.leftTextStr = @"店招图";
    model3.rowHeight = mLayout_Ratio(90);
    [storeInfoArray addObject:model3];
    
    if (infoData)
    {
        model0.rightTextStr = infoData.storename;
        if ([model0.rightTextStr length] == 0)
        {
            model0.rightTextStr = @"";
        }
        
        model1.rightImgStr = infoData.logopic;
        
        model2.rightTextStr = @"";
        if ([model2.rightTextStr length] == 0)
        {
            model2.rightTextStr = @"";
        }
        model3.rightTextStr = infoData.signpic;
    }
}



#pragma mark -
#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return storeInfoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MStoreInfoModel *model = storeInfoArray[indexPath.row];
    return model.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MStoreInfoModel *model = storeInfoArray[indexPath.row];
    
    MStoreInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MStoreInfoTableViewCell getCellIdentifier]];
    [cell updateSubviewsPropertyWithModel:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MStoreInfoModel *model = storeInfoArray[indexPath.row];
    if (model.type == MStoreInfoCellTypeStoreName)
    {
        [self pushPageWithName:@"MStoreNameViewPage" animation:YES withParams:@{@"infoData":infoData}];
    }
    else if (model.type == MStoreInfoCellTypeStoreLogo)
    {
        UIActionSheet *avatarActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
        [avatarActionSheet showInView:self.view];
    }
    else if (model.type == MStoreInfoCellTypeStoreDesc)
    {
        [self pushPageWithName:@"MStoreDescViewPage" animation:YES withParams:@{@"infoData":infoData}];
    }
    else if (model.type == MStoreInfoCellTypeStoreImage)
    {
        [self pushPageWithName:@"MStoreImageViewPage" animation:YES withParams:@{@"infoData":infoData}];
    }
}


#pragma mark -
#pragma mark - UIActionSheetDelegate
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    int cnt = 0;
    for (UIView *subView in actionSheet.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)subView;
            cnt++;
            if (cnt < 4) {
                [button setTitleColor:MC_Gray_Color forState:UIControlStateNormal];
            }else{
                [button setTitleColor:MC_Gray_Color forState:UIControlStateNormal];
            }
        }
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex < 2)
    {
        if (buttonIndex == 0)   //相机
        {
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
            {
                //无权限
                if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0)
                {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:okAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机" delegate:nil  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                }
                return;
            }
        }
        else if (buttonIndex == 1) //相册
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
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && buttonIndex == 0) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] && buttonIndex == 1) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [self presentViewController:imagePickerController animated:YES completion:NULL];
            
        } else {
            if (buttonIndex > 1) {
                return;
            }
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] && buttonIndex == 1){
                imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [self presentViewController:imagePickerController animated:YES completion:NULL];
        }
    }
}


#pragma mark -
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        //_iconImageView.image = image;
        [self sendUserAvatarToServer:image];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark 上传图片到服务器
- (void)sendUserAvatarToServer:(UIImage *)photo
{
    [self.controller sendMessageID:mRequestUploadLogoTag messageInfo:@{@"logoImg":photo}];
}



#pragma mark MBaseControllerDelegate
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    if (errCode == eDataCodeSuccess)
    {
        infoData = [MStoreInfoData yy_modelWithJSON:data];
        infoData.descriptionStr = data[@"description"];
        infoModel.infoData = infoData;
        [self.storeInfoTable reloadData];
    }
    else
    {
        if ([data isKindOfClass:[NSDictionary class]]) {
            [self.view m_makeToast:data[@"message"]];
        }
    }
}


- (void)getStoreInfo:(NSNotification *)notify
{
    infoData = [notify.userInfo objectForKey:MNC_EditStore_Info];
    [self initData];
    [self.storeInfoTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:infoData.indexRow inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getStoreInfo:)
                                                 name:MNC_EditStore_Info
                                               object:nil];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
