//
//  UIActionSheet+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/15.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HYBActionSheetClickedButtonBlock)(UIActionSheet *actionSheet, NSUInteger buttonIndex);

@interface UIActionSheet (HYBHelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The action sheet callback block
 */
@property (nonatomic, copy) HYBActionSheetClickedButtonBlock hyb_clickedButtonBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Show an action sheet in the view with a title, cancel button title,
 *  destructive title and other button titles.
 *
 *	@param inView						Which view show the action sheet.
 *	@param title						The action sheet's title.
 *	@param cancelTitle			The cancel button's title.
 *	@param destructiveTitle	The destructive button title.
 *	@param otherTitles			Other buton titles.
 *	@param callback					The callback block
 *
 *	@return The UIActionSheet instance.
 */
+ (instancetype)hyb_showInView:(UIView *)inView
                         title:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
              destructiveTitle:(NSString *)destructiveTitle
                   otherTitles:(NSArray *)otherTitles
                      callback:(HYBActionSheetClickedButtonBlock)callback;

@end
