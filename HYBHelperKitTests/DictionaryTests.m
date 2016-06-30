//
//  DictionaryTests.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+HYBHelperKit.h"
#import "NSMutableDictionary+HYBHelperKit.h"

@interface DictionaryTests : XCTestCase

@end

@implementation DictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
  XCTAssertNotNil([@{@"1": @"23"} hyb_objectForKey:@"1"]);
  XCTAssertEqual([@{@"1": @"23"} hyb_objectForKey:@"1"], @"23");
  XCTAssertNil([@{@"1": @"23"} hyb_objectForKey:@"23"]);
   XCTAssertNil([@{@"1": @"23"} hyb_objectForKey:@""]);
  XCTAssertNil([@{@"1": @"23"} hyb_objectForKey:nil]);
  
  NSDictionary *dict = @{@"key" : @"value1",
                         @"key1" : @(2),
                         @"key2" : @(1),
                         @"key3" : @(YES),
                         @"key4" : @(NO),
                         @"key5" : @{@"s": @"sdf"},
                         @"key6" : @[@1, @2, @3]};
  XCTAssertEqual([dict hyb_integerForKey:@"key"], 0);
  XCTAssertEqual([dict hyb_integerForKey:@"key1"], 2);
  XCTAssertEqual([dict hyb_integerForKey:@"key2"], 1);
  XCTAssertEqual([dict hyb_integerForKey:@"key3"], 1);
  XCTAssertEqual([dict hyb_integerForKey:@"key4"], 0);
  
  XCTAssertEqual([dict hyb_numberForKey:@"key"], nil);
  XCTAssertEqual([dict hyb_numberForKey:@"key1"], @(2));
  XCTAssertEqual([dict hyb_numberForKey:@"key2"], @1);
  XCTAssertEqual([dict hyb_numberForKey:@"key3"], @YES);
  XCTAssertEqual([dict hyb_numberForKey:@"key4"], @NO);
  
  XCTAssertEqual([dict hyb_floatForKey:@"key"], 0);
  XCTAssertEqual([dict hyb_floatForKey:@"key1"], 2);
  XCTAssertEqual([dict hyb_floatForKey:@"key2"], 1);
  XCTAssertEqual([dict hyb_floatForKey:@"key3"], 1);
  XCTAssertEqual([dict hyb_floatForKey:@"key4"], 0);
 
  XCTAssertEqual([dict hyb_doubleForKey:@"key"], 0);
  XCTAssertEqual([dict hyb_doubleForKey:@"key1"], 2);
  XCTAssertEqual([dict hyb_doubleForKey:@"key2"], 1);
  XCTAssertEqual([dict hyb_doubleForKey:@"key3"], 1);
  XCTAssertEqual([dict hyb_doubleForKey:@"key4"], 0);
  
  XCTAssert([[dict hyb_stringForKey:@"key"] isEqualToString:@"value1"]);
  XCTAssert([[dict hyb_stringForKey:@"key1"] isEqualToString:@"2"]);
  XCTAssert([[dict hyb_stringForKey:@"key2"] isEqualToString: @"1"]);
  XCTAssert([[dict hyb_stringForKey:@"key3"] isEqualToString:@"1"]);
  XCTAssert([[dict hyb_stringForKey:@"key4"] isEqualToString: @"0"]);

  XCTAssertEqual([dict hyb_dictionaryForKey:@"key"], nil);
  XCTAssertEqual([dict hyb_dictionaryForKey:@"key1"], nil);
  XCTAssertEqual([dict hyb_dictionaryForKey:@"key2"], nil);
  XCTAssertEqual([dict hyb_dictionaryForKey:@"key3"], nil);
  XCTAssertEqual([dict hyb_dictionaryForKey:@"key4"], nil);
  XCTAssert([[[dict hyb_dictionaryForKey:@"key5"] objectForKey:@"s"] isEqualToString: @"sdf"]);
  XCTAssertEqual([dict hyb_dictionaryForKey:@"key6"], nil);

  XCTAssertEqual([dict hyb_arrayForKey:@"key"], nil);
  XCTAssertEqual([dict hyb_arrayForKey:@"key1"], nil);
  XCTAssertEqual([dict hyb_arrayForKey:@"key2"], nil);
  XCTAssertEqual([dict hyb_arrayForKey:@"key3"], nil);
  XCTAssertEqual([dict hyb_arrayForKey:@"key4"], nil);
  XCTAssertEqual([dict hyb_arrayForKey:@"key5"], nil);
  XCTAssertEqual([[dict hyb_arrayForKey:@"key6"] objectAtIndex:0], @1);

  XCTAssertEqual([dict hyb_boolForKey:@"key"], NO);
  XCTAssertEqual([dict hyb_boolForKey:@"key1"], YES);
  XCTAssertEqual([dict hyb_boolForKey:@"key2"], YES);
  XCTAssertEqual([dict hyb_boolForKey:@"key3"], YES);
  XCTAssertEqual([dict hyb_boolForKey:@"key4"], NO);
  XCTAssertEqual([dict hyb_boolForKey:@"key5"], NO);
  XCTAssertEqual([dict hyb_boolForKey:@"key6"], NO);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
