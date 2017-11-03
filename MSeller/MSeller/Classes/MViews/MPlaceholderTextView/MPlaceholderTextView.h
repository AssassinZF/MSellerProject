//
//  MPlaceholderTextView.h
//  MSeller
//
//  Created by 1yyg on 2017/10/27.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPlaceholderTextView : UITextView
{
    UILabel *_placeholderLabel;
}


@property (nonatomic, retain) NSString *placeholderText;
@property (nonatomic, retain) UIColor *placeholderColor;


@end
