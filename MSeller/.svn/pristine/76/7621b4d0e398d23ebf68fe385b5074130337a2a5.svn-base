//
//  MSearchViewPage.m
//  MSeller
//
//  Created by 1yyg on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchViewPage.h"

#import "MSearchTitleView.h"
#import "MSearchTableHeaderView.h"
#import "MDataBaseManager.h"

@interface MSearchViewPage ()
<MSearchTitleViewDelegate, MSearchTableHeaderViewDelegate>
{
    NSArray *historyArray;              //搜索历史记录数组
    MSearchTitleView *searchTitleView;  //搜索导航titleview
    MSearchTableHeaderView *headerView; //搜索历史记录模块headerview
}

@end

@implementation MSearchViewPage


- (void)viewDidLoad
{
    [super viewDidLoad];

    historyArray = [[NSMutableArray alloc] initWithCapacity:0];

    [self setNavTitleView];
}


#pragma mark 设置导航条
- (void)setNavTitleView
{
    searchTitleView = [MSearchTitleView initSearchTitleViewWithNib:self];
    [searchTitleView updateInputText:self.searchValue];
    self.navigationItem.titleView = searchTitleView;
}


#pragma mrak 创建历史记录view
- (void)careatHistoryView:(NSArray *)array
{
    if (headerView)
    {
        [headerView removeFromSuperview];
        headerView = nil;
    }
    headerView = [MSearchTableHeaderView searchTableHeaderViewNibWith:self];
    headerView.frame = self.searchTable.frame;
    if (array.count > 0)
    {
        [headerView updateViewWithArray:array];
        self.searchTable.tableHeaderView = headerView;
    }
}


#pragma 本地存储历史搜索记录
-(void)searchText:(NSString *)searchStr
{
    NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    if (historyArray)
    {
        searchArray = [historyArray mutableCopy];
    }
    
    //去重
    for (int i = 0; i < [searchArray count]; i ++)
    {
        if ([searchStr isEqualToString:searchArray[i]])
        {
            [searchArray removeObjectAtIndex:i];
        }
    }
    
    [searchArray insertObject:searchStr atIndex:0];

    if ([historyArray count] > 20)
    {
        [searchArray removeLastObject];
    }
    
    //将上述数据全部存储到NSUserDefaults中
    [UserDefaultsObj setObject:searchArray forKey:MUD_Search_History];
}


#pragma mark MSearchTitleViewDelegate
/**
 *  点击搜索回调
 *
 *  @param searchValue 搜索内容
 */
- (void)search_ChangeWithValue:(NSString *)searchValue
{
    if ([searchValue length] <= 0)
    {
        [self.view m_makeToast:@"搜索内容不能为空" duration:3];

        return;
    }
    [self searchText:searchValue];
    [self pushPageWithName:@"MSearchResultViewPage" animation:YES withParams:@{@"searchValue":searchValue}];
}


#pragma mark MSearchTableHeaderViewDelegate
#pragma mark 选择历史搜索块
- (void)search_selectedBtnWith:(NSString *)selectedStr
{
    [self searchText:selectedStr];
    [self pushPageWithName:@"MSearchResultViewPage" animation:YES withParams:@{@"searchValue":selectedStr}];
}


#pragma mark 点击删除历史记录操作
- (void)historyListEmptAction
{
    MTIPSAlertView *mAlertView = [[MTIPSAlertView alloc] initWithTitle:nil message:@"确认删除全部历史记录？" sureBtn:@"确定" cancleBtn:@"取消"];
    mAlertView.resultIndex = ^(NSInteger index){
        //回调- 1:cancel 2:sure
        if (index == 2)
        {
            historyArray = nil;
            [self careatHistoryView:historyArray];
        }
    };
    [mAlertView showMAlertView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    historyArray = [UserDefaultsObj arrayForKey:MUD_Search_History];
    [self careatHistoryView:historyArray];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}


@end
