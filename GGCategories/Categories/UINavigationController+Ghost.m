//
//  UINavigationController+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UINavigationController+Ghost.h"

@implementation UINavigationController (Ghost)
- (void)applyAppDefaultApprence{
    [self applyApprenceWithBarTintColor:[UIColor redColor] fontColor:[UIColor whiteColor]];
}

- (void)applyApprenceWithBarTintColor:(UIColor *)tintColor fontColor:(UIColor *)fontColor{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UINavigationBar *navigationBar = self.navigationBar;
    
    [navigationBar setTitleTextAttributes:@{
                                            NSFontAttributeName : [UIFont systemFontOfSize:20.f],
                                            NSForegroundColorAttributeName : fontColor,
                                            }];
    [navigationBar setTintColor:fontColor];    //设置字体颜色
    [navigationBar setBarTintColor:tintColor]; //设置背景色
    [navigationBar setTranslucent:YES];        //关透明
}

- (void)setHide:(BOOL)hide{
    [self setNavigationBarHidden:hide animated:YES];
}
@end
