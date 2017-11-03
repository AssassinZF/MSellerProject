//
//  MBaseViewCtr.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/29.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBaseModel.h"
#import "MBaseController.h"
#import "RTRootNavigationController.h"
#import "UIViewController+RTRootNavigationController.h"
#import "MJRefresh.h"
#import "MPromptView.h"

@interface MBaseViewCtr : UIViewController 

//控制逻辑的控制器,它指向子类创建的具体控制器对象
@property(nonatomic,strong)  MBaseController  *controller;

/**
 *  初始化基类对象,由子类覆盖实现自定义传参处理,基类默认空实现
 *
 *  @param paramInfo  外部传进来的参数字典信息
 *
 */
-(void)initWithParam:(NSDictionary *)paramInfo;

/**
 *  通过类名注册具体的控制器
 *
 *  @param controllerName 控制器的类名
 */
-(void)registController:(NSString*)controllerName;

/**
 *  数据变化更新UI接口,由具体的子类覆盖实现,基类默认实现为nil
 *
 *  @data   数据对象 1.如果数据读取成功,代表数据对象模型;2.如果数据读取失败,代表错误信息
 *  @msgID  消息命令
 *  @errCode 错误码,0代表成功,其它值代表相应的错误码,see the enum EDataStatusCode
 */
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode;

/**
 设置导航栏右侧按钮

 @param image 图片
 @param target target
 @param action 方法
 */
- (UIButton *)rightBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

@end


@interface MBaseViewCtr(UINavigator)    //页面跳转所有接口

/**
 页面跳转
 
 @param pageName  跳转的页面类
 @param animation 是否带动画
 */
-(void)pushPageWithName:(NSString*)pageName animation:(BOOL)animation;

/**
 页面跳转(防止重复页面跳转)

 @param pageName 跳转的页面类
 @param animation 是否带动画
 */
- (void)pushRepeatPageWithName:(NSString *)pageName animation:(BOOL)animation;

/**
 页面跳转(带参数)
 
 @param pageName   页面类名
 @param animation  是否开启动画
 @param pararmInfo 传参信息
 */
-(void)pushPageWithName:(NSString*)pageName animation:(BOOL)animation withParams:(NSDictionary*)pararmInfo;

/**
 页面跳转(带参数)(防止重复页面跳转)

 @param pageName 页面类名
 @param animation 是否开启动画
 @param pararmInfo 传参信息
 */
- (void)pushRepeatPageWithName:(NSString *)pageName animation:(BOOL)animation withParams:(NSDictionary*)pararmInfo;

/**
 返回上一页面

 @param animated 是否开启动画
 */
- (void)popViewPageAnimated:(BOOL)animated;

/**
 返回指定页面(带回参数)

 @param viewPage 页面
 @param animated 是否开启动画
 @param paramInfo 传参信息
 */
- (void)popViewPageAnimated:(MBaseViewCtr*)viewPage withAnimated:(BOOL)animated withParams:(NSDictionary*)paramInfo;

/**
 返回根页面

 @param animated 是否开启动画
 */
- (void)popToRootViewPageAnimated:(BOOL)animated;

/**
 弹出页面

 @param pageName 页面类名
 @param animation 是否开启动画
 @param completion 回调
 */
- (void)presentViewPage:(NSString*)pageName animated:(BOOL)animation completion:(void (^)(void))completion;

/**
 弹出页面(带参数)

 @param pageName 页面类名
 @param animation 是否开启动画
 @param info 传参信息
 @param completion 回调
 */
- (void)presentViewPage:(NSString*)pageName animated:(BOOL)animation paramInfo:(NSDictionary *)info completion:(void (^)(void))completion;

/**
 弹出页面返回

 @param animation 是否开启动画
 @param completion 回调
 */
- (void)dismissViewPageAnimated:(BOOL)animation completion:(void (^)(void))completion;

@end
