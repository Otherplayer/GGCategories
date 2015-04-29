//
//  UIApplication+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/28.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UIApplication+Ghost.h"

@implementation UIApplication (Ghost)
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (BOOL)isPirated
{
    
    if ([[[NSBundle mainBundle] infoDictionary]
         objectForKey:@"SignerIdentity"]) {
        return YES;
    }
    
    if (![self _fileExistMainBundle:@"_CodeSignature"]) {
        return YES;
    }
    
    if (![self _fileExistMainBundle:@"CodeResources"])
    {
        return YES;
    }
    
    if (![self _fileExistMainBundle:@"ResourceRules.plist"]) {
        return YES;
    }
    
    //you may test binary's modify time ...but,
    //if someone want to crack your app, this method is useless..
    //you need to change this method's name and do more check..
    return NO;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (BOOL)_fileExistMainBundle:(NSString *)name {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *path = [NSString stringWithFormat:@"%@/%@", bundlePath, name];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}
@end
