//
//  UIView+HYBHelperKitUIKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HYBHelperKitUIKit)

#pragma mark - Convenience frame api
/**
 * view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat hyb_originX;

/**
 * view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat hyb_originY;

/**
 * view.frame.origin
 */
@property (nonatomic, assign) CGPoint hyb_origin;

/**
 * view.center.x
 */
@property (nonatomic, assign) CGFloat hyb_centerX;

/**
 * view.center.y
 */
@property (nonatomic, assign) CGFloat hyb_centerY;

/**
 * view.center
 */
@property (nonatomic, assign) CGPoint hyb_center;

/**
 * view.frame.size.width
 */
@property (nonatomic, assign) CGFloat hyb_width;

/**
 * view.frame.size.height
 */
@property (nonatomic, assign) CGFloat hyb_height;

/**
 * view.frame.size
 */
@property (nonatomic, assign) CGSize  hyb_size;

/**
 * view.frame.size.height + view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat hyb_bottomY;

/**
 * view.frame.size.width + view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat hyb_rightX;

@end
