//
//  NSUserDefaultsTests.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSUserDefaults+HYBHelperKit.h"

@interface NSUserDefaultsTests : XCTestCase

@end

@implementation NSUserDefaultsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNullNilObject {
  NSDictionary *dict = @{@"key1" : [NSNull null],
                         @"key2" : @[@"s", @"df", @"null"]};
  BOOL ok = [[NSUserDefaults standardUserDefaults] hyb_setSafeObject:dict forKey:@"s"];
  XCTAssert(ok);
  
  ok = [[NSUserDefaults standardUserDefaults] hyb_setSafeObject:dict forKey:@""];
  XCTAssert(ok);

  ok = [[NSUserDefaults standardUserDefaults] hyb_setSafeObject:dict forKey:nil];
  XCTAssert(ok == NO);

  ok = [[NSUserDefaults standardUserDefaults] hyb_setSafeObject:nil forKey:@"s"];
  XCTAssert(ok == NO);

  ok = [[NSUserDefaults standardUserDefaults] hyb_setSafeObject:[NSNull null] forKey:@"s"];
  XCTAssert(ok == NO);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
