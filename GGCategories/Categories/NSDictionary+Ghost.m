//
//  NSDictionary+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "NSDictionary+Ghost.h"

#define kEncodeKey @"kEncodeKey"

@implementation NSDictionary (Ghost)
+ (NSData*)dictionaryToData:(NSDictionary *)dic{
    NSMutableData* data = [[NSMutableData alloc]init];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:dic forKey:kEncodeKey];
    [archiver finishEncoding];
    return data;
}

+ (NSDictionary *)dictionaryFromData:(NSData *)data{
    NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSDictionary* dictionary = [unarchiver decodeObjectForKey:kEncodeKey];
    [unarchiver finishDecoding];
    return dictionary;
}

-(NSString *)JSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end
