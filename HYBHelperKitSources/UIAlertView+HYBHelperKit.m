//
//  UIAlertView+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/15.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIAlertView+HYBHelperKit.h"
#import <objc/runtime.h>
#import "HYBCommonKit.h"
#import "NSArray+HYBHelperKit.h"

static const void *s_privateAlertViewKey = "s_privateAlertViewKey";

@interface UIApplication (HDFAlertView) <UIAlertViewDelegate>

@end

@implementation UIApplication (HDFAlertView)

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (alertView.hyb_clickedButtonBlock) {
    alertView.hyb_clickedButtonBlock(alertView, buttonIndex);
  }
}

@end

@implementation UIAlertView (HYBHelperKit)

- (void)setHyb_clickedButtonBlock:(HYBAlertClickedButtonBlock)clickedButtonBlock {
  objc_setAssociatedObject(self,
                           s_privateAlertViewKey,
                           clickedButtonBlock,
                           OBJC_ASSOCIATION_COPY);
}

- (HYBAlertClickedButtonBlock)hyb_clickedButtonBlock {
  return objc_getAssociatedObject(self, s_privateAlertViewKey);
}

+ (instancetype)hyb_showWithTitle:(NSString *)title
                          message:(NSString *)message
                     buttonTitles:(NSArray *)buttonTitles
                            block:(HYBAlertClickedButtonBlock)block {
  NSString *ok = nil;
  if (kIsArray(buttonTitles) && buttonTitles.count > 0) {
    ok = [buttonTitles hyb_objectAtIndex:0];
  }
  
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                      message:message
                                                     delegate:[UIApplication sharedApplication]
                                            cancelButtonTitle:ok
                                            otherButtonTitles:
                            [buttonTitles hyb_objectAtIndex:1],
                            [buttonTitles hyb_objectAtIndex:2],
                            [buttonTitles hyb_objectAtIndex:3],
                            [buttonTitles hyb_objectAtIndex:4],
                            [buttonTitles hyb_objectAtIndex:5],
                            [buttonTitles hyb_objectAtIndex:6],
                            [buttonTitles hyb_objectAtIndex:7],
                            [buttonTitles hyb_objectAtIndex:8],
                            [buttonTitles hyb_objectAtIndex:9],
                            [buttonTitles hyb_objectAtIndex:10],
                            [buttonTitles hyb_objectAtIndex:11],
                            [buttonTitles hyb_objectAtIndex:12],
                            [buttonTitles hyb_objectAtIndex:13],
                            [buttonTitles hyb_objectAtIndex:14],
                            nil];
  alertView.hyb_clickedButtonBlock = block;
  
  [alertView show];
  
  return alertView;
}

@end
