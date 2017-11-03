//
//  MaseController.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/29.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//


/*************************************************
 框架控制器类
 
 1. 用于控制UI页面和数据模型分离,控制页面和数据的流程
 2. 在BasePage初始化过程中,要把UIBaseViewPage类里的成员变量 _controller 初始化出来
 方便在UIBaseViewPage 子类内部，随时可以访问 controller属性来控制页面和数据的流向
 eg: XXBasePage *page = [XXBasePage alloc] init];
 -(id)init
 {
 [self registController:@"XXXController"];
 }
 ************************************************/

#import <Foundation/Foundation.h>

typedef enum{
    eDataCodeSuccess = 0,           //有数据&&code值等于1 请求并解析成功
    eDataCodeJsonError = -1,        //无数据/数据格式错误 请求成功但解析未成功
    eDataCodeServiceFaild = -2,     //有数据&&code值不等于1
    eDataCodeFaild = -3,            //请求失败
}EDataStatusCode;

@class MBaseViewCtr;
@class MBaseModel;
@protocol MBaseControllerDelegate <NSObject>

/**
 *  数据更新接口
 *
 *  @param data   1.如果数据读取成功,代表数据对象模型;2.如果数据读取失败，代表错误信息
 *  @param msgid  消息命令ID
 *  @param errCode 错误代码值,0代表成功,see the enum EDataStatusCode
 */
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode;

@end

@interface MBaseController : NSObject

@property (nonatomic, weak) id <MBaseControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *modelList;

//由子类实现,初始化控制类,如注册Model等,父类实现为空
-(void)initController;

/**
 *  注册在控制器的 Data Model
 *
 *  @model 数据Model模型
 */
- (void)registerModel:(MBaseModel*)model;

/**
 *  通过类名从控制器里获取数据Model
 *
 *  @param name   数据Model名字
 *
 *  @return 返回找到 数据Model
 */
- (id)getModelFromListByName:(NSString*)name;


/**
 * 向控制器发送消息,由具体子类实现自定义消息处理,父类实现为NULL
 *
 *  @param msgID    消息ID
 *  @param msgInfo  要发送的消息内容,可传NULL
 */

-(void)sendMessageID:(int)msgID messageInfo:(id)msgInfo;

@end
