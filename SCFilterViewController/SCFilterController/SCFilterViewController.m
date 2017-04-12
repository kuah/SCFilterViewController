//
//  SCFilterViewController.m
//  ReedConnectV2
//
//  Created by 陈世翰 on 17/2/20.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import "SCFilterViewController.h"

@interface SCFilterViewController (){
    UITapGestureRecognizer *_tapG;
    UIPanGestureRecognizer *_panG;
}
@end

@implementation SCFilterViewController
-(BOOL)isShow{
    return !self.view.hidden;
}

-(CGFloat)bgMaxAlpha{
    if (_bgMaxAlpha <= 0 || _bgMaxAlpha>1) {
        _bgMaxAlpha = 0.8;
    }
    return _bgMaxAlpha;
}
-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView=  [UIButton new];
        _backgroundView.backgroundColor = [UIColor blackColor];
    }
    if (![_backgroundView isKindOfClass:[UIButton class]] &&(!_tapG || ![_backgroundView.gestureRecognizers containsObject:_tapG])) {
        _tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideFromSuperview)];
        [_backgroundView addGestureRecognizer:_tapG];
    }else if ([_backgroundView isKindOfClass:[UIButton class]]){
        if (((UIButton *)_backgroundView).allTargets.count==0) {
             [((UIButton *)_backgroundView) addTarget:self action:@selector(hideFromSuperview) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    if(!_panG || ![_backgroundView.gestureRecognizers containsObject:_panG]){
        _panG = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [_backgroundView addGestureRecognizer:_panG];
    }
    return  _backgroundView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)initWithFrame:(CGRect)frame targetFrame:(CGRect)targetFrame animationDuration:(CGFloat)duration backgroundView:(UIView *)backgroundView{
    self  = [super init];
    _originFrame = frame;
    _targetFrame = targetFrame;
    _animationDuration = duration;
    _backgroundView = backgroundView;
    self.view.hidden = YES;
    self.backgroundView.hidden = YES;
    self.view.frame = _originFrame;
    return self;
}
#pragma mark -cycle
-(CGRect)willShowInView:(UIView *)superView targetFrame:(CGRect)targetframe{
    return targetframe;
}
-(CGRect)willHideWithOriginFrame:(CGRect)originFrame{
    return originFrame;
}
-(void)didShowInView:(UIView *)superView viewController:(SCFilterViewController *)filterViewController{
}
-(void)didHide:(SCFilterViewController *)filterViewController{
}
#pragma mark -public
- (void)showInView:(UIView *)superView {
    if (self.view.superview) {
        [self.view removeFromSuperview];
        [self.backgroundView removeFromSuperview];
    }
    self.backgroundView.hidden = NO;
    self.view.hidden = NO;
    self.backgroundView.alpha = 0;
    [superView addSubview:self.backgroundView];
    self.backgroundView.frame = superView.bounds;
    self.view.frame = _originFrame;
    CGRect frame = _targetFrame;
    self.backgroundView.alpha = 0.0;
    [superView addSubview:self.view];
    CGRect endFrame = frame;
    endFrame =  [self willShowInView:superView targetFrame:endFrame];
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = endFrame;
        self.backgroundView.alpha = self.bgMaxAlpha;
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self didShowInView:superView viewController:self];
        }
    }];
}

- (void)hideFromSuperview {
    [self hideFromSuperviewWithDuration:0.2 completion:nil];
}
-(void)hideFromSuperviewWithDuration:(CGFloat)duration completion:(void (^)())completion{
    if (duration<=0) {
        duration = 0.2;
    }
    CGRect endFrame = [self willHideWithOriginFrame:_originFrame];
    [UIView animateWithDuration:duration/2.f animations:^{
        self.backgroundView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:duration animations:^{
                self.view.frame = endFrame;
                self.backgroundView.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self didHide:self];
                    self.view.hidden = YES;
                    self.backgroundView.hidden = YES;
                    if (completion) {
                        completion();
                    }
                }
            }];
        }
    }];
}

-(void)handlePan:(UIPanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self hideFromSuperview];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
