//
//  MPhotoBrowser.m
//  MSeller
//
//  Created by TreeWrite on 2017/10/30.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#import "MPhotoBrowser.h"
#import "MBrowserImageView.h"

@interface MPhotoBrowser () <UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic ,strong)MBrowserImageView *leftBrowserImgView;
@property (nonatomic ,strong)MBrowserImageView *midBrowserImgView;
@property (nonatomic ,strong)MBrowserImageView *rightBrowserImgView;
@property(nonatomic,assign)NSInteger curentIndex;//当前显示的图片下标

@end

@implementation MPhotoBrowser

{
    NSInteger _calcIndex;//计算用的 非当前页面下标
    UILabel *_indexLabel;
    UIButton *_saveButton;
    UIActivityIndicatorView *_indicatorView;
    BOOL _hasShowedFistView;
    
    
}

-(id)init{
    if(self=[super init]){
        [self configSubView];
        [self createBrowserImg];
    }
    return  self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (!_hasShowedFistView) {
        [self openImgAnimayion];
    }
    
}


- (void)setupToolbars
{
    // 1. 序标
    UILabel *indexLabel = [[UILabel alloc] init];
    indexLabel.bounds = CGRectMake(0, 0, 80, 30);
    indexLabel.textAlignment = NSTextAlignmentCenter;
    indexLabel.textColor = [UIColor whiteColor];
    indexLabel.font = [UIFont boldSystemFontOfSize:15];
    //    indexLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //    indexLabel.layer.cornerRadius = 5;
    //    indexLabel.clipsToBounds = YES;
    
    indexLabel.text = [NSString stringWithFormat:@"1/%ld", (long)self.urlImgArr.count];
    
    _indexLabel = indexLabel;
    [self addSubview:indexLabel];
    
    // 2.保存按钮
    UIButton *saveButton = [[UIButton alloc] init];
    [saveButton setTitle:@" 下载保存到本地" forState:UIControlStateNormal];
    [saveButton setImage:[UIImage imageNamed:@"detail_download_2"] forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveButton.titleLabel.font=[UIFont systemFontOfSize:15];
    //    saveButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //    saveButton.layer.cornerRadius = 5;
    //    saveButton.clipsToBounds = YES;
    [saveButton addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
    _saveButton = saveButton;
    [self addSubview:saveButton];
    
    _indexLabel.frame =  CGRectMake(0, 64, Screen_Width, 30);
    _saveButton.frame = CGRectMake((Screen_Width-140)/2, self.bounds.size.height - 60, 140, 30);
}


-(void)saveImage
{
    MBrowserImageView *currImageView = [self getNowImageView];
    
    if (currImageView.imageViewState == MBrowser_ImageView_Success) {
        UIImageWriteToSavedPhotosAlbum(currImageView.showImg.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] init];
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        indicator.center = self.center;
        _indicatorView = indicator;
        [[UIApplication sharedApplication].keyWindow addSubview:indicator];
        [indicator startAnimating];
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    [_indicatorView removeFromSuperview];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.bounds = CGRectMake(0, 0, 150, 30);
    label.center = self.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:17];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:label];
    if (error) {
        label.text = @"保存失败";
    }   else {
        label.text = @"保存成功";
    }
    [label performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
}



-(void)configSubView{
    self.alpha = 0;
    self.backgroundColor=[UIColor blackColor];
    self.frame=CGRectMake(0, 0, Screen_Width, Screen_Height);
    [self addSubview:self.scrollView];
    
    UITapGestureRecognizer *tapGser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disappear)];
    tapGser.numberOfTouchesRequired = 1;
    tapGser.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGser];
    
    UITapGestureRecognizer *doubleTapGser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBig:)];
    doubleTapGser.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTapGser];
    [tapGser requireGestureRecognizerToFail:doubleTapGser];
    
    [self setupToolbars];
}
-(void)changeBig:(UITapGestureRecognizer *)tapGes
{
    MBrowserImageView *yhimageView = [self getNowImageView];
    [yhimageView doubleZoomRect:[tapGes locationInView:tapGes.view]];
    
}
-(UIScrollView*)scrollView{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.backgroundColor = [UIColor blackColor];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

-(void)createBrowserImg
{
    _leftBrowserImgView=[[MBrowserImageView alloc]initWithFrame:CGRectMake(Screen_Width*0, 0,Screen_Width , Screen_Height)];
    _midBrowserImgView=[[MBrowserImageView alloc]initWithFrame:CGRectMake(Screen_Width*1, 0,Screen_Width , Screen_Height)];
    _rightBrowserImgView=[[MBrowserImageView alloc]initWithFrame:CGRectMake(Screen_Width*2, 0,Screen_Width , Screen_Height)];
    
    [self.scrollView addSubview:_leftBrowserImgView];
    [self.scrollView addSubview:_midBrowserImgView];
    [self.scrollView addSubview:_rightBrowserImgView];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 3, 0);
    
}


-(void)setUrlImgArr:(NSArray<NSString *> *)urlImgArr{
    if(urlImgArr!=_urlImgArr)
    {
        _urlImgArr=urlImgArr;
        _calcIndex=0;
        [self refreshData];
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", _calcIndex+1,(long)self.urlImgArr.count];
        
    }
}

-(void)setIndexTag:(NSInteger)indexTag{
    
    if(_indexTag!=indexTag)
    {
        _indexTag=indexTag;
        [self ifNeedScroll:indexTag];
        [self refreshData];
    }
}

-(void)ifNeedScroll:(NSInteger)tag{
    if(tag>_urlImgArr.count-1){
        tag=0;
    }
    if(tag>0&&tag<_urlImgArr.count-2)
    {
        [self.scrollView setContentOffset:CGPointMake(Screen_Width,0) animated:NO];
        _calcIndex=tag-1;
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", _calcIndex+2,(long)self.urlImgArr.count];
        
    }else if(tag==_urlImgArr.count-1)// 最后一个图 需要滚动到最后
    {
        if (_urlImgArr.count == 1) {
            _calcIndex = 0;
            _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", tag+1,(long)self.urlImgArr.count];
            [self.scrollView setContentOffset:CGPointMake(0,0) animated:NO];
        }else if (_urlImgArr.count == 2) {
            _calcIndex = 0;
            _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", tag+1,(long)self.urlImgArr.count];
            [self.scrollView setContentOffset:CGPointMake(Screen_Width,0) animated:NO];

        }else{
            _calcIndex=tag-2;
            _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", _calcIndex+3,(long)self.urlImgArr.count];
            [self.scrollView setContentOffset:CGPointMake(Screen_Width*2,0) animated:NO];
        }

    }
    else{
        _calcIndex=tag;
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", _calcIndex+1,(long)self.urlImgArr.count];
        
    }
}


- (void)disappear{
    // 非源头图片 点击消失 动画区别
    if(self.curentIndex==_indexTag&&!CGRectIsEmpty(_sourceRect)&&_sourceView){
        [self restoreViewAnimation];
    }else{
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    
}

-(void)openImgAnimayion{
    
    if(CGRectIsEmpty(_sourceRect)||_sourceView==nil){
        [UIView animateWithDuration:0.4f animations:^{
            self.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
        }];
    }else{
        self.alpha = 1;
        UIImageView *tempView = [[UIImageView alloc] init];
        tempView.contentMode=UIViewContentModeScaleAspectFit;
        
        [tempView m_setImageWithURL:[NSURL URLWithString:_urlImgArr[_indexTag]] placeholderImage:nil];
        
        CGRect rect = [self.sourceView convertRect:self.sourceRect toView:self];
        
        tempView.frame = rect;
        
        [self addSubview:tempView];
        _scrollView.hidden = YES;
        [UIView animateWithDuration:0.4f animations:^{
            tempView.center = self.center;
            tempView.bounds = (CGRect){CGPointZero, self.bounds.size};
        } completion:^(BOOL finished) {
            _hasShowedFistView = YES;
            [tempView removeFromSuperview];
            _scrollView.hidden = NO;
        }];
    }
}
-(void)restoreViewAnimation{
    _scrollView.hidden = YES;
    MBrowserImageView *bimageView=[self getNowImageView];
    UIImageView *tempView = [[UIImageView alloc] init];
    tempView.contentMode = UIViewContentModeScaleAspectFit;
    tempView.clipsToBounds = YES;
    tempView.image = bimageView.showImg.image;
    CGFloat h = (self.bounds.size.width / bimageView.showImg.image.size.width) * bimageView.showImg.image.size.height;
    
    if (!bimageView.showImg.image) { // 防止 因imageview的image加载失败 导致 崩溃
        h = self.bounds.size.height;
    }
    
    tempView.bounds = CGRectMake(0, 0, self.bounds.size.width, h);
    tempView.center = self.center;
    [self addSubview:tempView];
    CGRect rect = [self.sourceView convertRect:self.sourceRect toView:self];
    
    _saveButton.hidden = YES;
    [UIView animateWithDuration:0.3f animations:^{
        tempView.frame = rect;
        self.backgroundColor = [UIColor clearColor];
        _indexLabel.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)show
{
    UIWindow *window=[[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    
}
/**数据刷新*/
- (void)refreshData {
    if(_urlImgArr.count<3)
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width *_urlImgArr.count, 0);
    
    [self updateSubImageView:_calcIndex with:0];
    [self updateSubImageView:_calcIndex+1 with:1];
    [self updateSubImageView:_calcIndex+2 with:2];
}

- (void)updateSubImageView:(NSInteger)pageIndex with:(NSInteger)index {
    if(pageIndex>_urlImgArr.count-1)
        return;
    
    if(index==0){
        [_leftBrowserImgView setImageWithURL:[NSURL URLWithString:_urlImgArr[pageIndex]] placeholderImage:nil];
        _leftBrowserImgView.tag=pageIndex;
    }
    else if(index==1){
        [_midBrowserImgView setImageWithURL:[NSURL URLWithString:_urlImgArr[pageIndex]] placeholderImage:nil];
        _midBrowserImgView.tag=pageIndex;
    }
    else{
        [_rightBrowserImgView setImageWithURL:[NSURL URLWithString:_urlImgArr[pageIndex]] placeholderImage:nil];
        _rightBrowserImgView.tag=pageIndex;
    }
}

-(void)resetZoomState:(NSInteger)index{
    
    if (_leftBrowserImgView.imageScrollView.zoomScale != 1.0)
        _leftBrowserImgView.imageScrollView.zoomScale=1.0;
    if (_midBrowserImgView.imageScrollView.zoomScale != 1.0)
        _midBrowserImgView.imageScrollView.zoomScale=1.0;
    if (_rightBrowserImgView.imageScrollView.zoomScale != 1.0)
        _rightBrowserImgView.imageScrollView.zoomScale=1.0;
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGPoint offset = _scrollView.contentOffset;
    NSInteger subViewIndex = offset.x / self.frame.size.width ;
    [self resetZoomState:subViewIndex];
    if(subViewIndex==0)// 上一页
    {
        if(_calcIndex>0){
            _calcIndex--;
            [self refreshData];
            [self.scrollView setContentOffset:CGPointMake(Screen_Width,0) animated:NO];
            
        }
    }else if(subViewIndex==2){ //下一页
        NSInteger lastIndex=_urlImgArr.count-3;
        if(_calcIndex<lastIndex) {
            _calcIndex++;
            [self refreshData];
            [self.scrollView setContentOffset:CGPointMake(Screen_Width,0) animated:NO];
        }
    }
    _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", self.curentIndex+1,(long)self.urlImgArr.count];
}

-(NSInteger)curentIndex
{
    _curentIndex=[self getNowPage];
    return _curentIndex;
}


-(NSInteger)getNowPage{
    CGPoint leftPoint=CGPointMake(0, 0);
    CGPoint midPoint=CGPointMake(Screen_Width, 0);
    CGPoint point=self.scrollView.contentOffset;
    NSURL* urlname;
    NSInteger page=0;
    
    if(CGPointEqualToPoint(point, leftPoint)){
        urlname=_leftBrowserImgView.mainUrl;
        page=_leftBrowserImgView.tag;
        
    }else if(CGPointEqualToPoint(point, midPoint)){
        urlname=_midBrowserImgView.mainUrl;
        page=_midBrowserImgView.tag;
        
    }else {
        urlname=_rightBrowserImgView.mainUrl;
        page=_rightBrowserImgView.tag;
    }
    return page;
    
}

-(MBrowserImageView*)getNowImageView{
    CGPoint leftPoint=CGPointMake(0, 0);
    CGPoint midPoint=CGPointMake(Screen_Width, 0);
    CGPoint point=self.scrollView.contentOffset;
    
    if(CGPointEqualToPoint(point, leftPoint)){
        return _leftBrowserImgView;
    }else if(CGPointEqualToPoint(point, midPoint)){
        return _midBrowserImgView;
    }else {
        return _rightBrowserImgView;
    }
}


@end
