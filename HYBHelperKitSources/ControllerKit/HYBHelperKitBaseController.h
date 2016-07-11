//
//  HYBHelperKitBaseController.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/5.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBCommonKit.h"

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

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a title or title view to the navigation item, and add a button to the
 *  navigation item right item with callback.
 *
 *	@param title			The title view or a title.
 *	@param rightTitle	The right button item title.
 *	@param rightBlock	The button event callback.
 */
- (void)hyb_setNavTitle:(id)title
             rightTitle:(NSString *)rightTitle
             rightBlock:(HYBButtonBlock)rightBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a title or title view, right items with titles to the navigation item.
 *
 *	@param title				The title view
 *	@param rightTitles	The right item button titles
 *	@param rightBlock	The callback of button touch up event.
 */
- (void)hyb_setNavTitle:(id)title
            rightTitles:(NSArray<NSString *> *)rightTitles
             rightBlock:(HYBButtonIndexBlock)rightBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a title or title view, right items with images to the navigation item.
 *
 *	@param title        The title view
 *	@param rightImages	The right item button normal images.
 *	@param rightBlock	  The callback of button touch up event.
 */
- (void)hyb_setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
             rightBlock:(HYBButtonIndexBlock)rightBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a title or title view, right items with images to the navigation item.
 *
 *	@param title        The title view
 *	@param rightImages	The right item button  normal images.
 *  @param rightHgImages The right item button highlighted images.
 *	@param rightBlock	  The callback of button touch up event.
 */
- (void)hyb_setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
          rightHgImages:(NSArray *)rightHgImages
             rightBlock:(HYBButtonIndexBlock)rightBlock;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Set navigation left item with button title.
 *
 *	@param title	The title of left item button.
 *	@param block	The button touch up event callback.
 */
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

#pragma mark - About indicator animating
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an UIActivityIndicatorView view with UIActivityIndicatorViewStyleGray style
 *
 *	@return The instance of UIActivityIndicatorView
 */
- (UIActivityIndicatorView *)hyb_startIndicatorAnimating;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Create an UIActivityIndicatorView view with specified style.
 *
 *	@param style	The indicator view style
 *
 *	@return The instance of UIActivityIndicatorView
 */
- (UIActivityIndicatorView *)hyb_startIndicatorAnimatingWithStyle:(UIActivityIndicatorViewStyle)style;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Stop animating of indicator and remove from super view.
 */
- (void)hyb_stopIndicatorAnimating;

#pragma mark - Notification
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a notification to the notification center with notification name.
 *
 *	@param notificationName	The name of notification
 *	@param callback					The callback when received the notification.
 */
- (void)hyb_addObserverWithNotificationName:(NSString *)notificationName
                                   callback:(HYBNotificationBlock)callback;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Remove all notifications of the view controller.
 */
- (void)hyb_removeAllNotifications;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Remove the specified notification with notification name from notification
 *  center.
 *
 *	@param nofiticationName	The notification name.
 */
- (void)hyb_removeAllNotificationWithName:(NSString *)nofiticationName;

@end
