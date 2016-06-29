//
//  HYBCommonMacros.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#ifndef HYBCommonMacros_h
#define HYBCommonMacros_h

#pragma mark - Device Frame
// Get the screen's height.
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

// Get the screen's width.
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

// Get the screen's bounds.
#define kScreenBounds ([UIScreen mainScreen].bounds)

#pragma mark - Generate Color

// color
///< format：0xFFFFFF
#define k16RGBColor(rgbValue) \
  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
  green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
  blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

///< format：22,22,22
#define kRGBColor(r, g, b) ([UIColor colorWithRed:(r) / 255.0  \
  green:(g) / 255.0  \
  blue:(b) / 255.0  \
  alpha:1])

///< format：22,22,22,0.5
#define kRGBAColor(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
  green:(g) / 255.0  \
  blue:(b) / 255.0  \
  alpha:(a)])

// More easy way to use hex color to generate color.
#define kHexRGB(rgb) k16RGBColor(rgb)

// More easy way to generate a color object.
#define kRGB(r,g,b) kRGBColor(r,g,b)

// More easy way to generate a color object with rgb and alpha.
#define kRGBA(r,g,b,a) kRGBAColor(r, g, b, a)

#pragma mark - Load Font
// Generate font with size
#define kFontWithSize(size) [UIFont systemFontOfSize:size]

// Generate bold font with size.
#define kBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

#pragma mark - Load Image

// More easy way to load an image.
#define kImage(Name) ([UIImage imageNamed:Name])

// More easy to load an image from file.
#define kImageOfFile(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Name ofType:nil]])

#pragma mark - System Singletons

// More easy way to get user default object.
#define kUserDefaults [NSUserDefaults standardUserDefaults]

// More easy way to get NSNotificationCenter object.
#define kNotificationCenter  [NSNotificationCenter defaultCenter]

// More easy way to get [NSFileManager defaultManager]
#define kFileManager [NSFileManager defaultManager]

// More easy way to post a notification from notification center.
#define kPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]

// More easy way to post a notification with user info from notification center.
#define kPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

#endif /* HYBCommonMacros_h */
