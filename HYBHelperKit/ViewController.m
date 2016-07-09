//
//  ViewController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBHelperKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = kWhiteColor;
}


- (IBAction)onEnterToTestCenter:(id)sender {
  HYBHelperKitTestEntranceController *vc = [[HYBHelperKitTestEntranceController alloc] initWithItems:^NSArray *{
    return @[[HYBHelperKitTestEntranceModel modelWithClass:[UIViewController class] title:nil],
            [HYBHelperKitTestEntranceModel modelWithClass:[UIViewController class] title:@"Test"]
    ];
  }];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
