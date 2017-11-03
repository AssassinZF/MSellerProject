//
//  MGuideViewPage.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGuideViewPage.h"
#import "AppDelegate+ViewController.h"

@interface MGuideViewPage ()
{
    NSArray *_bgImageViews;
    UIButton *_btn;
    BOOL _isShop;
}

@property (weak, nonatomic) IBOutlet UIScrollView *showScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@end

@implementation MGuideViewPage

/**
 初始化方法
 
 *  isShop：是否开店
 *  imaeNames：图片名数组
 *  btn：响应按钮
 *	block：按钮回调
 */
- (id)initWithCoverWith:(BOOL)isShop imageNames:(NSArray *)imaeNames btn:(UIButton *)btn
{
    self = [super init];
    if (self) {
        
        [self registController:@"MGuideController"];
        
        _bgImageViews = imaeNames;
        _btn = btn;
        _isShop = isShop;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createView];
}

- (void)createView
{
    self.widthConstraint.constant = _bgImageViews.count*Screen_Width;
    
    for (NSInteger i = 0; i < _bgImageViews.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width*i, 0, Screen_Width, Screen_Height)];
        imageView.image = mGetImage([_bgImageViews objectAtIndex:i]);
        [self.showScrollView addSubview:imageView];
    }
    
    [_btn addTarget:self action:@selector(toBtnUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self.showScrollView addSubview:_btn];
}

- (void)toBtnUpInside
{
    if (_isShop) {
        [self.controller sendMessageID:0 messageInfo:nil];
    }else
    {
        [MAppDelegateObj setRootViewController];
    }
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


- (void)update:(id)data msgID:(int)msgid faildCode:(EDataStatusCode)errCode
{
    switch (errCode) {
        case eDataCodeSuccess:
        {
            [MAppDelegateObj setRootViewController];
        }
            break;
        case eDataCodeServiceFaild:
        {
            [self.view m_makeToast:[MUtilities toastResponseMessage:data]];
        }
            break;
        case eDataCodeFaild:
        {
            [self.view m_makeToast:mLocalizedString(@"mAlert_Request_Error")];
        }
            break;
            
        default:
        {
            [self.view m_makeToast:mLocalizedString(@"mAlert_Request_Error")];
        }
            break;
    }
}

@end
