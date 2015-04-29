//
//  UILabel+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/28.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Ghost)
/**
 *  调整以适应
 *
 *  @return
 */
-(float)resizeToFit:(float)with;



/**
 *  预期的高度
 *
 *  @return
 */
-(float)expectedHeight:(float)with;




/**
 *  计算UIlabel的内容的大小
 *
 *  @return
 */
-(CGSize)contentSize;

- (CGSize)suggestedSizeForWidth:(CGFloat)width;
- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
