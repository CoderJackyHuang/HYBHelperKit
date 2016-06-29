//
//  NSStringTests.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+HYBHelperKit.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testExample {
  XCTAssert([[@"123456" hyb_toMD5] isEqualToString:@"e10adc3949ba59abbe56e057f20f883e"]);
  XCTAssert([[@"123456" hyb_to16MD5] isEqualToString:@"49ba59abbe56e057"]);
  
  XCTAssert([[@"123456" hyb_sha1] isEqualToString:@"7c4a8d09ca3762af61e59520943dc26494f8941b"]);
  XCTAssert([[@"123456" hyb_sha256] isEqualToString:@"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92"]);
  XCTAssert([[@"123456" hyb_sha512] isEqualToString:@"ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413"]);
  
  XCTAssert([@"123456" hyb_toData] != nil);
  XCTAssert([[NSString hyb_toStringWithData:[@"123456" hyb_toData]] isEqualToString:@"123456"]);
  
  XCTAssert([@"123" hyb_isEmail] == NO);
  XCTAssert([@"123@123" hyb_isEmail] == NO);
  XCTAssert([@"123@163.com" hyb_isEmail] == YES);
  
  XCTAssert([@"15001112099" hyb_isMobilePhone] == YES);
  XCTAssert([@"13001112099" hyb_isMobilePhone] == YES);
  XCTAssert([@"11001112099" hyb_isMobilePhone] == NO);
  XCTAssert([@"12001112099" hyb_isMobilePhone] == NO);
  XCTAssert([@"17001112099" hyb_isMobilePhone] == YES);
  
  XCTAssert([@"1235232" hyb_isContainString:@"123"] == YES);
  XCTAssert([@"1235232" hyb_isContainString:@"123s"] == NO);
}

- (void)testPerformanceExample {
  // This is an example of a performance test case.
  [self measureBlock:^{
    // Put the code you want to measure the time of here.
  }];
}

@end
