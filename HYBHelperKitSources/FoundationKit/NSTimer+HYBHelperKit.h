//
//  NSTimer+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HYBTimerCallback)(NSTimer *timer);

@interface NSTimer (HYBHelperKit)

/**
 *	Create a timer with time interval, repeat or not, and callback.
 *
 *	@param interval	Time interval
 *	@param repeats	Whether repeat to schedule.
 *	@param callback The callback block.
 *
 *	@return Timer object.
 */
+ (NSTimer *)hyb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                               repeats:(BOOL)repeats
                              callback:(HYBTimerCallback)callback;

/**
 *	Create a timer with time interval, repeat count, and callback.
 *
 *	@param interval	Time interval
 *	@param count		When count <= 0, it means repeat.
 *	@param callback	The callback block
 *
 *	@return Timer object
 */
+ (NSTimer *)hyb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(HYBTimerCallback)callback;

/**
 *	Start timer immediately.
 */
- (void)hyb_fireTimer;

/**
 *	Pause timer immediately
 */
- (void)hyb_unfireTimer;

/**
 *	Make timer invalidate.
 */
- (void)hyb_invalidate;

@end
