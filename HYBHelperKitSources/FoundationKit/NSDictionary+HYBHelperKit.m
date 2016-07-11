//
//  NSDictionary+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSDictionary+HYBHelperKit.h"
#import "HYBCommonKit.h"

@implementation NSDictionary (HYBHelperKit)

- (id)hyb_objectForKey:(id<NSCopying>)key {
  if (key == nil) {
    return nil;
  }
  
  return [self objectForKey:key];
}

- (int)hyb_intForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  NSNumber *number = [self hyb_numberForKey:key];
  
  return [number intValue];
}

- (double)hyb_doubleForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  NSNumber *number = [self hyb_numberForKey:key];
  
  return [number doubleValue];
}

- (float)hyb_floatForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  NSNumber *number = [self hyb_numberForKey:key];
  
  return [number floatValue];
}

- (NSInteger)hyb_integerForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  NSNumber *number = [self hyb_numberForKey:key];
  
  return [number integerValue];
}

- (NSString *)hyb_stringForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  id obj = [self hyb_objectForKey:key];
  
  if ([obj isKindOfClass:[NSString class]]) {
    return (NSString *)obj;
  } else if ([obj isKindOfClass:[NSNumber class]]) {
    return [NSString stringWithFormat:@"%@", obj];
  }
  
  return nil;
}


- (NSDictionary *)hyb_dictionaryForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  id obj = [self hyb_objectForKey:key];
  if ([obj isKindOfClass:[NSDictionary class]]) {
    return (NSDictionary *)obj;
  }
  
  return nil;
}

- (NSArray *)hyb_arrayForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  id obj = [self hyb_objectForKey:key];
  if ([obj isKindOfClass:[NSArray class]]) {
    return (NSArray *)obj;
  }
  
  return nil;
}

- (NSNumber *)hyb_numberForKey:(id)key {
  if (key == nil) {
    return 0;
  }
  
  id obj = [self hyb_objectForKey:key];
  if ([obj isKindOfClass:[NSNumber class]]) {
    return (NSNumber *)obj;
  }
  
  return nil;
}

- (BOOL)hyb_boolForKey:(id)key {
  if (key == nil) {
    return NO;
  }
  
  id number = [self hyb_objectForKey:key];
  if ([number respondsToSelector:@selector(boolValue)]) {
    return [number boolValue];
  }
  
  return NO;
}

- (unsigned long long)hyb_unsignedLongLongValue:(id<NSCopying>)key {
  if (key == nil) {
    return 0;
  }
  
  id number = [self hyb_objectForKey:key];
  if ([number respondsToSelector:@selector(unsignedLongLongValue)]) {
    return [number unsignedLongLongValue];
  }
  
  return 0;
}

@end
