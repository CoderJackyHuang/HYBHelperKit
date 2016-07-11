//
//  UIView+HYBHelperBlockKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIView+HYBHelperBlockKit.h"
#import <objc/runtime.h>

static const void *s_hyb_tapGestureKey = "s_hyb_tapGestureKey";
static const void *s_hyb_longGestureKey = "s_hyb_longGestureKey";

@implementation UIView (HYBHelperBlockKit)

- (UITapGestureRecognizer *)hyb_tapGesture {
  return objc_getAssociatedObject(self, s_hyb_tapGestureKey);
}

- (UILongPressGestureRecognizer *)hyb_longGesure {
  return objc_getAssociatedObject(self, s_hyb_longGestureKey);
}

- (void)hyb_addTapGestureWithCallback:(HYBTapGestureBlock)onTaped {
  self.userInteractionEnabled = YES;
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
  tap.hyb_onTaped = onTaped;
  [self addGestureRecognizer:tap];
  
  objc_setAssociatedObject(self,
                           s_hyb_tapGestureKey,
                           tap,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hyb_addLongGestureWithCallback:(HYBLongGestureBlock)onLongPressed {
  self.userInteractionEnabled = YES;
  
  UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] init];
  gesture.hyb_onLongPressed = onLongPressed;
  [self addGestureRecognizer:gesture];
  
  objc_setAssociatedObject(self,
                           s_hyb_longGestureKey,
                           gesture,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Private

@end
