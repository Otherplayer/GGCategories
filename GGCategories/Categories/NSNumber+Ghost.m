//
//  NSNumber+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "NSNumber+Ghost.h"

@implementation NSNumber (Ghost)
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
+ (NSNumber *)numberWithString:(NSString *)string
{
    NSString *str = [[string stringByTrim] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    int sign = 0;
    if ([str hasPrefix:@"0x"])
        sign = 1;
    else if ([str hasPrefix:@"-0x"])
        sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}
@end
