//
//  MRecommendModel.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MRecommendModel.h"

@implementation MRecommendModel

-(BOOL)handleSucessData:(id)dataSource messageID:(int)msgID
{
    if (msgID == 100) {
        return YES;
    }else{
        return NO;
    }
}



@end
