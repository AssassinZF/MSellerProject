//
//  MSearchTableHeaderView.m
//  MSeller
//
//  Created by 1yyg on 2017/10/20.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchTableHeaderView.h"


@interface MSearchTableHeaderView()
{
    NSArray *dataArray;
}


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteActionBtn;

@end

@implementation MSearchTableHeaderView


+ (MSearchTableHeaderView *)searchTableHeaderViewNibWith:(id)delegate
{
    MSearchTableHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MSearchTableHeaderView class]) owner:self options:nil] firstObject];
    headerView.size = Screen_Size;
    headerView.delegate = delegate;
    return headerView;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.width = Screen_Width;
    
    self.titleLabel.frame = CGRectMake(mLayout_Ratio(15), mLayout_Ratio(6), self.width-mLayout_Ratio(30), mLayout_Ratio(45));
    self.titleLabel.font = [MUtilities setFontSizeWith:13.f];
    self.deleteBtn.frame = CGRectMake(self.width-mLayout_Ratio(18)-mLayout_Ratio(15), mLayout_Ratio(6), mLayout_Ratio(18), mLayout_Ratio(20));
    self.deleteBtn.centerY = self.titleLabel.centerY;
    self.deleteActionBtn.frame = CGRectMake(self.width-mLayout_Ratio(18), 0, self.deleteBtn.width+mLayout_Ratio(15), self.deleteBtn.height+mLayout_Ratio(12));
    self.deleteActionBtn.center = self.deleteBtn.center;
}


/**
 *  更新UI
 */
- (void)updateViewWithArray:(NSArray *)array
{
    dataArray = array;
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat y = self.titleLabel.bottom;//用来控制button距离父视图的高
    NSInteger rowCount = 0;
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 100 + i;
        button.backgroundColor = MC_BGGray_Color;
        [button setTitleColor:MC_DarkGray_Color forState:UIControlStateNormal];
        button.titleLabel.font = [MUtilities setFontSizeWith:13.f];
        [button addTarget:self action:@selector(changeBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        //根据计算文字的大小
        NSDictionary *attributes = @{NSFontAttributeName:button.titleLabel.font};
        CGFloat width = [array[i] boundingRectWithSize:CGSizeMake(self.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width+mLayout_Ratio(31);
        //为button赋值
        [button setTitle:array[i] forState:UIControlStateNormal];
        //设置button的frame
        button.frame = CGRectMake(w+mLayout_Ratio(15), y, width , mLayout_Ratio(31));
        //当button的位置超出父视图的宽度时换行
        if(w +mLayout_Ratio(15) + width > self.width)
        {
            rowCount += 1;
            w = 0; //换行时重置w
            y = y + button.frame.size.height + mLayout_Ratio(10);//距离父视图也变化
            button.frame = CGRectMake(w+mLayout_Ratio(15), y, width, mLayout_Ratio(31));//重设button的frame
        }
        w = button.frame.size.width + button.frame.origin.x;
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = button.height/2;
        [self addSubview:button];
    }
}

- (void)changeBtnTouchUpInside:(UIButton *)button
{
    NSInteger index = button.tag - 100;
    if (index < dataArray.count)
    {
        if ([self.delegate respondsToSelector:@selector(search_selectedBtnWith:)])
        {
            [self.delegate search_selectedBtnWith:[dataArray objectAtIndex:index]];
        }
    }
}


- (IBAction)searchRecordRemoveEvent:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(historyListEmptAction)])
    {
        [self.delegate historyListEmptAction];
    }
}



@end
