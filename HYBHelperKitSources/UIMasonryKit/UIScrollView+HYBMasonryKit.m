//
//  UIScrollView+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIScrollView+HYBMasonryKit.h"

@implementation UIScrollView (HYBMasonryKit)

+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate {
  return [self hyb_scrollViewWithDelegate:delegate superView:nil];
}

+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate superView:(UIView *)superView {
  if (superView == nil) {
    return [self hyb_scrollViewWithDelegate:delegate superView:superView constraints:nil];
  }
  
  return [self hyb_scrollViewWithDelegate:delegate superView:superView constraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(superView);
  }];
}

+ (instancetype)hyb_scrollViewWithDelegate:(id)delegate
                                 superView:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints {
  UIScrollView *scrollView = [[UIScrollView alloc] init];
  [superView addSubview:scrollView];
  
  if (superView && constraints) {
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
      constraints(make);
    }];
  }
  
  scrollView.delegate = delegate;
  scrollView.pagingEnabled = YES;
  scrollView.showsHorizontalScrollIndicator = YES;
  scrollView.showsVerticalScrollIndicator = NO;
  
  return scrollView;
}

@end
