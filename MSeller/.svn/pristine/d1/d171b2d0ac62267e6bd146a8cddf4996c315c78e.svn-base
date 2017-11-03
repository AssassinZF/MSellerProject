//
//  MTIPSAlertView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/19.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^AlertResult)(NSInteger index);


@interface MTIPSAlertView : UIView


@property (nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showMAlertView;


@end
