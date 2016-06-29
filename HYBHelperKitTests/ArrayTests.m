//
//  ArrayTests.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+HYBHelperKit.h"
#import "NSMutableArray+HYBHelperKit.h"

@interface ArrayTests : XCTestCase

@end

@implementation ArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
  NSArray *array = @[@"sdf", @"s"];
  XCTAssert([[array hyb_objectAtIndex:0] isEqualToString:@"sdf"]);
  XCTAssert([[array hyb_objectAtIndex:1] isEqualToString:@"s"]);
  XCTAssert([array hyb_objectAtIndex:2] == nil);
  
  XCTAssert([array hyb_isContainsString:@"sdf"]);
  XCTAssert([array hyb_isContainsString:@"sdfs"] == NO);
  
  NSMutableArray *anotherArray = [[NSMutableArray alloc] init];
  XCTAssert([anotherArray hyb_addObject:nil] == NO);
 XCTAssert([anotherArray hyb_addObject:@"sdf"]);
  
  XCTAssert([anotherArray hyb_insertObject:@"sdf2" atIndex:0] == YES);
  XCTAssert([anotherArray hyb_insertObject:@"sdf5" atIndex:anotherArray.count] == YES);
  XCTAssert([anotherArray hyb_insertObject:@"sdf1" atIndex:anotherArray.count+1] == NO);
  
  XCTAssert([anotherArray hyb_removeObjectAtIndex:0] == YES);
  XCTAssert([anotherArray hyb_removeObjectAtIndex:10] == NO);
  XCTAssert([anotherArray hyb_removeObjectAtIndex:[anotherArray count]] == NO);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
