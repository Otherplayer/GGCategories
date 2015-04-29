//
//  NSDictionary+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Ghost)

+ (NSData*)dictionaryToData:(NSDictionary *)dict;
+ (NSDictionary *)dictionaryFromData:(NSData *)data;

- (NSString *)JSONString;

@end
