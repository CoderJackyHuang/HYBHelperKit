//
//  NSMutableDictionary+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSMutableDictionary+HYBHelperKit.h"

@implementation NSMutableDictionary (HYBHelperKit)

- (BOOL)hyb_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
  if (aKey == nil || anObject == nil) {
    return NO;
  }
  
  [self setObject:anObject forKey:aKey];
  
  return YES;
}

- (BOOL)hyb_setValue:(id)value forKey:(NSString *)key {
  if (key == nil || value == nil) {
    return NO;
  }
  
  [self setValue:value forKey:key];
  
  return YES;
}

@end
