//
//  HYBCommonBlockDefine.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#ifndef HYBCommonBlockDefine_h
#define HYBCommonBlockDefine_h

/**
 *	This is a common block for handling error.
 */
typedef void (^HYBErrorBlock)(NSError *error);

/**
 * This is a void block.
 */
typedef void (^HYBVoidBlock)(void);

/**
 * For notification block.
 */
typedef void (^HYBNotificationBlock)(NSNotification *sender);

/**
 *	For return a bool block.
 */
typedef void (^HYBBOOLBlock)(BOOL result);

/**
 * For return a array block.
 */
typedef void (^HYBArrayBlock)(NSArray *list);

/**
 * For return a array and msg block.
 */
typedef void (^HYBArrayMessageBlock)(NSArray *list, NSString *msg);

/**
 * For return a dictionary block.
 */
typedef void (^HYBDictionaryBlock)(NSDictionary *response);

/**
 * For return a dictionary and a message block.
 */
typedef void (^HYBDictionaryMessageBlock)(NSDictionary *response, NSString *msg);

/**
 * For only return number block.
 */
typedef void (^HYBNumberBlock)(NSNumber *resultNumber);

/**
 * For number and message block.
 */
typedef void (^HYBNumberMessageBlock)(NSNumber *resultNumber, NSString *msg);

/**
 * Common return object block.
 */
typedef void (^HYBIdBlock)(id result);

/**
 * For single button block.
 */
typedef void(^HYBButtonBlock)(UIButton *sender);

/**
 * For button array block.
 *
 * @param index  index in the array.
 * @param sender The responder.
 */
typedef void(^HYBButtonIndexBlock)(NSUInteger index, UIButton *sender);

/**
 * Gesture block callback.
 */
typedef void(^HYBGestureBlock)(UIGestureRecognizer *sender);

#endif /* HYBCommonBlockDefine_h */
