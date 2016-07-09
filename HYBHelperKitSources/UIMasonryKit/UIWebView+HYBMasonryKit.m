//
//  HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/9.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIWebView+HYBMasonryKit.h"

@implementation UIWebView (HYBMasonryKit)

+ (instancetype)hyb_webViewWithDelegate:(id)delegate {
  return [self hyb_webViewWithDelegate:delegate superView:nil];
}

+ (instancetype)hyb_webViewWithDelegate:(id)delegate superView:(UIView *)superView {
  return [self hyb_webViewWithDelegate:delegate superView:superView edges:UIEdgeInsetsZero];
}

+ (instancetype)hyb_webViewWithDelegate:(id)delegate superView:(UIView *)superView edges:(UIEdgeInsets)edges {
  return [self hyb_webViewWithDelegate:delegate superView:superView constraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(superView).insets(edges);
  }];
}

+ (instancetype)hyb_webViewWithDelegate:(id)delegate
                              superView:(UIView *)superView
                            constraints:(HYBConstraintMaker)constraints {
  UIWebView *webView = [[UIWebView alloc] init];
  
  // 自适应屏幕大小进行缩放
  webView.userInteractionEnabled = YES;
  webView.delegate = delegate;
  webView.scalesPageToFit = YES;
  webView.scrollView.showsVerticalScrollIndicator = NO;
 [superView addSubview:webView];
  
  if (superView) {
    if (constraints) {
      [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        constraints(make);
      }];
    } else {
      [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
      }];
    }
  }
  
  return webView;
}

@end
