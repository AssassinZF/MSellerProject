//
//  MHomeModel.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MHomeModel.h"

@implementation MHomeModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cateArray = [[NSMutableArray alloc] initWithCapacity:0];
        self.cateListArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(void)handleSucessData:(id)dataSource messageID:(int)msgID
{
    if (msgID == mRequestGetCateTag) {
        //商品分类解析
        for (NSDictionary *dic in dataSource) {
            [self.cateArray addObject:[MHomeCateData yy_modelWithJSON:dic]];
        }
    }else if (msgID == mRequestGetListTag || msgID == mRequestGetListMoreTag) {
        //商品列表解析
        for (NSDictionary *dic in dataSource) {
            [self.cateListArray addObject:[MHomeCateListData yy_modelWithJSON:dic]];
        }
    }else if (msgID == mRequestRecommTag){
        //添加推荐
        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
        for (MHomeCateListData *data in self.cateListArray) {
            if (data.spuid == spuid) {
                data.ischoiceness = [[dataSource objectForKey:@"status"] intValue];
                break;
            }
        }
    }else if (msgID == mRequestAddLikeTag){
        //添加关注
        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
        for (MHomeCateListData *data in self.cateListArray) {
            if (data.spuid == spuid) {
                data.isattention = [[dataSource objectForKey:@"status"] intValue];
                break;
            }
        }
    }
}

- (void)deleteCateListData
{
    [self.cateListArray removeAllObjects];
}


@end
