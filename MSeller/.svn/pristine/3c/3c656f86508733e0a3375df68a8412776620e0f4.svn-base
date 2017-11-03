//
//  MRecommendController.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MRecommendController.h"
#import "MRecommendModel.h"



@interface MRecommendController ()
{
    MRecommendModel *_model;
    NSMutableDictionary *_dic;
    
}

@end

@implementation MRecommendController

-(void)initController
{
    _dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    //由子类实现,初始化控制类,
    _model = [[MRecommendModel alloc] init];
    [self registerModel:_model];
}

- (void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    
    if ([_model handleSucessData:@"" messageID:100]) {
        [self.delegate update:@"" msgID:100 faildCode:eDataCodeSuccess];
    }else{
        [self.delegate update:@"" msgID:100 faildCode:eDataCodeFaild];
    }
}



@end
