//
//  UIView+HYBHelperKitUIKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIView+HYBHelperKitUIKit.h"

@implementation UIView (HYBHelperKitUIKit)

- (void)setHyb_origin:(CGPoint)hyb_origin {
  CGRect frame = self.frame;
  frame.origin = hyb_origin;
  self.frame = frame;
}

- (CGPoint)hyb_origin {
  return self.frame.origin;
}

- (void)setHyb_originX:(CGFloat)hyb_originX {
  [self setHyb_origin:CGPointMake(hyb_originX, self.hyb_originY)];
}

- (CGFloat)hyb_originX {
  return self.hyb_origin.x;
}

- (void)setHyb_originY:(CGFloat)hyb_originY {
  [self setHyb_origin:CGPointMake(self.hyb_originX, hyb_originY)];
}

- (CGFloat)hyb_originY {
  return self.hyb_origin.y;
}

- (void)setHyb_center:(CGPoint)hyb_center {
  self.center = hyb_center;
}

- (CGPoint)hyb_center {
  return self.center;
}

- (void)setHyb_centerX:(CGFloat)hyb_centerX {
  [self setHyb_center:CGPointMake(hyb_centerX, self.hyb_centerY)];
}

- (CGFloat)hyb_centerX {
  return self.hyb_center.x;
}

- (void)setHyb_centerY:(CGFloat)hyb_centerY {
  [self setHyb_center:CGPointMake(self.hyb_centerX, hyb_centerY)];
}

- (CGFloat)hyb_centerY {
  return self.hyb_center.y;
}

- (void)setHyb_size:(CGSize)hyb_size {
  CGRect frame = self.frame;
  frame.size = hyb_size;
  self.frame = frame;
}

- (CGSize)hyb_size {
  return self.frame.size;
}

- (void)setHyb_width:(CGFloat)hyb_width {
  self.hyb_size = CGSizeMake(hyb_width, self.hyb_height);
}

- (CGFloat)hyb_width {
  return self.hyb_size.width;
}

- (void)setHyb_height:(CGFloat)hyb_height {
  self.hyb_size = CGSizeMake(self.hyb_width, hyb_height);
}

- (CGFloat)hyb_height {
  return self.hyb_size.height;
}

- (CGFloat)hyb_bottomY {
  return self.hyb_originY + self.hyb_height;
}

- (void)setHyb_bottomY:(CGFloat)hyb_bottomY {
  self.hyb_originY = hyb_bottomY - self.hyb_height;
}

- (CGFloat)hyb_rightX {
  return self.hyb_originX + self.hyb_width;
}

- (void)setHyb_rightX:(CGFloat)hyb_rightX {
  self.hyb_originX = hyb_rightX - self.hyb_width;
}

@end
