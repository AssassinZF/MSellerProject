//
//  MGoodsDetailSelectNormsView.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/31.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MGoodsDetailSelectNormsView.h"

@interface MGoodsDetailSelectNormsView () <UITextFieldDelegate>
{
    UIView *_bgView;
    UIImageView *_imageView;
    UILabel *_priceLabel;
    UILabel *_selectLabel;
    
    MGoodsDetailPropertyData *_propertyData;
    
    NSMutableArray *_btns;
    NSMutableArray *_selectBtns;
    NSArray *_selecteSkus;
}

@end

@implementation MGoodsDetailSelectNormsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = Screen_Bounds;
        self.backgroundColor = mColorFromAHex(0x000000, 0.4);
        
        _btns = [[NSMutableArray alloc] initWithCapacity:0];
        _selectBtns = [[NSMutableArray alloc] initWithCapacity:0];
        
        //增加监听，当键盘出现或改变时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        //增加监听，当键退出时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
}


- (void)updataViewWith:(MGoodsDetailData *)detailData propertyWith:(MGoodsDetailPropertyData *)propertyData
{
    [self crateView:detailData propertyWith:propertyData];
    [self animateWithView];    
}

- (void)showNormsView
{
    [MAppDelegateObj.window addSubview:self];
    [self animateWithView];
}

- (void)animateWithView
{
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.top = self.height-_bgView.height-mLayout_Ratio(10);
        _bgView.top = self.height-_bgView.height;
    }];
}

- (void)crateView:(MGoodsDetailData *)detailData propertyWith:(MGoodsDetailPropertyData *)propertyData
{
    _propertyData = propertyData;
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
//    [arr addObject:@[@"红色",@"红色红色",@"红色色",@"红色",@"红色红色红"]];
//    [arr addObject:@[@"1243",@"红色红色",@"一二",@"一二三",@"红色红色",@"红色红色"]];
//    [arr addObject:@[@"一",@"红色",@"一二五七九",@"一二三",@"红色红色"]];
    UIView *selectView = [self createSelectBtn];
    selectView.top = mLayout_Ratio(80);
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-selectView.height-mLayout_Ratio(80)-mLayout_Ratio(50)-mLayout_Ratio(50)-mLayout_Ratio(20), self.width, selectView.height+mLayout_Ratio(80)+mLayout_Ratio(50)+mLayout_Ratio(20)+mLayout_Ratio(50))];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    [_bgView addSubview:selectView];
    
    //设置头部图片
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), _bgView.top-mLayout_Ratio(10), mLayout_Ratio(80), mLayout_Ratio(80))];
    _imageView.backgroundColor = MC_Orange_Color;
    [self addSubview:_imageView];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.right+mLayout_Ratio(10), 0, self.width-_imageView.right-mLayout_Ratio(20), 30)];
    _priceLabel.font = mLayoutSystemFont(14);
    _priceLabel.attributedText = [MUtilities setPriceAttributedWithStr:@"￥100.00 / 约赚￥7.56" price1:@"100.00" price2:@"7.56"];
    [_priceLabel sizeToFit];
    [_bgView addSubview:_priceLabel];
    _priceLabel.width = self.width-_imageView.right-mLayout_Ratio(20);
    mLayoutView(_priceLabel);

    _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(_priceLabel.left, _priceLabel.bottom+mLayout_Ratio(8), _priceLabel.width, _priceLabel.height)];
    _selectLabel.font = mLayoutSystemFont(13);
    _selectLabel.textColor = MC_DarkGray_Color;
    _selectLabel.text = @"选择规格";
    [_selectLabel sizeToFit];
    _selectLabel.width = _priceLabel.width;
    [_bgView addSubview:_selectLabel];
    mLayoutView(_selectLabel);

    CGFloat height = mLayout_Ratio(80)-_priceLabel.height-mLayout_Ratio(8)-_selectLabel.height-mLayout_Ratio(20);
    _priceLabel.top = height;
    _priceLabel.width = self.width-_imageView.right-mLayout_Ratio(20);
    if (height < 20) {
        height = 20;
    }
    
    _selectLabel.top = _priceLabel.bottom+mLayout_Ratio(8);
    _selectLabel.width = _priceLabel.width;
    
    //设置线条
    UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(mLayout_Ratio(10), mLayout_Ratio(80), self.width-mLayout_Ratio(20), 1)];
    topLineView.backgroundColor = MC_BGGray_Color;
    [_bgView addSubview:topLineView];
    
    UIView *contenLineView = [[UIView alloc] initWithFrame:CGRectMake(mLayout_Ratio(10), selectView.bottom, self.width-mLayout_Ratio(20), 1)];
    contenLineView.backgroundColor = MC_BGGray_Color;
    [_bgView addSubview:contenLineView];
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(mLayout_Ratio(10), _bgView.height-mLayout_Ratio(20)-mLayout_Ratio(50), self.width-mLayout_Ratio(20), 1)];
    bottomLineView.backgroundColor = MC_BGGray_Color;
    [_bgView addSubview:bottomLineView];
    
    //设置购买数量UI
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(mLayout_Ratio(15), contenLineView.bottom-1, mLayout_Ratio(100), mLayout_Ratio(50))];
    numberLabel.font = mLayoutSystemFont(14.f);
    numberLabel.textColor = MC_DarkGray_Color;
    numberLabel.text = @"数量";
    [_bgView addSubview:numberLabel];
    mLayoutView(numberLabel);

    UIButton *reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reduceBtn.frame = CGRectMake(numberLabel.right, numberLabel.top, (NSInteger)(mLayout_Ratio(30)), (NSInteger)(mLayout_Ratio(30)));
    [reduceBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    [reduceBtn setTitle:@"-" forState:UIControlStateNormal];
    reduceBtn.centerY = numberLabel.centerY;
    reduceBtn.titleLabel.font = mLayoutSystemFont(16);
    [_bgView addSubview:reduceBtn];
    reduceBtn.layer.masksToBounds = YES;
    reduceBtn.layer.borderWidth = 1;
    reduceBtn.layer.borderColor = MC_AlertText_Color.CGColor;
    reduceBtn.left = self.width-reduceBtn.width*2-mLayout_Ratio(40)-mLayout_Ratio(15);

    UITextField *inputField = [[UITextField alloc] initWithFrame:CGRectMake(reduceBtn.right, reduceBtn.top, (NSInteger)(mLayout_Ratio(40)), reduceBtn.height)];
    inputField.textAlignment = NSTextAlignmentCenter;
    inputField.keyboardType = UIKeyboardTypeNumberPad;
    inputField.font = mLayoutSystemFont(13);
    inputField.placeholder = @"0";
    inputField.textColor = MC_DarkGray_Color;
    [_bgView addSubview:inputField];
    [inputField addLineUp:YES down:YES color:MC_AlertText_Color lineHeight:1];
    inputField.delegate = self;

    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(inputField.right, reduceBtn.top, reduceBtn.width, reduceBtn.height);
    [addBtn setTitleColor:MC_Orange_Color forState:UIControlStateNormal];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    addBtn.centerY = numberLabel.centerY;
    addBtn.titleLabel.font = mLayoutSystemFont(16);
    [_bgView addSubview:addBtn];
    addBtn.layer.masksToBounds = YES;
    addBtn.layer.borderWidth = 1;
    addBtn.layer.borderColor = MC_AlertText_Color.CGColor;

    //设置底部按钮UI
    CGRect carFrame = CGRectMake(0, _bgView.height-mLayout_Ratio(50), self.width/2.f, mLayout_Ratio(50));
    [self setBottomBtnWith:@"加入购物车" frameWith:carFrame bgColorWith:MC_White_Color titleColorWith:MC_Orange_Color];
    
    CGRect shopFrame = CGRectMake(self.width/2.f, _bgView.height-mLayout_Ratio(50), self.width/2.f, mLayout_Ratio(50));
    [self setBottomBtnWith:@"立即购买" frameWith:shopFrame bgColorWith:MC_Orange_Color titleColorWith:MC_White_Color];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.frame = CGRectMake(_bgView.width-mLayout_Ratio(44), 0, mLayout_Ratio(44), mLayout_Ratio(44));
    [deleteBtn setImage:mGetImage(@"detail_cancel") forState:UIControlStateNormal];
    [_bgView addSubview:deleteBtn];
    [deleteBtn addTarget:self action:@selector(cancelView) forControlEvents:UIControlEventTouchUpInside];
    
    _bgView.top = self.height;
    _imageView.top = self.height;
}

- (void)setBottomBtnWith:(NSString *)title frameWith:(CGRect)frame bgColorWith:(UIColor *)bgColor titleColorWith:(UIColor *)titleColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = mLayoutSystemFont(16);
    btn.backgroundColor = bgColor;
    [_bgView addSubview:btn];
    btn.layer.shadowOpacity = 0.5;// 阴影透明度
    btn.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    btn.layer.shadowRadius = 3;// 阴影扩散的范围控制
    btn.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    mLayoutView(btn);
}

/**
 创建属性规格

 @return UIView
 */
- (UIView *)createSelectBtn
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 100)];
    
    CGFloat heightWidth = mLayout_Ratio(10);
    CGFloat leftWidth = mLayout_Ratio(15);
    CGFloat btnWidth = 0;
    CGFloat btnHeight = mLayout_Ratio(25);

    for (NSInteger i = 0; i < _propertyData.skuattrname.count; i++) {
        
        MGoodsSKUNameData *nameData = [_propertyData.skuattrname objectAtIndex:i];
        
        leftWidth = mLayout_Ratio(15);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(leftWidth, heightWidth, self.width-mLayout_Ratio(30), 50)];
        label.font = mLayoutSystemFont(14.f);
        label.textColor = MC_DarkGray_Color;
        label.text = nameData.templetname;
        [label sizeToFit];
        [view addSubview:label];
        mLayoutView(label);

        heightWidth = heightWidth+label.height+mLayout_Ratio(10);
        
        NSMutableArray *cratebtns = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSInteger j = 0; j < nameData.templetvalue.count; j++) {
            
            MGoodsTempletData *skuData = [nameData.templetvalue objectAtIndex:j];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            btnWidth = [self getBtnWidth:skuData.attrname];
            
            if (leftWidth+btnWidth+mLayout_Ratio(15) > self.width) {
                leftWidth = mLayout_Ratio(15);
                heightWidth += btnHeight+mLayout_Ratio(10);
            }
            btn.frame = CGRectMake(leftWidth, heightWidth, btnWidth, btnHeight);
            btn.titleLabel.font = mLayoutSystemFont(13.f);
            [btn setTitle:skuData.attrname forState:UIControlStateNormal];
            
            if (skuData.attrskucode.count > 0) {
                [self setBtnWith:btn state:0];
            }else{
                [self setBtnWith:btn state:2];
            }
            
            [view addSubview:btn];
            [btn addTarget:self action:@selector(selectBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
            mLayoutView(btn);

            [cratebtns addObject:btn];
            
            leftWidth += btn.width+mLayout_Ratio(12);
        }
        
        [_btns addObject:cratebtns];
        [_selectBtns addObject:[NSNumber numberWithInteger:i]];

        heightWidth += btnHeight+mLayout_Ratio(15);
    }
    
    view.height = heightWidth;
    return view;
}

/**
 规格按钮响应

 @param button 按钮选中与取消
 */
- (void)selectBtnTouchUpInside:(UIButton *)button
{
    for (NSInteger i = 0; i < _btns.count; i++) {
        for (NSInteger j = 0; j < [[_btns objectAtIndex:i] count]; j++) {
            UIButton *pBtn = [[_btns objectAtIndex:i] objectAtIndex:j];
            if (pBtn == button) {
                if ([_btns objectAtIndex:i] == pBtn) {
                    [_selectBtns replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:i]];
                }else{
                    [self setBtnWith:button state:1];
                    [_selectBtns replaceObjectAtIndex:i withObject:button];
                }
            }
        }
    }
    [self updateSelectSkus];
    [self updateBtnState];
}

- (void)updateBtnState
{
    for (NSInteger i = 0; i < _btns.count; i++) {
        if ([[_selectBtns objectAtIndex:i] isKindOfClass:[UIButton class]]) {
            
            for (NSInteger j = 0; j < [[_btns objectAtIndex:i] count]; j++) {
                
                UIButton *pBtn = [[_btns objectAtIndex:i] objectAtIndex:j];
                
                MGoodsSKUNameData *nameData = [_propertyData.skuattrname objectAtIndex:i];
                MGoodsTempletData *skuData = [nameData.templetvalue objectAtIndex:j];
                
                if (skuData.attrskucode.count > 0) {
                    
                    if (pBtn == [_selectBtns objectAtIndex:i]) {
                        //选中的btn
                        [self setBtnWith:pBtn state:1];
                    }else{
                        //没有选中
                        [self setBtnWith:pBtn state:0];
                    }
                }else{
                    //没有sku的规格（不做处理，创建的时候已经设置不能点击）
                }
                

            }
        }else{
            //这个一列的规格没有选中的（根据选中的sku去匹配这个规格是否可以选择）
            for (NSInteger j = 0; j < [[_btns objectAtIndex:i] count]; j++) {
                
                UIButton *pBtn = [[_btns objectAtIndex:i] objectAtIndex:j];
                MGoodsSKUNameData *nameData = [_propertyData.skuattrname objectAtIndex:i];
                MGoodsTempletData *skuData = [nameData.templetvalue objectAtIndex:j];
                
                if (skuData.attrskucode.count > 0) {
                    BOOL isCan = NO;
                    for (NSString *sku in skuData.attrskucode) {
                        for (NSString *selectSku in _selecteSkus) {
                            if ([sku isEqualToString:selectSku]) {
                                isCan = YES;
                            }
                        }
                    }
                    if (isCan) {
                        [self setBtnWith:pBtn state:0];
                    }
                }else{
                    //没有sku的规格（不做处理，创建的时候已经设置不能点击）
                }
            }
        }
    }
}

- (void)updateSelectSkus
{
    NSMutableArray *skus = [[NSMutableArray alloc] initWithCapacity:0];
    //有选中的btn
    for (NSInteger i = 0; i < _btns.count; i++) {
        if ([[_btns objectAtIndex:i] isKindOfClass:[UIButton class]]) {
            for (NSInteger j = 0; j < [[_btns objectAtIndex:i] count]; j++) {
                UIButton *pBtn = [[_btns objectAtIndex:i] objectAtIndex:j];
                if (pBtn == [_selectBtns objectAtIndex:i]) {
                    MGoodsSKUNameData *nameData = [_propertyData.skuattrname objectAtIndex:i];
                    MGoodsTempletData *skuData = [nameData.templetvalue objectAtIndex:j];
                    [skus addObjectsFromArray:skuData.attrskucode];
                }
            }
        }
    }
    if (skus.count > 0) {
        _selecteSkus = [[NSSet setWithArray:skus] allObjects];
    }else{
        _selecteSkus = [NSArray array];
    }
}


/**
 设置规格btn的状态
 
 @param btn 按钮
 @param state 0 可选  1已选  2不能选
 */
- (void)setBtnWith:(UIButton *)btn state:(int)state
{
    
    if (state == 0) {
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 0;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = MC_DarkGray_Color.CGColor;
        [btn setTitleColor:MC_DGray_Color forState:UIControlStateNormal];
        btn.backgroundColor = MC_White_Color;
        btn.enabled = YES;
    }else if (state == 1){
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 0;
        btn.layer.borderWidth = 0;
        [btn setTitleColor:MC_White_Color forState:UIControlStateNormal];
        btn.backgroundColor = MC_Orange_Color;
        btn.enabled = YES;
    }else{
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 0;
        btn.layer.borderWidth = 0;
        [btn setTitleColor:MC_DSGray_Color forState:UIControlStateNormal];
        btn.backgroundColor = MC_BGGray_Color;
        btn.enabled = NO;
    }
    

}


/**
 计算规格宽度

 @param str 规格
 @return 宽度
 */
- (CGFloat)getBtnWidth:(NSString *)str
{
    CGSize size = [MUtilities getSizeWithText:str textFontSize:mLayoutSystemFont(13.f) textWidth:100];
    
    return (NSInteger)(size.width+mLayout_Ratio(20));
}

//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    self.top = -height+mLayout_Ratio(50)+mLayout_Ratio(20);
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    self.top = 0;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

- (void)cancelView
{
    
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.top = self.height;
        _bgView.top = self.height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark -
#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length > 0) {
        return [self deptNumInputShouldNumber:string];
    }else{
        if ([string isEqualToString:@"0"]) {
            return NO;
        }else{
            return YES;
        }
    }
}

- (BOOL) deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}


@end
