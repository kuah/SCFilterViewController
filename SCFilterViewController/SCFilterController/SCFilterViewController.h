//
//  SCFilterViewController.h
//  ReedConnectV2
//
//  Created by 陈世翰 on 17/2/20.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCFilterViewController : UIViewController
/**
 *   初始frame
 */
@property (nonatomic,assign)CGRect originFrame;
/**
 *   动画结束的frame
 */
@property (nonatomic,assign)CGRect targetFrame;
/**
 *   动画持续时间
 */
@property (nonatomic,assign)CGFloat animationDuration;
/**
 *   backGroundView
 */
@property (nonatomic,strong)UIView  *backgroundView;
/**
 *   background的最大alpha
 */
@property (nonatomic,assign)CGFloat bgMaxAlpha;
/**
 *   是否显示
 */
@property (nonatomic,assign,readonly)BOOL isShow;
/**
 *  @brief 将要执行动画
 *  @param superView 显示在哪个view上
 *  @targetframe 动画目标位置
 *  @return 支持更改目标位置
 */
-(CGRect)willShowInView:(UIView *)superView targetFrame:(CGRect)targetframe;
/**
 *  @brief 将要执行动画
 *  @targetframe 动画目标位置
 *  @return 支持更改目标位置
 */
-(CGRect)willHideWithOriginFrame:(CGRect)originFrame;
/**
 *  @brief 显示动画执行完毕
 *  @param superView 父控件
 *  @param filterViewController 当前执行的vc
 */
-(void)didShowInView:(UIView *)superView viewController:(SCFilterViewController *)filterViewController;
/**
 *  @brief 显示动画执行完毕
 *  @param filterViewController 当前执行的vc
 */
-(void)didHide:(SCFilterViewController *)filterViewController;

#pragma mark operation
/**
 *  @brief 显示
 *  @param superView 父视图
 */
- (void)showInView:(UIView *)superView;

/**
 *  @brief 隐藏
 */
- (void)hideFromSuperview;
/**
 *  @brief 隐藏
 *  @param duration 动画时间
 *  @param completion 完成回调
 */
-(void)hideFromSuperviewWithDuration:(CGFloat)duration completion:(void (^)())completion;
/**
 *  @brief 构造方法
 *  @param frame vc的frame 初始位置
 *  @param targetFrame 动画目标位置
 *  @param duration 动画持续时间
 *  @return filterVC
 */
-(instancetype)initWithFrame:(CGRect)frame targetFrame:(CGRect)targetFrame animationDuration:(CGFloat)duration backgroundView:(UIView *)backgroundView;
@end
