//
//  UIColor+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UIColor+Ghost.h"

@implementation UIColor (Ghost)
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue {
    return UIColorRGB(  ((rgbValue & 0xFF0000) >> 16) / 255.0f,
                      ((rgbValue & 0xFF00) >> 8) / 255.0f,
                      (rgbValue & 0xFF) / 255.0f);
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue {
    return UIColorRGBA( ((rgbaValue & 0xFF000000) >> 24) / 255.0f,
                       ((rgbaValue & 0xFF0000) >> 16) / 255.0f,
                       ((rgbaValue & 0xFF00) >> 8) / 255.0f,
                       (rgbaValue & 0xFF) / 255.0f);
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {
    return UIColorRGBA(  ((rgbValue & 0xFF0000) >> 16) / 255.0f,
                       ((rgbValue & 0xFF00) >> 8) / 255.0f,
                       (rgbValue & 0xFF) / 255.0f,
                       alpha);
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (uint32_t)rgbValue {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    uint8_t red = components[0] * 255;
    uint8_t green = components[1] * 255;
    uint8_t blue = components[2] * 255;
    return (red << 16) + (green << 8) + blue;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (uint32_t)rgbaValue {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    uint8_t red = components[0] * 255;
    uint8_t green = components[1] * 255;
    uint8_t blue = components[2] * 255;
    uint8_t alpha = components[3] * 255;
    return (red << 24) + (green << 16) + (blue << 8) + alpha;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
static inline NSUInteger hexStrToInt(NSString *str)
{
    NSUInteger result = 0;
    sscanf([str UTF8String], "%lX", &result);
    return result;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
static BOOL hexStrToRGBA(NSString *str,
                         CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    str = [[str stringByTrim] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)
            *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8)
            *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
+ (UIColor *)colorWithHexString:(NSString *)hexStr {
    CGFloat r, g, b, a;
    if (hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return UIColorRGBA(r, g, b, a);
    }
    return nil;
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (NSString *)hexString {
    return [self hexStringWithAlpha:NO];
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (NSString *)hexStringWithAlpha {
    return [self hexStringWithAlpha:YES];
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (NSString *)hexStringWithAlpha:(BOOL)withAlpha {
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat *components = CGColorGetComponents(color);
    static NSString *stringFormat = @"%02x%02x%02x";
    NSString *hex = nil;
    if (count == 2) {
        NSUInteger white = (NSUInteger)(components[0] * 255.0f);
        hex = [NSString stringWithFormat:stringFormat, white, white, white];
    } else if (count == 4) {
        hex = [NSString stringWithFormat:stringFormat,
               (NSUInteger)(components[0] * 255.0f),
               (NSUInteger)(components[1] * 255.0f),
               (NSUInteger)(components[2] * 255.0f)];
    }
    
    if (hex && withAlpha) {
        hex = [hex stringByAppendingFormat:@"%02lx",
               (unsigned long)(self.alpha * 255.0f)];
    }
    return hex;
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)red {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color))
        != kCGColorSpaceModelRGB) {
        return 0;
    }
    return CGColorGetComponents(color)[0];
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)green {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color))
        != kCGColorSpaceModelRGB) {
        return 0;
    }
    return CGColorGetComponents(color)[1];
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)blue {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color))
        != kCGColorSpaceModelRGB) {
        return 0;
    }
    return CGColorGetComponents(color)[2];
}



///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)hue {
    CGFloat hue = 0, sat, lum, alpha;
    [self getHue:&hue saturation:&sat brightness:&lum alpha:&alpha];
    return hue;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)saturation {
    CGFloat hue, sat = 0, bright, alpha;
    [self getHue:&hue saturation:&sat brightness:&bright alpha:&alpha];
    return sat;
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
- (CGFloat)brightness {
    CGFloat hue, sat, bright = 0, alpha;
    [self getHue:&hue saturation:&sat brightness:&bright alpha:&alpha];
    return bright;
}


@end
