//
//  UIButton+HYBHelperBlockKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperBlocksKit.h"
#import "HYBCommonKit.h"

@interface UIButton (HYBHelperBlockKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The most easy way to create a button with a touch up event callback block.
 *
 *	@param onTouchUp	The touch up event callback block.
 *
 *	@return UIButton instance.
 */
+ (instancetype)hyb_buttonWithTouchUp:(HYBButtonBlock)onTouchUp;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a button with super view, masonry auto layout, and touch up callback.
 *
 *	@param superView		Add the button to the superView.
 *	@param constraints	Using Masonry to add constraints.
 *	@param touchUp			The callback of touching up event.
 *
 *	@return UIButton instance.
 */
+ (instancetype)hyb_buttonWithSuperView:(UIView *)superView
                            constraints:(HYBConstraintMaker)constraints
                                touchUp:(HYBButtonBlock)touchUp;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a button with title, super view, masonry auto layout, and touch up callback.
 *
 *	@param title				Set title for the button.
 *	@param superView		Add the button to the superView.
 *	@param constraints	Using Masonry to add constraints.
 *	@param touchUp			The callback of touching up event.
 *
 *	@return UIButton instance.
 */
+ (instancetype)hyb_buttonWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a button with image, super view, masonry auto layout, and touch up callback.
 *
 *	@param image				Set normal state image for the button, it can be
 *                      a image name or a real UIImage.
 *	@param superView		Add the button to the superView.
 *	@param constraints	Using Masonry to add constraints.
 *	@param touchUp			The callback of touching up event.
 *
 *	@return UIButton instance.
 */
+ (instancetype)hyb_buttonWithImage:(id)image
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a button with normal image, selected image, super view, 
 *  masonry auto layout, and touch up callback.
 *
 *	@param image				Set normal state image for the button, it can be
 *                      a image name or a real UIImage.
 *  @param selectedImage Set selected state image for the button, it can be
 *                      a image name or a real UIImage.
 *	@param superView		Add the button to the superView.
 *	@param constraints	Using Masonry to add constraints.
 *	@param touchUp			The callback of touching up event.
 *
 *	@return UIButton instance.
 */
+ (instancetype)hyb_buttonWithImage:(id)image
                      selectedImage:(id)selectedImage
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp;

@end
