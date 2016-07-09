//
//  HYBHelperKitBaseController.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/5.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	This is an very useful view controller, that it will support many kinds of
 *  base APIs of UINavigationBar items and so no.
 */
@interface HYBHelperKitBaseController : UIViewController

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the left item which using a button as custom view. It may be nil if 
 *  navigation item left items are empty.
 */
@property (nonatomic, strong, readonly) UIButton *hyb_leftButtonItem;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get all of left items that using button as custom view. It may be nil if 
 *  navigation item left items are empty.
 */
@property (nonatomic, strong, readonly) NSArray<UIButton *> *hyb_leftButtonItems;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the first right button item. When using it to access right button, it usually
 *  just has a right item. It may be nil if there is no navigation right items.
 */
@property (nonatomic, strong, readonly) UIButton *hyb_rightButtonItem;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get all right button items. When using ti to access right buttons. It may be nil if 
 *  there is no navigation right items.
 */
@property (nonatomic, strong, readonly) NSArray<UIButton *> *hyb_rightButtonItems;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Adjust navigation title view to center, when it shows margin right, just because
 *  the previous navigation item's title is too long.
 */
- (void)hyb_adjustNavigationTitleToCenter;

#pragma mark - Config Navigaiton Item
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Set the navigation title or title view.
 *
 *	@param title	Title, titleView or a UIImage instance will be automatically
 *                created a title view.
 */
- (void)hyb_setNavTitle:(id)title;

- (void)hyb_setNavTitle:(id)title
         rightTitle:(NSString *)rightTitle
         rightBlock:(HYBButtonBlock)rightBlock;

- (void)hyb_setNavTitle:(id)title
        rightTitles:(NSArray<NSString *> *)rightTitles
         rightBlock:(HYBButtonIndexBlock)rightBlock;

- (void)hyb_setNavTitle:(id)title
     rightImages:(NSArray *)rightImages
         rightBlock:(HYBButtonBlock)rightBlock;

- (void)hyb_setNavTitle:(id)title
    rightImages:(NSArray *)rightImages
  rightHgImages:(NSArray *)rightHgImages
         rightBlock:(HYBButtonIndexBlock)rightBlock;


- (void)hyb_setNavLeftButtonTitle:(NSString *)title onCliked:(HYBButtonBlock)block;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Config navigation left item with a image or image name.
 *
 *	@param image	UIImage instance or an image name.
 *	@param block	The callback of item clicked.
 */
- (void)hyb_setNavLeftImage:(id)image block:(HYBButtonBlock)block;

#pragma mark -

- (UIActivityIndicatorView *)hyb_startIndicatorAnimating;
- (UIActivityIndicatorView *)hyb_startIndicatorAnimatingWithStyle:(UIActivityIndicatorViewStyle)style;

- (void)hyb_stopIndicatorAnimating;

#pragma mark -
- (void)hybaddObserverWithNotificationName:(NSString *)notificationName
                                  callback:(HYBNotificationBlock)callback;

- (void)hyb_removeAllNotifications;
- (void)hyb_removeAllNotificationWithName:(NSString *)nofiticationName;

@end
