//
//  UIApplication+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/28.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Ghost)
/**
 *  判断此app是否是盗版(不是appstore的产品)
 *
 *  @return YES, NO
 */
- (BOOL)isPirated;
@end
