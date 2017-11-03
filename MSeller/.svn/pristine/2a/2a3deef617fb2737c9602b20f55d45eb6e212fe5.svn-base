//
//  MGoodsDetailInfoViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailInfoViewPage.h"
#import "MGoodsDetailHeadView.h"
#import "MGoodsTabDetailCell.h"
#import "MGoodsDetailPropertyCell.h"
#import "MGoodsDetailTabView.h"
#import "MGoodsDetailPropertyView.h"
#import "MGoodsDetailShareView.h"
#import "MShareAlertView.h"
#import "MPhotoBrowser.h"
#import "MGoodsDetailSelectNormsView.h"
#import "MGoodsDetailInfoModel.h"

@interface MGoodsDetailInfoViewPage () <UITableViewDelegate, UITableViewDataSource, MGoodsDetailPropertyViewDelegate, MGoodsDetailHeadViewDelegate>
{
    UIButton *_rightBtn;
    
    MGoodsDetailHeadView *_headView;
    MGoodsDetailTabView *_selectedTabView;              //选择类型section
    MGoodsDetailPropertyView *_selectedPropertyView;    //规格section
    MGoodsDetailShareView *_detailShareView;            //分享section
    MGoodsDetailSelectNormsView *_propertAlertView; //选择规格弹窗
    NSInteger _selectedTab;  //0商品详情   1规格参数   2购买须知

    NSArray *_imagesURLStrings;
    
    MGoodsDetailInfoModel *_detailModel;
}

@property (weak, nonatomic) IBOutlet UITableView *dTableView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *toCarBtn;
@property (weak, nonatomic) IBOutlet UIButton *purchaseBtn;
@property (weak, nonatomic) IBOutlet UIButton *recommendBtn;
@property (weak, nonatomic) IBOutlet UILabel *lootAllLabel;

@end

@implementation MGoodsDetailInfoViewPage

- (void)dealloc
{
    _dTableView.delegate = nil;
    _dTableView.dataSource = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MGoodsDetailInfoController"];
        _detailModel = [self.controller getModelFromListByName:@"MGoodsDetailInfoModel"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _selectedTab = 0;

    _imagesURLStrings = @[
                          @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=22528817,1858323476&fm=27&gp=0.jpg",
                          @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=725515905,2472463078&fm=27&gp=0.jpg",
                          @"http://img4.imgtn.bdimg.com/it/u=1254822470,3648184938&fm=200&gp=0.jpg",
                          @"http://dimg09.c-ctrip.com/images/100i070000002enz8ED0A_C_671_10000_Q90.jpg"
                          ];
        
    [self registerTableViewCell];
    
    self.bottomView.layer.shadowOpacity = 0.5;// 阴影透明度
    self.bottomView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.bottomView.layer.shadowRadius = 3;// 阴影扩散的范围控制
    self.bottomView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    self.bottomView.hidden = YES;
    
    [self requestDetailInfoData];
    [self requestDetailPropertyData];

}

- (void)setRightBtn:(UIButton *)rightBtn
{
    _rightBtn = rightBtn;
    _rightBtn.hidden = YES;
}

/**
 cell注册
 */
- (void)registerTableViewCell
{
    [self.dTableView registerNib:[UINib nibWithNibName:[MGoodsTabDetailCell getCellIdentifier] bundle:nil] forCellReuseIdentifier:[MGoodsTabDetailCell getCellIdentifier]];
    
    [self.dTableView registerNib:[UINib nibWithNibName:[MGoodsDetailPropertyCell getCellIdentifier] bundle:nil] forCellReuseIdentifier:[MGoodsDetailPropertyCell getCellIdentifier]];
}

/**
 右侧分享按钮响应
 */
- (void)shareGoodsDetailInfo
{
    MGoodsShareModel *model = [[MGoodsShareModel alloc] init];
    model.shareProfit = [NSString stringWithFormat:@"2.00"];
#warning 数据正常返回时替换掉
    model.shareUrl = STR_IS_NULL(@"http://www.baidu.com");
    [MShareAlertView showShareAlertViewWith:MAppDelegateObj.window delegate:self data:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - 网络请求

//获取商品详情
- (void)requestDetailInfoData
{
    [MDiyHudView showDiyHudWithTitleWith:nil superViewWith:self.view];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:[NSString stringWithFormat:@"%d", self.spuid] forKey:@"spuid"];
    [self.controller sendMessageID:mRequestDetailInfoTag messageInfo:dic];
}

//获取规格属性
- (void)requestDetailPropertyData
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:self.spucode forKey:@"spucode"];
    [self.controller sendMessageID:mRequestDetailPropertyTag messageInfo:dic];
}

//添加关注
- (void)requestDetailLikeData
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
//    [dic setObject:[NSString stringWithFormat:@"%d", data.spuid] forKey:@"spuid"];
//    [dic setObject:@"0" forKey:@"status"];
    [self.controller sendMessageID:mRequestDetailLikeTag messageInfo:dic];
}

//添加推荐
- (void)requestDetailRecommData
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
//    [dic setObject:[NSString stringWithFormat:@"%d", data.spuid] forKey:@"spuid"];
//    [dic setObject:@"1" forKey:@"status"];
    [self.controller sendMessageID:mRequestDetailRecommTag messageInfo:dic];
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
#pragma mark - MShareAlertViewDelegate

/**
 分享按钮响应回调
 
 @param type 类型
 */
- (void)share_selectedWithType:(Share_Selected_Type)type data:(MGoodsShareModel *)shareData
{
    [[MShareSDKManger sharedMShareSDKManger] shareActionType:type vc:self data:shareData];
}

#pragma mark -
#pragma mark - MGoodsDetailHeadViewDelegate
- (void)goodsDetailHeadSelectItemAtIndex:(NSInteger)index
{
    MPhotoBrowser *photoView = [[MPhotoBrowser alloc] init];
    photoView.urlImgArr = _imagesURLStrings;
    photoView.indexTag = index;
    [photoView show];
}

#pragma mark -
#pragma mark -  MGoodsDetailPropertyViewDelegate

/**
 点击规格回调
 */
- (void)goodsDetailChangeProperty
{
    [_propertAlertView showNormsView];;
}

#pragma mark -
#pragma mark -  MGoodsDetailTabViewDelegate

/**
 选择TAB
 
 @param type MGoodsDetail_Tab_Change_Type
 */
- (void)goodsDetailTabChange:(MGoodsDetail_Tab_Change_Type)type
{
    if (type == MTab_Type_Detail) {
        _selectedTab = 0;
    }else if (type == MTab_Type_Property){
        _selectedTab = 1;
    }else{
        _selectedTab = 2;
    }
    
    [self.dTableView reloadData];
}


#pragma mark -
#pragma mark -  UITableViewDelegate、UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_detailModel.detailData) {
        return 3;
    }else{
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else if (section == 1) {
        return 0;
    }else{
        if (_selectedTab == 0) {
            //详情
            return _detailModel.detailData.intro.count;
        }else if (_selectedTab == 1){
            //属性
            return 1;
        }else{
            //说明
            return 1;
        }
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        if (!_detailShareView) {
            _detailShareView = [MGoodsDetailShareView initWith:self];
        }
        return _detailShareView;
    }else if (section == 1) {
        if (!_selectedPropertyView) {
            _selectedPropertyView = [MGoodsDetailPropertyView initWith:self];
        }
        return _selectedPropertyView;
    }else{
        if (!_selectedTabView) {
            _selectedTabView = [MGoodsDetailTabView initWith:self];
        }
        return _selectedTabView ;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [MGoodsDetailShareView getGoodsDetailShareViewHeight];
    }else if (section == 1) {
        return [MGoodsDetailPropertyView getGoodsDetailPropertyViewHeight];
    }else{
        return [MGoodsDetailTabView getGoodsDetailTabViewHeight];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedTab == 0) {
        //详情
        return [MGoodsTabDetailCell getCellHeihgt];
    }else if (_selectedTab == 1){
        //属性
        return [MGoodsDetailPropertyCell getPropertyCellHeight:@[@"1",@"1",@"1"]];
    }else{
        //说明
        return [MGoodsTabDetailCell getCellHeihgt];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedTab == 0) {
        //详情
        MGoodsTabDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsTabDetailCell getCellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell updateViewCell:[_imagesURLStrings objectAtIndex:indexPath.row]];
        return cell;
    }else if (_selectedTab == 1){
        //属性
        MGoodsDetailPropertyCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsDetailPropertyCell getCellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell updateViewWith:@[@"1",@"1",@"1"]];
        return cell;
    }else{
        //说明
        MGoodsTabDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsTabDetailCell getCellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell updateViewCell:[_imagesURLStrings objectAtIndex:indexPath.row]];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark -
#pragma mark - 网络请求返回
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    [MDiyHudView removeHudWith:self.view];
    [MPromptView remove_promptAlertViewWith:self.view];
    [self.dTableView.mj_header endRefreshing];
    [self.dTableView.mj_footer endRefreshing];
    
    switch (errCode) {
        case eDataCodeSuccess:
        {
            if (msgid == mRequestDetailInfoTag) {
                self.bottomView.hidden = NO;
                _rightBtn.hidden = NO;
                
                if (!_headView) {
                    _headView = [[MGoodsDetailHeadView alloc] init];
                    _headView.delegate = self;
                }
                [_headView updateGoodsDetailView:_detailModel.detailData];
                self.dTableView.tableHeaderView = _headView;
                
                [self.dTableView reloadData];
                
            }else if (msgid == mRequestDetailPropertyTag){
                
                if (!_propertAlertView) {
                    _propertAlertView = [[MGoodsDetailSelectNormsView alloc] init];
                }
                [_propertAlertView updataViewWith:_detailModel.detailData propertyWith:_detailModel.propertyData];

            }else if (msgid == mRequestDetailLikeTag){
                if ([[data objectForKey:@"status"] intValue]) {
                    [self.view m_makeToast:mLocalizedString(@"mAlert_Goods_Recomm_Success")];
                }else{
                    [self.view m_makeToast:mLocalizedString(@"mAlert_Goods_Recomm_cancel")];
                }
            }else if (msgid == mRequestDetailRecommTag){
                if ([[data objectForKey:@"status"] intValue]) {
                    self.recommendBtn.selected = YES;
                    [self.view m_makeToast:mLocalizedString(@"mAlert_Goods_Like_Success")];
                }else{
                    self.recommendBtn.selected = NO;
                    [self.view m_makeToast:mLocalizedString(@"mAlert_Goods_Like_cancel")];
                }
            }
        }
            break;
        case eDataCodeServiceFaild:
        {
            if (msgid == mRequestDetailInfoTag) {
                [MPromptView show_promptAlertViewWith:self.view typeWith:M_PromptAlert_Type_Failure messageWith:mLocalizedString(@"mPublic_Sever_Error") blockWith:^{
                    [MPromptView remove_promptAlertViewWith:self.view];
                    [self requestDetailInfoData];
                }];
            }else if (msgid == mRequestDetailPropertyTag) {
                
//                [self requestDetailPropertyData];
                
            }else{
                [self.view m_makeToast:[MUtilities toastResponseMessage:data]];
            }
        }
            break;
        case eDataCodeFaild:
        {
            if (msgid == mRequestDetailInfoTag) {
                [MPromptView show_promptAlertViewWith:self.view typeWith:M_PromptAlert_Type_Failure messageWith:mLocalizedString(@"mAlert_Request_Error") blockWith:^{
                    [MPromptView remove_promptAlertViewWith:self.view];
                    [self requestDetailInfoData];
                }];
            }else if (msgid == mRequestDetailPropertyTag){
//                [self requestDetailPropertyData];
            }else{
                [self.view m_makeToast:mLocalizedString(@"mAlert_Request_Error")];
            }
        }
            break;
        default:
            break;
    }
}

@end
