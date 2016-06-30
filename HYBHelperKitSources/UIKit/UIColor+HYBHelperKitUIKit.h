//
//  UIColor+HYBHelperKitUIKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HYBHelperKitUIKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Generate an image with current color, and the image size will be set to {1, 1}
 *
 *	@return UIImage instance.
 */
- (UIImage *)hyb_toImage;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Generate an image with the color and size will be {1, 1}
 *
 *	@param color	The color to generate image.
 *
 *	@return UIImage instance.
 */
+ (UIImage *)hyb_imageWithColor:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Generate an image to the specified size with current color.
 *
 *	@param size	The returning image size.
 *
 *	@return The image instance.
 */
- (UIImage *)hyb_toImageWithSize:(CGSize)size;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Generate an image to the specified size with specified color.
 *
 *	@param color	The color to be used to generate an image.
 *	@param size	The result image size.
 *
 *	@return The image instance.
 */
+ (UIImage *)hyb_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
