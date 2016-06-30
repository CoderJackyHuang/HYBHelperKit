//
//  NSMutableDictionary+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (HYBHelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	It is safe to use it to set object for key.
 *
 *	@param anObject	Object to be set.
 *	@param aKey			The unique key of key-value
 *
 *	@return YES if set object successfully, otherwise NO.
 */
- (BOOL)hyb_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	It is safe to use it to set value for key.
 *
 *	@param value Value to be set.
 *	@param key	 The unique key of key-value.
 *
 *  @return YES if set value successfully, otherwise NO.
 */
- (BOOL)hyb_setValue:(id)value forKey:(NSString *)key;

@end
