//
//  UITextField+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperBlocksKit.h"

@interface UITextField (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	If you want to specify a left margin before cursor, just define this.
 *
 *  @default The default value is 8px.
 */
@property (nonatomic, assign) CGFloat hyb_leftMarginOfCursor;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a text field with holder, super view and constraints.
 *
 *	@param holder			  The place holder.
 *	@param superView		The super view of created text field.
 *	@param constraints	Add constraints to the text field, if superview is nil, it will be ignored.
 *
 *	@return The text field instance.
 */
+ (instancetype)hyb_textFieldWithHolder:(NSString *)holder
                              superView:(UIView *)superView
                            constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a text field with holder, super view and constraints.
 *
 *	@param holder			  The place holder.
 *	@param delegate			The text field delegate.
 *	@param superView		The super view of created text field.
 *	@param constraints	Add constraints to the text field, if superview is nil, it will be ignored.
 *
 *	@return The text field instance.
 */
+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a text field with holder, text, super view and constraints.
 *
 *	@param holder			  The place holder.
 *	@param text		     	The text field default text.
 *	@param superView		The super view of created text field.
 *	@param constraints	Add constraints to the text field, if superview is nil, it will be ignored.
 *
 *	@return The text field instance.
 */
+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a text field with holder, text, super view and constraints.
 *
 *	@param holder			  The place holder.
 *	@param text		     	The text field default text.
 *	@param delegate			The text field delegate.
 *	@param superView		The super view of created text field.
 *	@param constraints	Add constraints to the text field, if superview is nil, it will be ignored.
 *
 *	@return The text field instance.
 */
+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints;

@end
