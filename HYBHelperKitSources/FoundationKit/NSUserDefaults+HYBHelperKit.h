//
//  NSUserDefaults+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (HYBHelperKit)

/**
 *	Set safe object to the user defaults, it will filter all nil or Null object,
 *  to prevent app crashing.
 *
 *	@param value				The object to be saved.
 *	@param key          The only key.
 */
- (BOOL)hyb_setSafeObject:(id)value forKey:(NSString *)key;

@end
