//
//  MGoodsDetailInfoModel.m
//  MSeller
//
//  Created by TreeWrite on 2017/11/1.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailInfoModel.h"


@implementation MGoodsDetailInfoModel

- (void)handleSucessData:(id)dataSource messageID:(int)msgID
{
    
    if (msgID == mRequestDetailInfoTag){
        self.detailData = [MGoodsDetailData yy_modelWithJSON:dataSource];
    }else if (msgID == mRequestDetailPropertyTag){
        self.propertyData = [MGoodsDetailPropertyData yy_modelWithJSON:dataSource];
    }else if (msgID == mRequestDetailRecommTag){
        //添加推荐
//        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
//        for (MHomeCateListData *dataSource in self.cateListArray) {
//            if (data.spuid == spuid) {
//                data.ischoiceness = [[dataSource objectForKey:@"status"] intValue];
//                break;
//            }
//        }
    }else if (msgID == mRequestDetailLikeTag){
        //添加关注
//        int spuid = [[dataSource objectForKey:@"spuid"] intValue];
//        for (MHomeCateListData *dataSource in self.cateListArray) {
//            if (data.spuid == spuid) {
//                data.isattention = [[dataSource objectForKey:@"status"] intValue];
//                break;
//            }
//        }
    }

    
}

@end
