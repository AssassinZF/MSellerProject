//
//  MTabBarController.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/17.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MTabBarController.h"

#define kTabBarItemHeight   49
#define kTabBarItemWidth    70
#define kTabBarItemSize     CGSizeMake(kTabBarItemWidth,kTabBarItemHeight)

@interface MTabBarController () <TabBarBtnItemDelegate>

@property(nonatomic, strong)NSMutableArray *tabBarItemArray;

@end

@implementation MTabBarController

- (void)dealloc
{
    
}

-(CGFloat)tabBarHeight
{
    return kTabBarItemHeight;
}

- (void)initTabBarButtonItems:(NSArray*)itemButtons
{
    if (itemButtons == nil || itemButtons.count <= 0) {
        return;
    }
    
    if (self.tabBarItemArray == nil) {
        _tabBarItemArray = [[NSMutableArray alloc] init];
    }
    
    NSArray *subViews = self.tabBar.subviews;
    for (UIView *sub in subViews) {
        if ([NSStringFromClass(sub.class) isEqualToString:@"UITabBarButton"]) {
            [sub removeFromSuperview];
        }
    }
    
    //左右固定边距
    CGFloat lrGrapWid = 30;
    CGFloat width = kTabBarItemWidth;
    CGFloat height = kTabBarItemHeight;
    
    if (itemButtons.count == 2) {//两个处理
        for (NSInteger i = 0; i < 2; i++) {
            NSDictionary *itemDic = itemButtons[i];
            
            NSString *imgName = itemDic[kItemImgName];
            NSString *selImgName = itemDic[kItemSelImgName];
            NSString *itemTitle = itemDic[kItemTitle];
            
            CGRect rect;
            if (i == 0) {
                rect = CGRectMake(lrGrapWid, 0, width, height);
            }
            else{
                rect = CGRectMake(self.view.frame.size.width - lrGrapWid - width, 0, width, height);
            }
            
            UITabBarItemView *tabBarBg = [[UITabBarItemView alloc] initWithFrame:rect normalImageName:imgName selectedImageName:selImgName title:itemTitle];
            tabBarBg.center = CGPointMake( i ? (CGRectGetMidX(self.view.bounds)/2.0 + CGRectGetMidX(self.view.bounds)) : (CGRectGetMidX(self.view.bounds)/2.0), tabBarBg.center.y);
            tabBarBg.tag = i;
            tabBarBg.tabBarDelegate = self;
            [self.tabBar addSubview:tabBarBg];
            [self.tabBarItemArray addObject:tabBarBg];
        }
    }
    else if (itemButtons.count == 3) {//三个处理
        for (NSInteger i = 0; i < 3; i++) {
            NSDictionary *itemDic = itemButtons[i];
            
            NSString *imgName = itemDic[kItemImgName];
            NSString *selImgName = itemDic[kItemSelImgName];
            NSString *itemTitle = itemDic[kItemTitle];
            
            CGRect rect;
            if (i == 0) {
                rect = CGRectMake(lrGrapWid, 0, width, height);
            }
            else if(i == 2){
                rect = CGRectMake(self.view.frame.size.width - lrGrapWid - width, 0, width, height);
            }
            else{
                CGFloat xx = (self.view.frame.size.width - width)/2;
                rect = CGRectMake(xx, 0, width, height);
            }
            
            UITabBarItemView *tabBarBg = [[UITabBarItemView alloc] initWithFrame:rect normalImageName:imgName selectedImageName:selImgName title:itemTitle];
            tabBarBg.tag = i;
            tabBarBg.tabBarDelegate = self;
            CGFloat scale = CGRectGetWidth(self.view.bounds)/itemButtons.count;
            tabBarBg.center = CGPointMake(i*scale+(scale/2.0), tabBarBg.center.y);
            [self.tabBar addSubview:tabBarBg];
            [self.tabBarItemArray addObject:tabBarBg];
        }
    }
    else if (itemButtons.count > 3){//其它下均排
        lrGrapWid = 8;
        CGFloat cItemX = 0;
        for (NSInteger i = 0; i < itemButtons.count; i++) {
            NSDictionary *itemDic = itemButtons[i];
            
            NSString *imgName = itemDic[kItemImgName];
            NSString *selImgName = itemDic[kItemSelImgName];
            NSString *itemTitle = itemDic[kItemTitle];
            
            CGFloat xWid = self.view.frame.size.width - lrGrapWid*2;
            CGFloat itemWid = xWid/itemButtons.count;
            CGFloat tmpX = cItemX;
            if ((itemWid - width)/2 > 0) {
                tmpX += (itemWid - width)/2;
            }
            CGRect rect = CGRectMake(tmpX, 0, width, height);
            cItemX += itemWid;
            
            UITabBarItemView *tabBarBg = [[UITabBarItemView alloc] initWithFrame:rect normalImageName:imgName selectedImageName:selImgName title:itemTitle];
            tabBarBg.tag = i;
            tabBarBg.tabBarDelegate = self;
            [self.tabBar addSubview:tabBarBg];
            [self.tabBarItemArray addObject:tabBarBg];
        }
    }
    else{//一个情况
        NSDictionary *itemDic = itemButtons[0];
        
        NSString *imgName = itemDic[kItemImgName];
        NSString *selImgName = itemDic[kItemSelImgName];
        NSString *itemTitle = itemDic[kItemTitle];
        
        CGRect rect = CGRectMake((self.view.frame.size.width - width)/2, 0, width, height);
        
        UITabBarItemView *tabBarBg = [[UITabBarItemView alloc] initWithFrame:rect normalImageName:imgName selectedImageName:selImgName title:itemTitle];
        tabBarBg.tag = 0;
        tabBarBg.tabBarDelegate = self;
        [self.tabBar addSubview:tabBarBg];
        [self.tabBarItemArray addObject:tabBarBg];
    }
    
    
    //默认选中第一个
    [self selectTabBarItemAtIndex:0];

    self.tabBar.backgroundImage = [mGetImage(@"toolbar") stretchableImageWithLeftCapWidth:0 topCapHeight:2];
}


- (void)setTabBarBackground:(NSString*)bgImgName
{
    if (bgImgName==nil || [bgImgName isEqualToString:@""]) {
        return;
    }
    self.tabBar.backgroundImage = [mGetImage(bgImgName) stretchableImageWithLeftCapWidth:0 topCapHeight:2];
}


-(void)clickTabBarItem:(NSInteger)index
{
    if (index >= 0 && index < self.viewControllers.count) {
        self.selectedIndex = index;
        [self selectTabBarItemAtIndex:index];
    }
}

//自定义了TabBarController 之后必须实现以下
//不调用父类是为了 解决Unbalanced calls to begin/end appearance transitions for 系统提示Bug
-(void)viewWillAppear:(BOOL)animated
{
    // [super viewWillAppear:animated];
    [self.selectedViewController beginAppearanceTransition:YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    // [super viewDidAppear:animated];
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    //[super viewWillDisappear:animated];
    [self.selectedViewController beginAppearanceTransition:NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    //[super viewDidDisappear:animated];
    [self.selectedViewController endAppearanceTransition];
}

- (void)selectTabBarItemAtIndex:(NSInteger)index
{
    for(UITabBarItemView *tabBarBg in _tabBarItemArray)
    {
        NSInteger thisIndex = [_tabBarItemArray indexOfObject:tabBarBg];
        if(index == thisIndex)
        {
            tabBarBg.itemSelected = YES;
        }else {
            tabBarBg.itemSelected = NO;
        }
    }
}


-(BOOL)shouldAutorotate
{
    return NO;
}

@end

@implementation UITabBarItemView

- (UITabBarItemView*)initWithFrame:(CGRect)frame normalImageName:(NSString*)normalImgName selectedImageName:(NSString*)selectedImgName title:(NSString*)title
{
    CGRect bgRect = frame;
    if(self = [super initWithFrame:frame])
    {
        bgRect.origin = CGPointZero;
        
        UIImage  *_normalImage = mGetImage(normalImgName);
        UIImage  * _selectedImage = mGetImage(selectedImgName);
        CGSize size = _normalImage.size;
        
        CGFloat gap = 4.0;
        CGFloat yOffset = gap;
        CGRect imgViewRect = CGRectMake((frame.size.width-size.width)*0.5, yOffset, size.width, size.height);
        _imageView = [[UIImageView alloc] initWithFrame:imgViewRect];
        _imageView.image = _normalImage;
        _imageView.highlightedImage = _selectedImage;
        [self addSubview:_imageView];
        
        UIFont *font;
        CGSize titleSize;
        
        CGSize nSize = CGSizeMake(1111, 20000);
        
        CGFloat tmpYY;
        font = [UIFont boldSystemFontOfSize:12.0];
        titleSize = [title boundingRectWithSize:nSize
                                            options:NSStringDrawingTruncatesLastVisibleLine
                         | NSStringDrawingUsesLineFragmentOrigin
                         | NSStringDrawingUsesFontLeading
                                         attributes:@{NSFontAttributeName: font}
                                            context:nil].size;
            
        imgViewRect.origin.y -= 4;
        _imageView.frame = imgViewRect;
        tmpYY = imgViewRect.origin.y + imgViewRect.size.height;

        
        CGRect rect = CGRectMake(gap, tmpYY, frame.size.width-gap*2, titleSize.height);
        _titleLabel = [[UILabel alloc] initWithFrame:rect];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = title;
        _titleLabel.font = font;
        [self addSubview:_titleLabel];
        
        CGFloat contentEdge = 0.0;  //image与label的间距
        CGFloat edge = CGRectGetHeight(frame) - CGRectGetHeight(_imageView.bounds) - CGRectGetHeight(_titleLabel.bounds) - contentEdge;
        CGRect UIFrame = _imageView.frame;
        UIFrame.origin.y = edge/2.0;
        _imageView.frame = UIFrame;
        
        UIFrame = _titleLabel.frame;
        UIFrame.origin.y = CGRectGetHeight(frame) - edge/2.0 - UIFrame.size.height;
        _titleLabel.frame = UIFrame;
        
        [self addTarget:self action:@selector(clickTabBarButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clickTabBarButton
{
    if(self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(clickTabBarItem:)]){
        [self.tabBarDelegate clickTabBarItem:self.tag];
    }
}


-(void)changeItemImgText:(NSString*)norImgName selImage:(NSString*)selImg text:(NSString*)title
{
    UIImage  *_normalImage = mGetImage(norImgName);
    UIImage  * _selectedImage = mGetImage(selImg);
    
    _imageView.image = _normalImage;
    _imageView.highlightedImage = _selectedImage;
    
    _titleLabel.text = title;
}

- (void)setItemSelected:(BOOL)select
{
    _itemSelected = select;
    
    if(select)
    {
        _backgroundView.highlighted = YES;
        _imageView.highlighted = YES;
        _titleLabel.textColor = [UIColor redColor];
    }else {
        _backgroundView.highlighted = NO;
        _imageView.highlighted = NO;
        _titleLabel.textColor = [UIColor grayColor];
    }
}


@end
