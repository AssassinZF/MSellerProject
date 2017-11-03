//
//  MGoodsDetailShareViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailShareViewPage.h"
#import "MGoodsDetailShareModel.h"
#import "MGoodsDetailShareInfoCell.h"

@interface MGoodsDetailShareViewPage () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_showArray;
    MGoodsShareModel *_shareModel;
}

@property (weak, nonatomic) IBOutlet UITableView *shareTableView;

@end

@implementation MGoodsDetailShareViewPage

- (void)dealloc
{
    _shareTableView.delegate = nil;
    _shareTableView.dataSource = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registController:@"MGoodsDetailShareController"];
        _shareModel = [self.controller getModelFromListByName:@"MGoodsDetailShareModel"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _showArray = @[@"1",@"1",@"1",@"1",@"1"];
    
    [self registCell];
    
//    [self.shareTableView reloadData];


}

- (void)registCell
{
    [self.shareTableView registerNib:[UINib nibWithNibName:[MGoodsDetailShareInfoCell getCellIdentifier] bundle:nil] forCellReuseIdentifier:[MGoodsDetailShareInfoCell getCellIdentifier]];
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
/**
 UITabeleView代理方法设置
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _showArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MGoodsDetailShareInfoCell getGoodsImageAndTextCellHeight:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGoodsDetailShareInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[MGoodsDetailShareInfoCell getCellIdentifier]];
    [cell updateViewCell:@""];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark -
#pragma mark - 网络请求返回

- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    switch (errCode) {
        case eDataCodeSuccess:
        {
            
        }
            break;
            
        default:
            break;
    }
}

@end
