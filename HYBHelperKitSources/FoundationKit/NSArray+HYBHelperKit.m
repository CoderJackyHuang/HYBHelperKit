//
//  NSArray+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSArray+HYBHelperKit.h"

@implementation NSArray (HYBHelperKit)

- (id)hyb_objectAtIndex:(NSUInteger)index {
  NSUInteger count = [self count];
  
  if (count > 0 && index < count) {
    return [self objectAtIndex:index];
  }
  
  return nil;
}

- (BOOL)hyb_isContainsString:(NSString *)string {
  for (NSString *element in self) {
    if ([element isKindOfClass:[NSString class]] && [element isEqualToString:string]) {
      return true;
    }
  }
  
  return false;
}

- (NSArray *)hyb_reverseArray {
  NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];
  
  for (id element in enumerator) {
    [arrayTemp addObject:element];
  }
  
  return arrayTemp;
}

@end
