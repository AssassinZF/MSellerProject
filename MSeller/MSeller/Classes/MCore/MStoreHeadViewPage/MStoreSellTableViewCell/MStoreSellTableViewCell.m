//
//  MStoreSellTableViewCell.m
//  MSeller
//
//  Created by 1yyg on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MStoreSellTableViewCell.h"


@interface MStoreSellTableViewCell ()
{
    UILabel *orderLB;
    UILabel *sellLB;
    UILabel *visitLB;
}

@end

@implementation MStoreSellTableViewCell


+ (CGFloat)getCellHeihgt
{
    return mLayout_Ratio(98);
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.size = CGSizeMake(Screen_Width, mLayout_Ratio(98));
    
    NSArray *sellTopArray = @[@"今日订单",@"本月销售（元）",@"累计访问"];
    
    for (int i = 0; i < 3; i ++)
    {
        UILabel *sellTopLB = [[UILabel alloc] init];
        sellTopLB.frame = CGRectMake(i*(self.width/3), mLayout_Ratio(20), self.width/3, mLayout_Ratio(21));
        sellTopLB.font = [MUtilities setFontSizeWith:13];
        sellTopLB.textColor = MC_AlertText_Color;
        sellTopLB.text = sellTopArray[i];
        sellTopLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:sellTopLB];
        
        UILabel *sellTextLB = [[UILabel alloc] init];
        sellTextLB.frame = CGRectMake(i*(self.width/3), sellTopLB.bottom+mLayout_Ratio(4), self.width/3, mLayout_Ratio(25));
        sellTextLB.font = [MUtilities setFontSizeWith:17];
        sellTextLB.textColor = MC_DarkGray_Color;
        sellTextLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:sellTextLB];
        if (i == 0)
            orderLB = sellTextLB;
        else if (i == 1)
            sellLB = sellTextLB;
        else if (i == 2)
            visitLB = sellTextLB;
        
        UIButton *clickTypeBtn = [[UIButton alloc] init];
        clickTypeBtn.frame = CGRectMake(sellTopLB.left, 0, sellTopLB.width, self.height-mLayout_Ratio(10));
        clickTypeBtn.tag = 2000+i;
        [clickTypeBtn addTarget:self action:@selector(clickSellBtnEventWithBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clickTypeBtn];
    }
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, self.height-mLayout_Ratio(10), self.width, mLayout_Ratio(10));
    bottomView.backgroundColor = MC_BGGray_Color;
    [self addSubview:bottomView];
}


- (void)updateStoreSellData:(MStoreInfoData *)data
{
    orderLB.text = [NSString stringWithFormat:@"%d",data.todayorder];
    sellLB.text = [NSString stringWithFormat:@"%.2f",data.sailsmonth];
    visitLB.text = [NSString stringWithFormat:@"%d",data.totalbrowse];
}


- (void)clickSellBtnEventWithBtn:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSellBtnActionWithType:)])
    {
        switch (btn.tag)
        {
            case 2000:      //今日订单
            {
                [self.delegate clickSellBtnActionWithType:MStoreSellActionTypeOrder];
            }
                break;
            case 2001:      //本月销售
            {
                [self.delegate clickSellBtnActionWithType:MStoreSellActionTypeSell];
            }
                break;
            case 2002:      //累计访问
            {
                [self.delegate clickSellBtnActionWithType:MStoreSellActionTypeVisit];
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
