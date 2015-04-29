//
//  UIButton+Ghost.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/28.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TouchedBlock)(NSInteger tag);


@interface UIButton (Ghost)

-(void)addActionHandler:(TouchedBlock)touchHandler;

/**
 This method will show the activity indicator in place of the button text.
 */
- (void) showIndicator;

/**
 This method will remove the indicator and put thebutton text back in place.
 */
- (void) hideIndicator;

-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
