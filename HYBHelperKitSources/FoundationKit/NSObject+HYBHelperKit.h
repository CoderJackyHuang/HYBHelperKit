//
//  NSObject+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (HYBHelperKit)

/**
 *	Get the name of currnet object's class.
 */
- (NSString *)hyb_className;

#pragma mark - Json to object and object to jason
/**
 *	Transform an object to json data.
 *
 *	@param object	Any kind of object.
 *
 *	@return json data object if transform successfully, otherwise return nil.
 */
+ (NSMutableData *)hyb_toJsonDataWithObject:(id)object;

/**
 *	Transform self to json data.
 *
 *	@return json data if transform successfully, otherwise return nil.
 */
- (NSMutableData *)hyb_toJsonData;

/**
 *	Transform an object to json string.
 *
 *	@param object	Any kind of object
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
+ (NSString *)hyb_toJsonStringWithObject:(id)object;

/**
 *	Transform self to json string.
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
- (NSString *)hyb_toJsonString;

#pragma mark - Filter Null and nil
/**
 *	Filter all nil and null object.
 */
- (id)hyb_filterNullNil;

/**
 *	Filter all nil and null object.
 *
 *	@param object	The object to be filtered.
 */
+ (id)hyb_filterNullNilFromObject:(id)object;

@end
