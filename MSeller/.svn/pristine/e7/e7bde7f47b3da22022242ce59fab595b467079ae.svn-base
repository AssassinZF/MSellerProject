//
//  MaseController.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/29.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseController.h"
#import "MBaseViewCtr.h"
#import "MBaseModel.h"

@implementation MBaseController

- (void)dealloc
{
    self.delegate = nil;
    _modelList = nil;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _modelList = [[NSMutableArray alloc] init];
        [self initController];
    }
    
    return self;
}

-(void)initController
{
    //由子类实现,初始化控制类,
}

- (void)registerModel:(MBaseModel *)model
{
    if (model)
    {
        [_modelList addObject:model];
    }
}

- (id)getModelFromListByName:(NSString*)name
{
    if (name ==nil || [name isEqualToString:@""]) {
        nil;
    }
    for (id mode in _modelList)
    {
        NSString* className = NSStringFromClass([mode class]);
        
        if ([className isEqualToString:name]) {
            return mode;
        };
    }
    return nil;
}

-(void)sendMessageID:(int)msgID messageInfo:(id)msgInfo
{
    //子类覆盖实现
}

@end
