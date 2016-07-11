//
//  HYBHelperKitTestEntranceController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/1.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBHelperKitTestEntranceController.h"

@implementation HYBHelperKitTestEntranceModel

+ (instancetype)modelWithClass:(Class)vcClass title:(NSString *)title {
  HYBHelperKitTestEntranceModel *model = [[HYBHelperKitTestEntranceModel alloc] init];
  
  model.vcClass = vcClass;
  model.title = title;
  
  return model;
}

@end

@interface HYBHelperKitTestEntranceController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *sources;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HYBHelperKitTestEntranceController

- (instancetype)initWithItems:(NSArray<HYBHelperKitTestEntranceModel *> *(^)(void))items {
  if (self = [super init]) {
    if (items) {
      self.sources = items();
    }
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Test Center Entrance";
  
  self.tableView = [UITableView hyb_tableViewWithSuperview:self.view delegate:self];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:kHYBCellIdentifier];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.sources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHYBCellIdentifier];
  
  HYBHelperKitTestEntranceModel *model = [self.sources hyb_objectAtIndex:indexPath.row];
  
  if ([model isKindOfClass:[HYBHelperKitTestEntranceModel class]]) {
    if (kIsEmptyObject(model.title)) {
      cell.textLabel.text = [model.vcClass description];
    } else {
      cell.textLabel.text = model.title;
    }
  }
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  HYBHelperKitTestEntranceModel *model = [self.sources hyb_objectAtIndex:indexPath.row];
  
  if ([model isKindOfClass:[HYBHelperKitTestEntranceModel class]]) {
    if (model.vcClass) {
      UIViewController *vc = [[model.vcClass alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    }
  }
}

@end
