//
//  NSTimer+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSTimer+HYBHelperKit.h"
#import <objc/runtime.h>

static const void *s_hyb_private_currentCountTime = "s_hyb_private_currentCountTime";

@implementation NSTimer (HYBHelperKit)

- (NSNumber *)hyb_private_currentCountTime {
  NSNumber *obj = objc_getAssociatedObject(self, s_hyb_private_currentCountTime);
  
  if (obj == nil) {
    obj = @(0);
    
    [self setHyb_private_currentCountTime:obj];
  }
  
  return obj;
}

- (void)setHyb_private_currentCountTime:(NSNumber *)time {
  objc_setAssociatedObject(self,
                           s_hyb_private_currentCountTime,
                           time, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSTimer *)hyb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(HYBTimerCallback)callback {
  if (count <= 0) {
    return [self hyb_scheduledTimerWithTimeInterval:interval
                                            repeats:YES
                                           callback:callback];
  }
  
  NSDictionary *userInfo = @{@"callback"     : callback,
                             @"count"        : @(count)};
  return [NSTimer scheduledTimerWithTimeInterval:interval
                                          target:self
                                        selector:@selector(hyb_onTimerUpdateCountBlock:)
                                        userInfo:userInfo
                                         repeats:YES];
}

+ (NSTimer *)hyb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        repeats:(BOOL)repeats
                                       callback:(HYBTimerCallback)callback {
  return [NSTimer scheduledTimerWithTimeInterval:interval
                                          target:self
                                        selector:@selector(hyb_onTimerUpdateBlock:)
                                        userInfo:callback
                                         repeats:repeats];
}

- (void)hyb_fireTimer {
    [self setFireDate:[NSDate distantPast]];
}

- (void)hyb_unfireTimer {
    [self setFireDate:[NSDate distantFuture]];
}

- (void)hyb_invalidate {
  if (self.isValid) {
    [self invalidate];
  }
}

#pragma mark - Private
+ (void)hyb_onTimerUpdateBlock:(NSTimer *)timer {
  HYBTimerCallback block = timer.userInfo;
  
  if (block) {
    block(timer);
  }
}

+ (void)hyb_onTimerUpdateCountBlock:(NSTimer *)timer {
  NSInteger currentCount = [[timer hyb_private_currentCountTime] integerValue];
  
  NSDictionary *userInfo = timer.userInfo;
  HYBTimerCallback callback = userInfo[@"callback"];
  NSNumber *count = userInfo[@"count"];
  
  if (currentCount < count.integerValue) {
    currentCount++;
    [timer setHyb_private_currentCountTime:@(currentCount)];
    
    if (callback) {
      callback(timer);
    }
  } else {
    currentCount = 0;
    [timer setHyb_private_currentCountTime:@(currentCount)];
    
    [timer hyb_unfireTimer];
    [timer hyb_invalidate];
  }
}

@end
