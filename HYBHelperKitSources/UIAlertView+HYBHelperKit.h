//
//  UIAlertView+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/15.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HYBAlertClickedButtonBlock)(UIAlertView *alertView,
                                          NSUInteger buttonIndex);


@interface UIAlertView (HYBHelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The action callback block
 */
@property (nonatomic, copy) HYBAlertClickedButtonBlock  hyb_clickedButtonBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Show an alert view with a title, message and button titles.
 *
 *	@param title				Title
 *	@param message			The content message
 *	@param buttonTitles	The buttion titles array.
 *	@param block				The callbac when clicked.
 *
 *	@return The UIAlertView instance.
 */
+ (instancetype)hyb_showWithTitle:(NSString *)title
                          message:(NSString *)message
                     buttonTitles:(NSArray *)buttonTitles
                            block:(HYBAlertClickedButtonBlock)block;

@end
