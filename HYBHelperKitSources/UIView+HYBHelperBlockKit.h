//
//  UIView+HYBHelperBlockKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBhelperkit.h"

@interface UIView (HYBHelperBlockKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  The tap gesture getter. @see hyb_addTapGestureWithCallback
 */
@property (nonatomic, strong, readonly) UITapGestureRecognizer *hyb_tapGesture;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The long press gesture getter, @see hyb_addLongGestureWithCallback
 */
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *hyb_longGesure;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a tap gesture with callback. It will automatically open userInterface to YES.
 *
 *	@param onTaped	The callback block when taped.
 */
- (void)hyb_addTapGestureWithCallback:(HYBTapGestureBlock)onTaped;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add long press gesture with callback. It will automatically open userInterface to YES.
 *
 *	@param onLongPressed	The long press callback when long pressed.
 */
- (void)hyb_addLongGestureWithCallback:(HYBLongGestureBlock)onLongPressed;

@end
