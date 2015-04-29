//
//  UIImage+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ghost)
//=============================================================================
/// @name Create image
///=============================================================================
/**
 *  将色值返回为1x1像素的png图片
 *
 *  @param color UIColor
 *
 *  @return 返回为1x1像素的png图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 *   重置图片大小
 *
 *  @param size 大小
 *
 *  @return 新的图片
 */
- (UIImage *)imageScaledToSize:(CGSize)size;

///=============================================================================
/// @name Get info from image
///=============================================================================

/**
 *  获取该图片的某像素点的颜色
 *
 *  @param point 点坐标
 *
 *  @return 返回UIColor 或者错误(nil)
 */
- (UIColor *)colorAtPoint:(CGPoint )point;




/**
 *  给图片加圆角
 *
 *  @param image  图片
 *  @param size   大小
 *  @param radius 圆角
 *
 *  @return
 */
+ (UIImage *)createRoundedRectImage:(UIImage *)image size:(CGSize)size roundRadius:(CGFloat)radius;


/**
 *  返回该图片是否有透明度通道
 *
 *  @return YES, NO
 */
- (BOOL)hasAlphaChannel;


/**
 *  九宫格图片拉伸
 *
 *  @return UIImage
 */
-(UIImage *)ImageWithLeftCapWidth;


/**
 *  获取截图view的图片
 *
 *  @param uiview 截图的view
 *  @param size   截图的大小
 *
 *  @return
 */
-(UIImage *)getScreenshotImage:(UIView *)uiview size:(CGSize)size;




/**
 *  毛玻璃
 *
 *  @param blurRadius
 *  @param tintColor
 *  @param saturationDeltaFactor
 *  @param maskImage
 *
 *  @return
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage didCancel:(BOOL (^)())didCancel;


/*
 UIImage *animation = [UIImage animatedImageWithAnimatedGIFData:theData];
 
 I interpret `theData` as a GIF.  I create an animated `UIImage` using the source images in the GIF.
 
 The GIF stores a separate duration for each frame, in units of centiseconds (hundredths of a second).  However, a `UIImage` only has a single, total `duration` property, which is a floating-point number.
 
 To handle this mismatch, I add each source image (from the GIF) to `animation` a varying number of times to match the ratios between the frame durations in the GIF.
 
 For example, suppose the GIF contains three frames.  Frame 0 has duration 3.  Frame 1 has duration 9.  Frame 2 has duration 15.  I divide each duration by the greatest common denominator of all the durations, which is 3, and add each frame the resulting number of times.  Thus `animation` will contain frame 0 3/3 = 1 time, then frame 1 9/3 = 3 times, then frame 2 15/3 = 5 times.  I set `animation.duration` to (3+9+15)/100 = 0.27 seconds.
 */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;

/*
 UIImage *image = [UIImage animatedImageWithAnimatedGIFURL:theURL];
 
 I interpret the contents of `theURL` as a GIF.  I create an animated `UIImage` using the source images in the GIF.
 
 I operate exactly like `+[UIImage animatedImageWithAnimatedGIFData:]`, except that I read the data from `theURL`.  If `theURL` is not a `file:` URL, you probably want to call me on a background thread or GCD queue to avoid blocking the main thread.
 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

@end
