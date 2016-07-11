//
//  NSTimer+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSTimer+HYBHelperKit.h"

@implementation NSTimer (HYBHelperKit)

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
  if ([self.userInfo isKindOfClass:[NSDictionary class]]) {
    [self.userInfo removeObjectForKey:@"callback"];
    [self.userInfo removeObjectForKey:@"count"];
  }

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
  static NSUInteger currentCount = 0;
  
  NSDictionary *userInfo = timer.userInfo;
  HYBTimerCallback callback = userInfo[@"callback"];
  NSNumber *count = userInfo[@"count"];
  
  if (currentCount < count.integerValue) {
    currentCount++;
    
    if (callback) {
      callback(timer);
    }
  } else {
    currentCount = 0;
    [timer hyb_unfireTimer];
    [timer hyb_invalidate];
  }
}

@end
