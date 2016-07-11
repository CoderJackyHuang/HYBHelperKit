//
//  UIControl+HYBHelperBlockKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIControl+HYBHelperBlockKit.h"
#import <objc/runtime.h>

static const void *s_HYBButtonTouchUpKey = "s_HYBButtonTouchUpKey";
static const void *s_HYBButtonTouchDownKey = "s_HYBButtonTouchDownKey";
static const void *s_HYBOnValueChangedKey = "s_HYBOnValueChangedKey";
static const void *s_HYBOnEditChangedKey = "s_HYBOnEditChangedKey";

@implementation UIControl (HYBHelperBlockKit)

- (HYBButtonBlock)hyb_onTouchUp {
  return objc_getAssociatedObject(self, s_HYBButtonTouchUpKey);
}

- (void)setHyb_onTouchUp:(HYBButtonBlock)hyb_onTouchUp {
  objc_setAssociatedObject(self, s_HYBButtonTouchUpKey, hyb_onTouchUp, OBJC_ASSOCIATION_COPY_NONATOMIC);
  
  [self removeTarget:self
              action:@selector(hyb_private_onTouchUp:)
    forControlEvents:UIControlEventTouchUpInside];
  
  if (hyb_onTouchUp) {
    [self addTarget:self
             action:@selector(hyb_private_onTouchUp:)
   forControlEvents:UIControlEventTouchUpInside];
  }
}

- (HYBButtonBlock)hyb_onTouchDown {
  return objc_getAssociatedObject(self, s_HYBButtonTouchDownKey);
}

- (void)setHyb_onTouchDown:(HYBButtonBlock)hyb_onTouchDown {
  [self removeTarget:self
              action:@selector(hyb_private_onTouchDown:)
    forControlEvents:UIControlEventTouchDown];
  
  if (hyb_onTouchDown) {
    [self addTarget:self
             action:@selector(hyb_private_onTouchDown:)
   forControlEvents:UIControlEventTouchDown];
  }
  
  objc_setAssociatedObject(self,
                           s_HYBButtonTouchDownKey,
                           hyb_onTouchDown,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (HYBValueChangedBlock)hyb_onValueChanged {
  return objc_getAssociatedObject(self, s_HYBOnValueChangedKey);
}

- (void)setHyb_onValueChanged:(HYBValueChangedBlock)hyb_onValueChanged {
  objc_setAssociatedObject(self,
                           s_HYBOnValueChangedKey,
                           hyb_onValueChanged,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
  
  [self removeTarget:self
              action:@selector(hyb_private_onValueChanged:)
    forControlEvents:UIControlEventValueChanged];
  
  if (hyb_onValueChanged) {
    [self addTarget:self
             action:@selector(hyb_private_onValueChanged:)
   forControlEvents:UIControlEventValueChanged];
  }
}

- (HYBEditChangedBlock)hyb_onEditChanged {
  return objc_getAssociatedObject(self, s_HYBOnEditChangedKey);
}

- (void)setHyb_onEditChanged:(HYBEditChangedBlock)hyb_onEditChanged {
  objc_setAssociatedObject(self,
                           s_HYBOnEditChangedKey,
                           hyb_onEditChanged,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
  
  [self removeTarget:self
              action:@selector(hyb_private_onEditChanged:)
    forControlEvents:UIControlEventEditingChanged];
  
  if (hyb_onEditChanged) {
    [self addTarget:self
             action:@selector(hyb_private_onEditChanged:)
   forControlEvents:UIControlEventEditingChanged];
  }
}

#pragma mark - Private
- (void)hyb_private_onTouchUp:(id)sender {
  HYBButtonBlock block = [self hyb_onTouchUp];
  
  if (block) {
    block(sender);
  }
}

- (void)hyb_private_onTouchDown:(id)sender {
  HYBButtonBlock block = [self hyb_onTouchDown];
  
  if (block) {
    block(sender);
  }
}

- (void)hyb_private_onValueChanged:(id)sender {
  HYBValueChangedBlock block = [self hyb_onValueChanged];
  
  if (block) {
    block(sender);
  }
}

- (void)hyb_private_onEditChanged:(id)sender {
  HYBEditChangedBlock block = [self hyb_onEditChanged];
  
  if (block) {
    block(sender);
  }
}

@end
