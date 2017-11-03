//
//  MSearchTitleView.m
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MSearchTitleView.h"

@implementation MSearchTitleView


+ (MSearchTitleView *)initSearchTitleViewWithNib:(id)delegate
{
    MSearchTitleView *searchTitleView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MSearchTitleView class]) owner:self options:nil] firstObject];
    searchTitleView.delegate = delegate;
    return searchTitleView;
}



-(void)setSearchText:(NSString *)searchText
{
    if ([searchText length] <= 0)
        self.inputSearchValueTF.placeholder = @"";
    else
        self.inputSearchValueTF.placeholder = [NSString stringWithFormat:@"搜一下试试"];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.searchBtn.layer.cornerRadius = self.searchBtn.height/2;
    self.searchBtn.layer.masksToBounds = YES;
}

- (IBAction)searchBtnTouchUpInside:(id)sender
{
    [self textFieldResignFirstResponder];
    //无提示
    
    if ([self.delegate respondsToSelector:@selector(search_ChangeWithValue:)])
    {
        [self.delegate search_ChangeWithValue:self.inputSearchValueTF.text];
    }
}

- (void)textFieldResignFirstResponder
{
    [self.inputSearchValueTF resignFirstResponder];
}

/**
 *  设置输入框文字
 */
- (void)updateInputText:(NSString *)textString
{
    self.inputSearchValueTF.text = textString;
}

/**
 *  获取输入文字
 */
- (NSString *)getInputText
{
    self.inputSearchValueTF.text = [self.inputSearchValueTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return self.inputSearchValueTF.text;
}



#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self textFieldResignFirstResponder];
    //无提示
    
    if ([self.delegate respondsToSelector:@selector(search_ChangeWithValue:)])
    {
        [self.delegate search_ChangeWithValue:self.inputSearchValueTF.text];
    }
    return YES;
}


@end
