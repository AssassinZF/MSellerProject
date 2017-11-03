//
//  MBaseViewCtr.m
//  MSeller
//
//  Created by TreeWrite on 2017/9/29.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MBaseViewCtr.h"

@interface MBaseViewCtr () <MBaseControllerDelegate>

@end

@implementation MBaseViewCtr

- (void)dealloc
{
}

-(void)initWithParam:(NSDictionary *)paramInfo
{
    //子类实现
    
}

-(void)backViewWithParam:(NSDictionary *)paramInfo
{
    //子类实现
}

-(void)registController:(NSString*)controllerName
{
    if (controllerName == nil || [controllerName isEqualToString:@""]) {
        return;
    }
    Class classObj = NSClassFromString(controllerName);
    if (classObj && [classObj isSubclassOfClass:[MBaseController class]]) {
        //控制器绑定UI View引用对象,把controller和view 关联起来
        self.controller = [((MBaseController*)[classObj alloc]) init];
        self.controller.delegate = self;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (self.rt_navigationController.viewControllers.count > 1) {
        UIBarButtonItem *leftBar = [self leftItemWithTarget:self action:@selector(leftBarBtnTouchUpInside)];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -20;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftBar];
    }
    self.rt_disableInteractivePop = NO;
}

- (UIBarButtonItem *)leftItemWithTarget:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = MC_Clear_Color;
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:mGetImage(@"nav_back_icon") forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

/**
 设置导航栏右侧按钮
 
 @param image 图片
 @param target target
 @param action 方法
 */
- (UIButton *)rightBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = MC_Clear_Color;
    button.frame = CGRectMake(0, 0, 44, 44);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
    return button;
}

- (void)leftBarBtnTouchUpInside
{
    [self popViewPageAnimated:YES];
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


/**
 *  数据更新接口
 *
 *  @param data   1.如果数据读取成功,代表数据对象模型;2.如果数据读取失败，代表错误信息;3解析失败代表nil
 *  @param msgid  消息命令ID
 *  @param errCode 错误代码值,0代表成功,see the enum EDataStatusCode
 */
- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    //子类实现自已的数据更新
}

@end


@implementation MBaseViewCtr(UINavigator)

- (void)pushRepeatPageWithName:(NSString *)pageName animation:(BOOL)animation
{
    [self pushRepeatPageWithName:pageName animation:animation withParams:nil];
}

- (void)pushRepeatPageWithName:(NSString *)pageName animation:(BOOL)animation withParams:(NSDictionary*)pararmInfo
{
    MBaseViewCtr *preVC = nil;
    for (UIViewController *vc in self.rt_navigationController.rt_viewControllers)
    {
        if ([vc isKindOfClass:NSClassFromString(pageName)])
        {
            preVC = [self.rt_navigationController.rt_viewControllers objectAtIndex:[self.rt_navigationController.rt_viewControllers indexOfObject:vc]-1];
            [self popViewPageAnimated:preVC withAnimated:NO withParams:nil];
            break;
        }
    }
    
    if (preVC)
    {
        [preVC pushPageWithName:pageName animation:YES withParams:pararmInfo];
    }
    else
    {
        [self pushPageWithName:pageName animation:animation withParams:pararmInfo];
    }
}

-(void)pushPageWithName:(NSString*)pageName animation:(BOOL)animation
{
    [self pushPageWithName:pageName animation:animation withParams:nil];
}

-(void)pushPageWithName:(NSString*)pageName animation:(BOOL)animation withParams:(NSDictionary*)pararmInfo
{
    if (pageName == nil || [pageName isEqualToString:@""]) {
        return ;
    }
    
    Class  classObj = NSClassFromString(pageName);
    if (classObj != nil && [classObj isSubclassOfClass:[UIViewController class]]) {
        id page = [[classObj alloc] init];
        if ([page respondsToSelector:@selector(initWithParam:)]) {
            [page initWithParam:pararmInfo];
        }
        UIViewController * pushVc = page;
        pushVc.hidesBottomBarWhenPushed = YES;
        [self.rt_navigationController pushViewController:page animated:animation];
    }
}

- (void)popViewPageAnimated:(BOOL)animated
{
    [self.rt_navigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewPageAnimated:(BOOL)animated
{
    [self.rt_navigationController popToRootViewControllerAnimated:animated];
}

- (void)popViewPageAnimated:(MBaseViewCtr*)viewPage withAnimated:(BOOL)animated withParams:(NSDictionary*)paramInfo
{
    if (viewPage && [viewPage respondsToSelector:@selector(backViewWithParam:)]) {
        [viewPage backViewWithParam:paramInfo];
    }
    [self.rt_navigationController popToViewController:viewPage animated:animated];
    
}

- (void)presentViewPage:(NSString*)pageName animated:(BOOL)animation completion:(void (^)(void))completion
{
    [self presentViewPage:pageName animated:animation paramInfo:nil completion:completion];
}

- (void)presentViewPage:(NSString*)pageName animated:(BOOL)animation paramInfo:(NSDictionary *)info completion:(void (^)(void))completion
{
    if (pageName == nil || [pageName isEqualToString:@""]) {
        return ;
    }
    
    Class  classObj = NSClassFromString(pageName);
    if (classObj != nil && [classObj isSubclassOfClass:[UIViewController class]]) {
        id page = [[classObj alloc] init];
        if ([page respondsToSelector:@selector(initWithParam:)]) {
            [page initWithParam:info];
        }
        
        RTRootNavigationController *navi = [[RTRootNavigationController alloc] initWithRootViewController:(UIViewController*)page];
        UIViewController *curSelf = self.navigationController.topViewController;
        [curSelf presentViewController:navi animated:animation completion:completion];
    }
}

- (void)dismissViewPageAnimated:(BOOL)animation completion:(void (^)(void))completion
{
    UIViewController *curSelf = self.navigationController.topViewController;
    [curSelf dismissViewControllerAnimated:animation completion:completion];
}

@end

