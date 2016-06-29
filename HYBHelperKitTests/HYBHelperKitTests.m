//
//  HYBHelperKitTests.m
//  HYBHelperKitTests
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSTimer+HYBHelperKit.h"

@interface HYBHelperKitTests : XCTestCase

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *timer1;

@end

@implementation HYBHelperKitTests

- (void)setUp {
    [super setUp];
  
  NSUInteger count = 10;
  self.timer = [NSTimer hyb_scheduledTimerWithTimeInterval:0.5 repeats:YES callback:^(NSTimer *timer) {
    if (count <= 0) {
      [timer hyb_invalidate];
    }
  }];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
  
  [self.timer hyb_invalidate];
}

- (void)testTimerCount {
  NSUInteger count = 0;
  self.timer1 = [NSTimer hyb_scheduledTimerWithTimeInterval:0.5 count:2 callback:^(NSTimer *timer) {
    XCTAssert(count <= 2);
  }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
