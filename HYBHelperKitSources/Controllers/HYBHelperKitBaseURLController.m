//
//  HYBHelperKitBaseURLController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBHelperKit.h"

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
  
  self.title = @"Base URL List";
  
  self.tableView = [UITableView hyb_tableViewWithSuperview:self.view delegate:self];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:kHYBCellIdentifier];
  self.tableView.backgroundColor = kWhiteColor;
  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
  
  self.textField = [UITextField hyb_textFieldWithHolder:@"Enter base url" delegate:nil superView:headerView constraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(10);
    make.height.mas_equalTo(30);
    make.width.mas_equalTo(kScreenWidth - 100);
    make.centerY.mas_equalTo(headerView);
  }];
  self.textField.borderStyle = UITextBorderStyleRoundedRect;
  
  UIButton *button = [UIButton hyb_buttonWithTitle:@"Go" superView:headerView constraints:^(MASConstraintMaker *make) {
    make.right.mas_equalTo(headerView).offset(-10);
    make.width.mas_equalTo(100 - 20);
    make.centerY.mas_equalTo(self.textField);
    make.height.mas_equalTo(30);
  } touchUp:^(UIButton *sender) {
    if (!kIsEmptyObject(self.textField.text)) {
      if (self.callback) {
        self.callback(self.textField.text);
      }
    }
  }];
  button.layer.cornerRadius = 3;
  button.layer.masksToBounds = YES;
  button.backgroundColor = kBlueColor;
  
  headerView.backgroundColor = kHexRGB(0xf0f0f0);
  self.tableView.tableHeaderView = headerView;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.baseURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHYBCellIdentifier];
  
  NSString *baseUrl = [self.baseURLs hyb_objectAtIndex:indexPath.row];
  cell.textLabel.text = baseUrl;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *baseUrl = [self.baseURLs hyb_objectAtIndex:indexPath.row];
  
  if (self.callback) {
    self.callback(baseUrl);
  }
}

@end
