//
//  HYBHelperKitBaseURLController.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBCommonBlockDefine.h"

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	This is a helper controller, for developers showing a base url list
 *  in the tabbar controller, and need to select one url before any 
 *  HTTP/HTTPS request is sent.
 *
 *  @Note This class is only used in the debug mode.
 */
@interface HYBHelperKitBaseURLController : UIViewController

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Show the base url list view controller to developers with selected callback.
 *
 *  @param baseURLSources The base url list sources.
 *	@param callback	The callback block when select one or input one.
 *
 *	@return The controller instance.
 */
+ (instancetype)showWithBaseURLs:(NSArray *(^)(void))baseURLSources
                      onCallback:(HYBStringBlock)callback;

@end
