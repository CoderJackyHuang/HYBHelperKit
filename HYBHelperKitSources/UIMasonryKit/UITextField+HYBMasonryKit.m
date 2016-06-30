//
//  UITextField+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UITextField+HYBMasonryKit.h"
#import <objc/runtime.h>

@implementation UITextField (HYBMasonryKit)

- (CGFloat)hyb_leftMarginOfCursor {
  NSNumber *number = objc_getAssociatedObject(self, _cmd);
  
  if ([number respondsToSelector:@selector(floatValue)]) {
    return [number floatValue];
  }
  
  return 8.0;
}

- (void)setHyb_leftMarginOfCursor:(CGFloat)hyb_leftMarginOfCursor {
  objc_setAssociatedObject(self,
                           _cmd,
                           @(hyb_leftMarginOfCursor),
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
