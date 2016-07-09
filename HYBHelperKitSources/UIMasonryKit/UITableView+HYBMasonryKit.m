//
//  UITableView+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UITableView+HYBMasonryKit.h"

@implementation UITableView (HYBMasonryKit)

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView {
  return [self hyb_tableViewWithSuperview:superView delegate:nil];
}

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints {
  return [self hyb_tableViewWithSuperview:superView delegate:nil constraints:constraints];
}

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView delegate:(id)delegate {
  return [self hyb_tableViewWithSuperview:superView
                                 delegate:delegate
                              constraints:^(MASConstraintMaker *make) {
                                if (superView) {
                                  make.edges.mas_equalTo(superView);
                                }
                              }];
}

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                               constraints:(HYBConstraintMaker)constraints {
  return [self hyb_tableViewWithSuperview:superView
                                 delegate:delegate
                                    style:UITableViewStylePlain
                              constraints:constraints];
}

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                                     style:(UITableViewStyle)style
                               constraints:(HYBConstraintMaker)constraints {
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
  tableView.delegate = delegate;
  tableView.dataSource = delegate;
  tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
  [superView addSubview:tableView];
  
  if (superView && constraints) {
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
      constraints(make);
    }];
  }
  
  return tableView;
}

@end
