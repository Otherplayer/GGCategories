//
//  UINavigationController+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Ghost)
- (void)applyAppDefaultApprence;
- (void)applyApprenceWithBarTintColor:(UIColor *)tintColor fontColor:(UIColor *)fontColor;

- (void)setHide:(BOOL)hide;
@end
