//
//  NSArray+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HYBHelperKit)

/**
 *  It is safe to call this method to retrieve element.
 *
 *	@param index	The index.
 *
 *	@return The element in the index if index is valid, otherwise nil.
 */
- (id)hyb_objectAtIndex:(NSUInteger)index;

/**
 *	Judge whether the array contains the string.
 *
 *	@param string	The specified string to be checked.
 *
 *	@return YES if found, otherwise NO.
 */
- (BOOL)hyb_isContainsString:(NSString *)string;

/**
 *	Make the array elements reverse.
 *
 *	@return The reversed array.
 */
- (NSArray *)hyb_reverseArray;

@end
