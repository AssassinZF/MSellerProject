//
//  MStoreOrderTableViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreOrderTableViewCell.h"

@implementation MStoreOrderTableViewCell


+ (CGFloat)getCellHeihgt
{
    return mLayout_Ratio(83)+mLayout_Ratio(10)+mLayout_Ratio(39);
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.size = CGSizeMake(Screen_Width, mLayout_Ratio(83)+mLayout_Ratio(10)+mLayout_Ratio(39));
    
    self.topLineView.frame = CGRectMake(mLayout_Ratio(15), 0, self.width-mLayout_Ratio(15)*2, 1);
    
    UIView *orderBtnView = [[UIView alloc] init];
    orderBtnView.frame = CGRectMake(mLayout_Ratio(49), mLayout_Ratio(20), self.width-(mLayout_Ratio(49)*2), mLayout_Ratio(42));
    [self addSubview:orderBtnView];
    
    CGFloat space = (orderBtnView.width-mLayout_Ratio(35)*4)/3;
    NSArray *orderTextArray = @[@"待付款",@"待收货",@"已完成",@"售后"];
    NSArray *orderImgArray = @[@"order_obligation",@"order_waitReceive",@"order_completed",@"order_afterSale"];
    
    for (int i = 0; i < 4; i++)
    {
        UIImageView *orderImgView = [[UIImageView alloc] init];
        orderImgView.frame = CGRectMake((space+mLayout_Ratio(24))*i, 0, mLayout_Ratio(24), mLayout_Ratio(21));
        orderImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",orderImgArray[i]]];
        [orderBtnView addSubview:orderImgView];
        
        UILabel *orderTextLB = [[UILabel alloc] init];
        orderTextLB.frame = CGRectMake((space+mLayout_Ratio(35))*i, orderImgView.bottom+mLayout_Ratio(6), mLayout_Ratio(35), mLayout_Ratio(15));
        orderTextLB.font = [MUtilities setFontSizeWith:11];
        orderTextLB.textColor = MC_DGray_Color;
        orderTextLB.text = [orderTextArray objectAtIndex:i];
        orderTextLB.textAlignment = NSTextAlignmentCenter;
        [orderBtnView addSubview:orderTextLB];
        orderImgView.centerX = orderTextLB.centerX;
        
        UIButton *clickTypeBtn = [[UIButton alloc] init];
        clickTypeBtn.frame = CGRectMake(orderTextLB.left, orderImgView.top, orderTextLB.width, orderTextLB.bottom-orderImgView.top);
        clickTypeBtn.tag = 1000+i;
        [clickTypeBtn addTarget:self action:@selector(clickOrderTypeBtnEventWithBtn:) forControlEvents:UIControlEventTouchUpInside];
        [orderBtnView addSubview:clickTypeBtn];
    }
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, orderBtnView.bottom+mLayout_Ratio(20), self.width, mLayout_Ratio(10)+mLayout_Ratio(39));
    bottomView.backgroundColor = MC_BGGray_Color;
    [self addSubview:bottomView];
    
    
    UIButton *manageStoreBtn = [[UIButton alloc] init];
    manageStoreBtn.frame = CGRectMake(mLayout_Ratio(10), mLayout_Ratio(10), self.width-mLayout_Ratio(10)*2, mLayout_Ratio(39));
    manageStoreBtn.backgroundColor = [UIColor whiteColor];
    [manageStoreBtn setTitle:@"管理我的店铺" forState:UIControlStateNormal];
    [manageStoreBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    manageStoreBtn.titleLabel.font = [MUtilities setFontSizeWith:14];
    [manageStoreBtn addTarget:self action:@selector(manageMyStoreBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:manageStoreBtn];
}


- (void)manageMyStoreBtnEvent
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreOrderActionWithType:)])
    {
        [self.delegate clickStoreOrderActionWithType:MStoreOrderActionTypeManageStore];
    }
}


- (void)clickOrderTypeBtnEventWithBtn:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreOrderActionWithType:)])
    {
        switch (btn.tag)
        {
            case 1000:      //待付款
            {
                [self.delegate clickStoreOrderActionWithType:MStoreOrderActionTypeObligation];
            }
                break;
                
            case 1001:      //待收货
            {
                [self.delegate clickStoreOrderActionWithType:MStoreOrderActionTypeWaitReceive];
            }
                break;

            case 1002:      //已完成
            {
                [self.delegate clickStoreOrderActionWithType:MStoreOrderActionTypeCompleted];
            }
                break;

            case 1003:      //售后
            {
                [self.delegate clickStoreOrderActionWithType:MStoreOrderActionTypeAfterSale];
            }
                break;
                
            default:
                break;
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
