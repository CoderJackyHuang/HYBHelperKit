//
//  HYBHelperKitBaseURLController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBHelperKitBaseURLController.h"

@interface HYBHelperKitBaseURLController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *baseURLs;
@property (nonatomic, copy) HYBStringBlock callback;

@end

@implementation HYBHelperKitBaseURLController

+ (instancetype)showWithBaseURLs:(NSArray *(^)(void))baseURLSources
                      onCallback:(HYBStringBlock)callback {
#ifdef DEBUG
  HYBHelperKitBaseURLController *vc = [[HYBHelperKitBaseURLController alloc] init];
  
  if (baseURLSources) {
    vc.baseURLs = baseURLSources();
  }
  
  vc.callback = callback;
  
  return vc;
#endif
  
  return nil;
}

- (instancetype)init {
  if (self = [super init]) {
    
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
}

@end
