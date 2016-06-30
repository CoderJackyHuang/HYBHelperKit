//
//  HYBHelperKitBaseURLController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBHelperKitBaseURLController.h"
#import "UITableView+HYBMasonryKit.h"
#import "HYBHelperFoundationKit.h"

static NSString *kCellIdentifier = @"HYBBaseURLCellIdentifier";

@interface HYBHelperKitBaseURLController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, copy) NSArray *baseURLs;
@property (nonatomic, copy) HYBStringBlock callback;

@end

@implementation HYBHelperKitBaseURLController

+ (instancetype)createWithBaseURLs:(NSArray *(^)(void))baseURLSources
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
  
  self.tableView = [UITableView hyb_tableViewWithSuperview:self.view delegate:self];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:kCellIdentifier];
  
  
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.baseURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
  
  NSString *baseUrl = [self.baseURLs hyb_objectAtIndex:indexPath.row];
  cell.detailTextLabel.text = baseUrl;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *baseUrl = [self.baseURLs hyb_objectAtIndex:indexPath.row];
  
  if (self.callback) {
    self.callback(baseUrl);
  }
}

@end
