//
//  UIViewController+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Ghost)
- (void)addSpaceButton;
- (void)addBackButton;


- (UIBarButtonItem *)backButton;
- (UIBarButtonItem *)spaceButton;


- (void)backBarButtonPressed:(id)backBarButtonPressed;


-(NSString*)recursiveDescription;

@end
