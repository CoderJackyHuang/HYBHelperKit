//
//  UIControl+HYBHelperBlockKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBCommonKit.h"

@interface UIControl (HYBHelperBlockKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make it support block callback of touch up event.
 */
@property (nonatomic, copy) HYBButtonBlock hyb_onTouchUp;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make it support block callback of touch down event.
 */
@property (nonatomic, copy) HYBButtonBlock hyb_onTouchDown;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make it support block callback of value change event.
 */
@property (nonatomic, copy) HYBValueChangedBlock hyb_onValueChanged;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make it support block callback of editing changed event.
 */
@property (nonatomic, copy) HYBEditChangedBlock hyb_onEditChanged;

@end
