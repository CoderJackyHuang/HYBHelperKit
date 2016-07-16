//
//  NSUserDefaults+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSUserDefaults+HYBHelperKit.h"
#import "NSObject+HYBHelperKit.h"

@implementation NSUserDefaults (HYBHelperKit)

- (BOOL)hyb_setSafeObject:(id)value forKey:(NSString *)key {
  if (key == nil) {
    return NO;
  }
  
  if (value == nil || [value isKindOfClass:[NSNull class]]) {
    [self removeObjectForKey:key];
    
    return YES;
  }
  
  if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
    [self setObject:value forKey:key];
    [self synchronize];
    return YES;
  } else {
    id result = [value hyb_filterNullNil];
    if (result) {
      [self setObject:result forKey:key];
      [self synchronize];
      
      return YES;
    }
  }
  
  return NO;
}

@end
