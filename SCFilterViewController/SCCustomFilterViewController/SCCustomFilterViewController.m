//
//  SCCustomFilterViewController.m
//  ReedConnectV2
//
//  Created by 陈世翰 on 17/2/21.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import "SCCustomFilterViewController.h"

@interface SCCustomFilterViewController ()

@end

@implementation SCCustomFilterViewController

-(instancetype)initWithSuperView:(UIView *)superView{
    CGFloat leftLeading = ceil(0.2 * superView.frame.size.width);
    CGRect originFrame = CGRectMake(superView.bounds.size.width, 0, superView.bounds.size.width-leftLeading, superView.bounds.size.height);
    CGRect targetFrame = CGRectMake(leftLeading, 0, superView.bounds.size.width-leftLeading, superView.bounds.size.height);
    self = [super initWithFrame:originFrame targetFrame:targetFrame animationDuration:RR_FILTER_DEFAULT_ANIMATION_DURATION backgroundView:[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.bgMaxAlpha = 1;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(CGRect)willShowInView:(UIView *)superView targetFrame:(CGRect)targetframe{
    [super willShowInView:superView targetFrame:targetframe];
  
    return targetframe;
}
-(void)didShowInView:(UIView *)superView viewController:(SCFilterViewController *)filterViewController{
    [super didShowInView:superView viewController:filterViewController];

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
