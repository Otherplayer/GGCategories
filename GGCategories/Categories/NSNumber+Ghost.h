//
//  NSNumber+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Ghost)
/**
 *  创建并返回一个NSNumber对象,用来提取字符串中的数字
 *
 *  @param string  @"12", @"12.345", @" -0xFF", @" .23e99 "..
 *
 *  @return 返回一个NSNumber,返回空,错误
 */
+ (NSNumber *)numberWithString:(NSString *)string;
@end
