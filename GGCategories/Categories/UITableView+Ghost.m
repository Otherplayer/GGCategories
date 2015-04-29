//
//  UITableView+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UITableView+Ghost.h"

@implementation UITableView (Ghost)
- (void)blankTableFooterView {
    [self setTableFooterView:[[UIView alloc] init]];
}

@end
