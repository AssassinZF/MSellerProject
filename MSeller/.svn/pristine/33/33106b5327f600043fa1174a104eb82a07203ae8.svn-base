//
//  MSearchTitleView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/23.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MSearchTitleViewDelegate <NSObject>


/**
 *  点击搜索回调
 *
 *  @param searchValue 搜索内容
 */
- (void)search_ChangeWithValue:(NSString *)searchValue;


@end

@interface MSearchTitleView : UIView


@property (weak, nonatomic) IBOutlet UITextField *inputSearchValueTF;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (copy, nonatomic) NSString *searchText;
@property (nonatomic, weak) id<MSearchTitleViewDelegate> delegate;


/**
 *  获取控件（XIB创建）
 *
 *  @param delegate 代理
 *
 *  @return MSearchTitleView
 */
+ (MSearchTitleView *)initSearchTitleViewWithNib:(id)delegate;


/**
 *  设置输入框文字
 */
- (void)updateInputText:(NSString *)textString;

/**
 *  获取输入文字
 */
- (NSString *)getInputText;

/**
 *  取消键盘
 */
- (void)textFieldResignFirstResponder;



@end
