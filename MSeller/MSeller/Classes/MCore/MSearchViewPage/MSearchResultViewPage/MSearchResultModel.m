
//
//  MSearchResultModel.m
//  MSeller
//
//  Created by 1yyg on 2017/10/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchResultModel.h"

@implementation MSearchResultModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resultListArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}


- (void)handleSucessData:(id)dataSource messageID:(int)msgID
{
    if (msgID == mRequestSearchResultTag) {
        //商品列表解析
        for (NSDictionary *dic in dataSource) {
            [self.resultListArray addObject:[MSearchResultData yy_modelWithJSON:dic]];
        }
    }else if (msgID == mRequestSearchResultMoreTag){
        //测试数据
        for (NSInteger i = 0; i < 3; i++) {
            MSearchResultData *data = [[MSearchResultData alloc] init];
            [self.resultListArray addObject:data];
        }
    }else if (msgID == mRequestSearchAddLikeTag){
        //添加关注
        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
        for (MSearchResultData *data in self.resultListArray) {
            if (data.spuid == spuid) {
                data.isattention = [[dataSource objectForKey:@"status"] intValue];
                break;
            }
        }
        
    }else if (msgID == mRequestSearchRecommTag){
        //添加推荐
        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
        for (MSearchResultData *data in self.resultListArray) {
            if (data.spuid == spuid) {
                data.ischoiceness = [[dataSource objectForKey:@"status"] intValue];
                break;
            }
        }
    }
}

- (void)deleteAllResultListData
{
    [self.resultListArray removeAllObjects];
}

@end
