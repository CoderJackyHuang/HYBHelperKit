//
//  UIScrollView+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

@interface UIScrollView (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a scroll view with delegate, without layout.
 *
 *	@param delegate	The scroll view delegate
 *
 *	@return Instance of UIScrollView.
 */
+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a scroll view with delegate and superview, and will make it 
 *  hold it's super view's edges.
 *
 *	@param delegate	The scroll view delegate
 *	@param superView	The scroll view's super view.
 *
 *	@return Instance of UIScrollView.
 */
+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate
                                 superView:(UIView *)superView;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a scroll view with delegate, superview, and add constraints to it.
 *  If super view is nil, constraints will be ignored.
 *
 *	@param delegate		The scroll view delegate
 *	@param superView		The scroll view's super view.
 *	@param constraints	Add constraints to the scroll view.
 *
 *	@return Instance of UIScrollView.
 */
+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate
                                 superView:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints;

@end
