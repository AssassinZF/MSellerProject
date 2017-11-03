//
//  MRecommendViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MRecommendViewPage.h"
#import "MRecommendController.h"
#import "MRecommendModel.h"
#import "MShareAlertView.h"
#import "MShareSDKManger.h"

@interface MRecommendViewPage () <YGShareAlertViewDelegate>
{
    MRecommendModel *_model;
}

@end

@implementation MRecommendViewPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"壹";
    
    [self registController:@"MRecommendController"];
    
    _model = [self.controller getModelFromListByName:@"MRecommendModel"];
    
    [self.controller sendMessageID:100 messageInfo:@""];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showView:(id)sender {
    
    [self pushPageWithName:@"MGoodsDetailViewPage" animation:YES];
    
//    [MShareAlertView showShareAlertViewWith:self.view delegate:self describe:0];
}



/**
 分享按钮响应回调
 
 @param type 类型
 */
- (void)share_selectedWithType:(Share_Selected_Type)type
{
    NSArray *images = @[mGetImage(@"ic_found_pressed"), mGetImage(@"ic_found")];

    MShareSDKManger *shareManger = [[MShareSDKManger alloc] init];
    [shareManger shareActionType:type vc:self text:@"百度 http:www.baidu.com" images:images];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    MLog(@"%d", errCode);
}

@end
