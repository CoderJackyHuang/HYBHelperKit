//
//  UIImageView+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

@interface UIImageView (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a default image view with scale to fill content mode
 *
 *	@return Instance of UIImageView.
 */
+ (instancetype)hyb_imageView;

+ (instancetype)hyb_imageViewWithSuperView:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints;
+ (instancetype)hyb_imageViewWithSuperView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints
                               onTaped:(HYBTapGestureBlock)onTaped;

+ (instancetype)hyb_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints;

+ (instancetype)hyb_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints
                               onTaped:(HYBTapGestureBlock)onTaped;

+ (instancetype)hyb_imageViewWithImage:(id)image
                              isCircle:(BOOL)isCircle
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints
                               onTaped:(HYBTapGestureBlock)onTaped;
@end
