//
//  ViewController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBHelperKit.h"
#import "TestViewController1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = kWhiteColor;
  
  UIButton *button = [UIButton hyb_buttonWithTitle:@"enter to test" superView:self.view constraints:^(MASConstraintMaker *make) {
    make.left.mas_offset(20);
    make.right.mas_offset(-20);
    make.height.mas_offset(50);
    make.top.mas_offset(80);
  } touchUp:^(UIButton *sender) {
    [self onEnterToTestCenter:sender];
  }];
  
  [button setBackgroundColor:kOrangeColor];
  [button setTitleColor:kWhiteColor forState:UIControlStateNormal];
}

- (IBAction)onEnterToTestCenter:(id)sender {
  HYBHelperKitTestEntranceController *vc = [[HYBHelperKitTestEntranceController alloc] initWithItems:^NSArray *{
    return @[[HYBHelperKitTestEntranceModel modelWithClass:[TestViewController1 class] title:@"Test1"],
            [HYBHelperKitTestEntranceModel modelWithClass:[UIViewController class] title:@"Test2"]
    ];
  }];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
