//
//  UIStoryboard+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UIStoryboard+Ghost.h"

@implementation UIStoryboard (Ghost)
+ (instancetype)mainStoryboard{
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

#pragma mark -
- (UIViewController *)controller{
    return [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"ViewController"];
}
@end
