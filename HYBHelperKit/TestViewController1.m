//
//  TestViewController1.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/9.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "TestViewController1.h"

@implementation TestViewController1

- (void)viewDidLoad {
  [super viewDidLoad];
  
//  [self hyb_setNavTitle:@"测试1"];
//  [self hyb_setNavTitle:@"Test2" rightTitle:@"Right button" rightBlock:^(UIButton *sender) {
//    NSLog(@"clicked");
//  }];
//  [self.hyb_rightButtonItem setTitleColor:kBlueColor forState:UIControlStateNormal];
  
  kWeakObject(self);
  [self hyb_setNavLeftButtonTitle:@"Back" onCliked:^(UIButton *sender) {
    [weakObject.navigationController popViewControllerAnimated:YES];
  }];
  [self.hyb_leftButtonItem setTitleColor:kBlueColor forState:UIControlStateNormal];
 
  [self hyb_setNavTitle:@"Test1" rightTitles:@[@"btton1", @"button2"] rightBlock:^(NSUInteger index, UIButton *sender) {
    NSLog(@"clicked at index: %ld", index);
  }];
  
  [self.hyb_rightButtonItems enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [obj setTitleColor:kPurpleColor forState:UIControlStateNormal];
  }];
}

@end
