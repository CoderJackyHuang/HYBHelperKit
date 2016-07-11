//
//  UIGestureRecognizer+HYBHelperBlockKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBCommonKit.h"

@interface UIGestureRecognizer (HYBHelperBlockKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make all gestures support block callback.
 *  This will support all kinds of gestures.
 */
@property (nonatomic, copy) HYBGestureBlock hyb_onGesture;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make tap gesture support block callback.
 */
@property (nonatomic, copy) HYBTapGestureBlock hyb_onTaped;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make long press gesture support block callback.
 */
@property (nonatomic, copy) HYBLongGestureBlock hyb_onLongPressed;

@end
