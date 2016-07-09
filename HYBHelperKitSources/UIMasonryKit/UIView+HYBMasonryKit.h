//
//  UIView+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

@interface UIView (HYBMasonryKit)

#pragma mark - Create view
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an empty view with super view, if superView is not nil,
 *  it will be added constraints to the view which edges equal to superView.
 *
 *	@param superView	The super view of created view.
 *
 *	@return The view instance.
 */
+ (instancetype)hyb_viewWithSuperView:(UIView *)superView;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an empty view with super view, if superView is not nil,
 *  it will be added constraints to the view which edges equal to superView.
 *  When onTaped is not nil, tap gesture will be added to it.
 *
 *	@param superView	The super view of created view.
 *  @param onTaped    The tap gesture callback.
 *
 *	@return The view instance.
 */
+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                              onTaped:(HYBTapGestureBlock)onTaped;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an empty view with super view, if superView is not nil,
 *  it will be added constraints to the view which edges equal to superView.
 *
 *	@param superView	The super view of created view.
 *  @param constraints The added contraints of view.
 *
 *	@return The view instance.
 */
+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                          constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an empty view with super view, if superView is not nil,
 *  it will be added constraints to the view which edges equal to superView.
 *  When onTaped is not nil, tap gesture will be added to it.
 *
 *	@param superView	The super view of created view.
 *  @param constraints The added contraints of view.
 *  @param onTaped    The tap gesture callback.
 *
 *	@return The view instance.
 */
+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                          constraints:(HYBConstraintMaker)constraints
                              onTaped:(HYBTapGestureBlock)onTaped;

#pragma mark - Horizontal Line
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of top.
 *
 *	@param toView	The view that needs to add a line.
 *	@param height	The line height
 *	@param color	The color of line.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                                 height:(CGFloat)height
                                  color:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of top and add a distance to top.
 *
 *	@param toView	The view that needs to add a line.
 *  @param distance The distance to the top.
 *	@param height	The line height
 *	@param color	The color of line.
 *
 *	@return The instance of UILabel.

 */
+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                            distance:(CGFloat)distance
                              height:(CGFloat)height
                               color:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of bottom.
 *
 *	@param toView	The view that needs to add a line.
 *	@param height	The line height
 *	@param color	The color of line.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                           height:(CGFloat)height
                            color:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of bottom with a distance of top.
 *
 *	@param toView		The view that needs to add a line.
 *	@param distance	The distance to the top.
 *	@param height		The line height.
 *	@param color		The line's background color.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                               distance:(CGFloat)distance
                                 height:(CGFloat)height
                                  color:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of top with left and right padding.
 *
 *	@param toView				The view that needs to add a line.
 *	@param leftPadding	The padding of left.
 *	@param rightPadding	The padding of right.
 *	@param height				The line height.
 *	@param color				The line's color.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                            leftPadding:(CGFloat)leftPadding
                           rightPadding:(CGFloat)rightPadding
                                 height:(CGFloat)height
                                  color:(UIColor *)color;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a line to the view of Bottom with left and right padding.
 *
 *	@param toView				The view that needs to add a line.
 *	@param leftPadding	The padding of left.
 *	@param rightPadding	The padding of right.
 *	@param height				The line height.
 *	@param color				The line's color.
 *
 *	@return The instance of UILabel.
 */
+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                      leftPadding:(CGFloat)leftPadding
                     rightPadding:(CGFloat)rightPadding
                           height:(CGFloat)height
                            color:(UIColor *)color;

@end
