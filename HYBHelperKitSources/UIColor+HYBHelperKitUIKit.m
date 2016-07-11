//
//  UIColor+HYBHelperKitUIKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIColor+HYBHelperKitUIKit.h"

@implementation UIColor (HYBHelperKitUIKit)

- (UIImage *)hyb_toImage {
  return [UIColor hyb_imageWithColor:self];
}

+ (UIImage *)hyb_imageWithColor:(UIColor *)color {
  return [self hyb_imageWithColor:color size:CGSizeMake(1, 1)];
}

- (UIImage *)hyb_toImageWithSize:(CGSize)size {
  return [UIColor hyb_imageWithColor:self size:size];
}

+ (UIImage *)hyb_imageWithColor:(UIColor *)color size:(CGSize)size {
  CGRect rect = CGRectMake(0, 0, size.width, size.height);
  
  UIGraphicsBeginImageContext(size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, color.CGColor);
  CGContextFillRect(context, rect);
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
