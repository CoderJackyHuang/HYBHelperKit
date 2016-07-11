//
//  NSMutableArray+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSMutableArray+HYBHelperKit.h"
#import "NSArray+HYBHelperKit.h"

@implementation NSMutableArray (HYBHelperKit)

- (BOOL)hyb_addObject:(id)object {
  BOOL ret = NO;
  if (object) {
    ret = YES;
    [self addObject:object];
  }
  
  return ret;
}

- (BOOL)hyb_insertObject:(id)anObject atIndex:(NSUInteger)index {
  if (anObject == nil|| index > [self count] ) {
    return NO;
  }
  
  if ([self containsObject:anObject]) {
    return NO;
  }
  
  [self insertObject:anObject atIndex:index];
  
  return YES;
}

- (BOOL)hyb_removeObjectAtIndex:(NSUInteger)index {
  if (index >= [self count]) {
    return NO;
  }
  
  [self removeObjectAtIndex:index];
  
  return YES;
}

- (BOOL)hyb_exchangeObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
  if ([self count] != 0 && toIndex != fromIndex
      && fromIndex < [self count] && toIndex < [self count]) {
    [self exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
    
    return YES;
  }
  
  return NO;
}

@end
