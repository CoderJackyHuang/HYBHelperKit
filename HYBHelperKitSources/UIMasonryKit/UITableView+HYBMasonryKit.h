//
//  UITableView+HYBMasonryKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBCommonKit.h"
#import "HYBHelperBlocksKit.h"

@interface UITableView (HYBMasonryKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a table view, if superview is not nil, it will be added constraints
 *  and it's edge will be always equal to super view.
 *
 *	@param superView	The super view for table view.
 *
 *	@return The table view instance.
 */
+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a table view, if superview is nil, constraints will be ignored.
 *
 *	@param superView		The super view for table view.
 *	@param constraints	Make constraints for table view.
 *
 *	@return The table view instance.
 */
+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a table view, if superview is not nil, it will be added constraints
 *  and it's edge will be always equal to super view.
 *
 *	@param superView	The super view for table view.
 *	@param delegate   Delgate and dataSource.
 *
 *	@return The table view instance.
 */
+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView delegate:(id)delegate;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a table view, if superview is nil, constraints will be ignored.
 *
 *	@param superView		The super view for table view.
 *	@param delegate     Delgate and dataSource.
 *	@param constraints	Make constraints for table view.
 *
 *	@return The table view instance.
 */
+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                               constraints:(HYBConstraintMaker)constraints;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create a table view, if superview is nil, constraints will be ignored. Can 
 *  specify table view style.
 *
 *	@param superView		The super view for table view.
 *	@param delegate     Delgate and dataSource.
 *	@param style        @see UITableViewStyle.
 *	@param constraints	Make constraints for table view.
 *
 *	@return The table view instance.
 */
+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                                     style:(UITableViewStyle)style
                               constraints:(HYBConstraintMaker)constraints;

@end
