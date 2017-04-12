//
//  SCCustomFilterViewController.h
//  ReedConnectV2
//
//  Created by 陈世翰 on 17/2/21.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import "SCFilterViewController.h"


#define RR_FILTER_LEADING_RATIO 0.15
#define RR_FILTER_DEFAULT_ANIMATION_DURATION 0.2
@interface SCCustomFilterViewController : SCFilterViewController
-(instancetype)initWithSuperView:(UIView *)superView;

@end
