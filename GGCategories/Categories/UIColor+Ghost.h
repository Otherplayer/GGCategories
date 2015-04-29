//
//  UIColor+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorRGB(r, g, b)     [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1]
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]

@interface UIColor (Ghost)
/**
 *  判断红色的参数是否在rgb颜色空间里
 */
@property (nonatomic, readonly) CGFloat red;
/**
 *   判断绿色的参数是否在rgb颜色空间里
 */
@property (nonatomic, readonly) CGFloat green;
/**
 *   判断蓝色的参数是否在rgb颜色空间里
 */
@property (nonatomic, readonly) CGFloat blue;
/**
 *   判断Hue的参数是否在hsb颜色空间里
 */
@property (nonatomic, readonly) CGFloat hue;
/**
 *   判断saturation的参数是否在hsb颜色空间里
 */
@property (nonatomic, readonly) CGFloat saturation;
/**
 *  判断brightness的参数是否在hsb颜色空间里
 */
@property (nonatomic, readonly) CGFloat brightness;
/**
 *   透明度的值是否正确
 */
@property (nonatomic, readonly) CGFloat alpha;


/**
 *  创建并返回一个十六进制的rgb色值(0x----)的颜色
 *
 *  @param rgb值 rgb值(0x66ccff)
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGB:(uint32_t)rgbValue;
/**
 *  创建并返回一个十六进制的RGBA的色值(0x------)的颜色
 *
 *  @param rgba值 (0x66ccffff)
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGBA:(uint32_t)rgbaValue;
/**
 *  创建并返回一个由 十六进制的RGB色值和透明度组成的颜色
 *
 *  @param rgbValue rgb值(0x66ccff)
 *  @param alpha    透明度
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;
/**
 *  创建一个由十六进制字符串(#------)的颜色
 *
 *  @param hexStr  #rgb #rgba #rrggbb #rrggbbaa 0xrgb
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexStr;
///=============================================================================
/// @name Get color's description
///=============================================================================

/**
 *  将rgb颜色转换为十六进制(0x----)
 *
 *  @return hex的RGB值(0x66ccff)
 */
- (uint32_t)rgbValue;
/**
 *  将rgba颜色转换为十六进制(0x------)
 *
 *  @return hex的RGBA值(0x66ccffff)
 */
- (uint32_t)rgbaValue;
/**
 *  将RGB颜色转换为十六进制字符串,不包含#和大写
 *
 *  @return 0066cc
 */
- (NSString *)hexString;
/**
 *  将RGBA颜色转换为十六进制字符串,不包含#和大写
 *
 *  @return 0066ccff
 */
- (NSString *)hexStringWithAlpha;

@end
