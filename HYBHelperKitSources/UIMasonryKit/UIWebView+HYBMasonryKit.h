//
//  HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/9.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

@interface  UIWebView (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a web view without layout.
 *
 *	@param delegate	UIWebViewDelegate
 *
 *	@return The instance of UIWebView.
 */
+ (instancetype)hyb_webViewWithDelegate:(id)delegate;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a web view with a super view and add edges as layout.
 *
 *	@param delegate	UIWebViewDelegate
 *	@param superView	The super view of web view.
 *
 *	@return The instance of UIWebView.
 */
+ (instancetype)hyb_webViewWithDelegate:(id)delegate superView:(UIView *)superView;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a web view with a super view and add edges as layout.
 *
 *	@param delegate	UIWebViewDelegate
 *	@param superView	The super view of web view.
 *	@param edges			The edges inset.
 *
 *	@return The instance of UIWebView.
 */
+ (instancetype)hyb_webViewWithDelegate:(id)delegate
                          superView:(UIView *)superView
                              edges:(UIEdgeInsets)edges;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a web view with a super view and specify layout.
 *
 *	@param delegate	UIWebViewDelegate
 *	@param superView	The super view of web view.
 *	@param constraints	The constraints added to the web view.
 *
 *	@return The instance of UIWebView.
 */
+ (instancetype)hyb_webViewWithDelegate:(id)delegate
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints;

@end
