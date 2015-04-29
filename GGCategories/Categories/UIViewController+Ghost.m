//
//  UIViewController+Ghost.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/24.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "UIViewController+Ghost.h"

@implementation UIViewController (Ghost)
- (void)addSpaceButton{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItems = @[[self spaceButton]];
}

- (void)addBackButton{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItems = @[[self backButton]];
}




- (UIBarButtonItem *)backButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];;
    [button setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (UIBarButtonItem *)spaceButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];;
    [button addTarget:self action:@selector(backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}





- (void)backBarButtonPressed:(id)backBarButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(NSString*)recursiveDescription
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"\n"];
    [self addDescriptionToString:description indentLevel:0];
    
    //    NSString *info = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r %@ \r %@",
    //                      __PRETTY_FUNCTION__, __LINE__,
    //                      [self performSelector:@selector(recursiveDescription)],
    //                      [[self constraints] description],
    //                      [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}

-(void)addDescriptionToString:(NSMutableString*)string indentLevel:(NSInteger)indentLevel
{
    NSString *padding = [@"" stringByPaddingToLength:indentLevel withString:@" " startingAtIndex:0];
    [string appendString:padding];
    [string appendFormat:@"%@, %@",[self debugDescription],NSStringFromCGRect(self.view.frame)];
    
    for (UIViewController *childController in self.childViewControllers)
    {
        [string appendFormat:@"\n%@>",padding];
        [childController addDescriptionToString:string indentLevel:indentLevel + 1];
    }
}

@end
