//
//  UIGestureRecognizer+HYBHelperBlockKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIGestureRecognizer+HYBHelperBlockKit.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (HYBHelperBlockKit)

- (HYBGestureBlock)hyb_onGesture {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setHyb_onGesture:(HYBGestureBlock)hyb_onGesture {
  objc_setAssociatedObject(self, _cmd, hyb_onGesture, OBJC_ASSOCIATION_COPY);
 
  [self removeTarget:self action:@selector(hyb_private_onGesture:)];
  
  if (hyb_onGesture) {
    [self addTarget:self action:@selector(hyb_private_onGesture:)];
  }
}

- (HYBTapGestureBlock)hyb_onTaped {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setHyb_onTaped:(HYBTapGestureBlock)hyb_onTaped {
  objc_setAssociatedObject(self, _cmd, hyb_onTaped, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(hyb_private_onTaped:)];
  
  if (hyb_onTaped) {
    [self addTarget:self action:@selector(hyb_private_onTaped:)];
  }
}

- (HYBLongGestureBlock)hyb_onLongPressed {
  return objc_getAssociatedObject(self, _cmd);
}

- (void)setHyb_onLongPressed:(HYBLongGestureBlock)hyb_onLongPressed {
  objc_setAssociatedObject(self, _cmd, hyb_onLongPressed, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(hyb_private_onLongPressed:)];
  
  if (hyb_onLongPressed) {
    [self addTarget:self action:@selector(hyb_private_onLongPressed:)];
  }
}

#pragma mark - Private
- (void)hyb_private_onGesture:(UIGestureRecognizer *)sender {
  HYBGestureBlock block = [self hyb_onGesture];
  
  if (block) {
    block(sender);
  }
}

- (void)hyb_private_onTaped:(UITapGestureRecognizer *)sender {
  HYBTapGestureBlock block = [self hyb_onTaped];
  
  if (block) {
    block(sender);
  }
}

- (void)hyb_private_onLongPressed:(UILongPressGestureRecognizer *)sender {
  HYBLongGestureBlock block = [self hyb_onLongPressed];
  
  if (block) {
    block(sender);
  }
}


@end
