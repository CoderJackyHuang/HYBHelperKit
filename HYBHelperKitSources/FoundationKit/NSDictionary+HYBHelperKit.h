//
//  NSDictionary+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HYBHelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get object from dictionary by key.
 *
 *	@param key	key
 *
 *	@return object of key, or nil if key doesn't exist
 */
- (id)hyb_objectForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get int value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return int value of key, or zero if key doesn't exist
 */
- (int)hyb_intForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get double value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return double value of key, or zero if key doesn't exist
 */
- (double)hyb_doubleForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get float value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return float value of key, or zero if key doesn't exist
 */
- (float)hyb_floatForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get NSInteger value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSInteger value of key, or zero if key doesn't exist
 */
- (NSInteger)hyb_integerForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get NSString value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSString value of key, or nil if key doesn't exist
 */
- (NSString *)hyb_stringForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get NSDictionary value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSDictionary value of key, or nil if key doesn't exist
 */
- (NSDictionary *)hyb_dictionaryForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get NSArray value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSArray value of key, or nil if key doesn't exist
 */
- (NSArray *)hyb_arrayForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get NSNumber value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSNumber value of key, or nil if key doesn't exist
 */
- (NSNumber *)hyb_numberForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Get BOOL value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return BOOL value of key, or false if key doesn't exist
 */
- (BOOL)hyb_boolForKey:(id<NSCopying>)key;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the unsigned long long value form dict by key.
 *
 *	@param key	The key
 *
 *	@return unsigned long long value of key, or 0 if key doesn't exist.
 */
- (unsigned long long)hyb_unsignedLongLongValue:(id<NSCopying>)key;

@end
