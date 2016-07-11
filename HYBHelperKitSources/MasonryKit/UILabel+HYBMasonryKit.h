//
//  UILabel+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

@interface UILabel (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	By default, create a label which it has black text color, and the font size.
 *  Label will be aligned to left, and set to only one line, no constraints.
 *
 *	@return Instance of UILabel.
 */
+ (instancetype)hyb_labelWithFont:(CGFloat)font;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	By default, create a label which it has black text color, and the font size.
 *  Label will be aligned to left, and set to only one line, no constraints.
 *
 *
 *	@param text	The default text
 *	@param font	The font size
 *
 *	@return Instance of UILabel.
 */
+ (instancetype)hyb_labelWithText:(NSString *)text
                             font:(CGFloat)font;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a label with font, super view and constraints.
 *
 *	@param font				  The font size of UILabel.
 *	@param superView		The label's super view.
 *	@param constraints	The constraints added to the label.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_labelWithFont:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints;
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a label with text, font size, super view and constraints.
 *  It will only have one line.
 *
 *	@param text				The default text
 *	@param font				The font size
 *	@param superView		The super view of label.
 *	@param constraints	The constraints.
 *
 *	@return Instance of UILabel.
 */
+ (instancetype)hyb_labelWithText:(NSString *)text
                             font:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a label with text, font size, super view and constraints.
 *
 *	@param text				The default text
 *	@param font				The font size
 *  @param lines      How many lines.
 *	@param superView		The super view of label.
 *	@param constraints	The constraints.
 *
 *	@return Instance of UILabel.
 */
+ (instancetype)hyb_labelWithText:(NSString *)text
                             font:(CGFloat)font
                            lines:(NSInteger)lines
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints;

@end
