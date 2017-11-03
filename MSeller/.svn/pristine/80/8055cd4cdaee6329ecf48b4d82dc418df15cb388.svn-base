//
//  MTabBarController.h
//  MSeller
//
//  Created by TreeWrite on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kItemImgName        @"itemImgName"      //按钮默认图片名称
#define kItemSelImgName     @"itemSelImgName"   //按钮选中图片名称
#define kItemTitle          @"itemTitle"        //按钮名称

@protocol TabBarBtnItemDelegate<NSObject>

@required
-(void)clickTabBarItem:(NSInteger)index;

@end

@interface MTabBarController : UITabBarController

@property(nonatomic,readonly) CGFloat tabBarHeight;

//初始化tabBar Item Button
//itemButtons: Item Button 数组包含 每一个item button 字典信息
- (void)initTabBarButtonItems:(NSArray*)itemButtons;

//设置TabBar背影图片
- (void)setTabBarBackground:(NSString*)bgImgName;

//选中位置
- (void)selectTabBarItemAtIndex:(NSInteger)index;

@end

@interface UITabBarItemView : UIButton
{
    UIImageView *_backgroundView;
    
    UIImageView *_imageView;
    UILabel *_titleLabel;
}

@property(nonatomic,weak) id<TabBarBtnItemDelegate> tabBarDelegate;

@property (nonatomic,assign)BOOL itemSelected;

- (UITabBarItemView*)initWithFrame:(CGRect)frame normalImageName:(NSString*)normalImgName selectedImageName:(NSString*)selectedImgName title:(NSString*)title;

-(void)changeItemImgText:(NSString*)norImgName selImage:(NSString*)selImg text:(NSString*)title;

@end

