//
//  MPersonalSetViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/11/2.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPersonalSetViewPage.h"
#import "MPersonalSetCell.h"

@interface MPersonalSetViewPage () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *setTableView;

@end

@implementation MPersonalSetViewPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = mLocalizedString(@"mPersonal_Set");
    
    [self.setTableView registerNib:[UINib nibWithNibName:[MPersonalSetCell getCellIdentifier] bundle:nil] forCellReuseIdentifier:[MPersonalSetCell getCellIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark -  UITableViewDelegate、UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 1;
    }else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return mLayout_Ratio(10);
    }else if (section == 2){
        return mLayout_Ratio(10);
    }else{
        return mLayout_Ratio(10);
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, mLayout_Ratio(10))];
    view.backgroundColor = MC_BGGray_Color;
    
    if (section == 0) {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }else if (section == 1){
        return view;
    }else if (section == 2){
        return view;
    }else{
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return mLayout_Ratio(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MPersonalSetCell *cell = [tableView dequeueReusableCellWithIdentifier:[MPersonalSetCell getCellIdentifier]];
   
    if (indexPath.section == 0) {
        if (indexPath.row) {
            [cell updateViewWith:mLocalizedString(@"mPersonal_Set_UserInfo") subWith:nil];
        }else{
            [cell updateViewWith:mLocalizedString(@"mPersonal_Set_Security") subWith:nil];
        }
    }else if (indexPath.section == 1){
        [cell updateViewWith:mLocalizedString(@"mPersonal_Set_CleanCache") subWith:[NSString stringWithFormat:@"%.2fMB",[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0]];
    }else{
        if (indexPath.row) {
            [cell updateViewWith:mLocalizedString(@"mPersonal_Set_Help") subWith:nil];
        }else{
            [cell updateViewWith:mLocalizedString(@"mPersonal_Set_About") subWith:nil];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        if (indexPath.row) {
            //个人资料
        }else{
            //账号与安全
        }
    }else if (indexPath.section == 1){
        //清理缓存 [[SDImageCache sharedImageCache] getSize]/1024.0/1024.0];
        if ([[SDImageCache sharedImageCache] getSize]/1024.0/1024.0 > 0) {
            MTIPSAlertView *mAlertView = [[MTIPSAlertView alloc] initWithTitle:nil message:mLocalizedString(@"mPersonal_Set_Cache_Content") sureBtn:mLocalizedString(@"mAlert_Confirm") cancleBtn:mLocalizedString(@"mAlert_Cancel") ];
            mAlertView.resultIndex = ^(NSInteger index){
                //回调---处理一系列动作
                [self cleanCache];
            };
            [mAlertView showMAlertView];
        }
    }else{
        if (indexPath.row) {
            //帮助与反馈
        }else{
            //关于满金店
        }
    }
    
}

- (void)cleanCache
{
    [MDiyHudView showDiyHudWithTitleWith:nil superViewWith:self.view];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] clearMemory];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [MDiyHudView removeHudWith:self.view];
            [self.view m_makeToast:mLocalizedString(@"mAlert_Personal_Clean_Cache") duration:1.5];
            [self.setTableView reloadData];
        });
        
    });
}

@end
