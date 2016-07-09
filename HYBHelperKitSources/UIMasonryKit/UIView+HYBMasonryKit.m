//
//  UIView+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIView+HYBMasonryKit.h"

@implementation UIView (HYBMasonryKit)

+ (instancetype)hyb_viewWithSuperView:(UIView *)superView {
  return [self hyb_viewWithSuperView:superView onTaped:nil];
}

+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                              onTaped:(HYBTapGestureBlock)onTaped {
  return [self hyb_viewWithSuperView:superView constraints:nil onTaped:onTaped];
}

+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                          constraints:(HYBConstraintMaker)constraints {
  return [self hyb_viewWithSuperView:superView constraints:constraints onTaped:nil];
}

+ (instancetype)hyb_viewWithSuperView:(UIView *)superView
                          constraints:(HYBConstraintMaker)constraints
                              onTaped:(HYBTapGestureBlock)onTaped {
  UIView *view = [[[self class] alloc] init];
  if (onTaped) {
    [view hyb_addTapGestureWithCallback:onTaped];
  }
  
  view.backgroundColor = kWhiteColor;
  [superView addSubview:view];
  
  if (superView) {
    if (constraints) {
      [view mas_makeConstraints:^(MASConstraintMaker *make) {
        constraints(make);
      }];
    } else {
      [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(superView);
      }];
    }
  }
  
  return view;
}

+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                              height:(CGFloat)height
                               color:(UIColor *)color {
  return [self hyb_addTopLineToView:toView
                        leftPadding:0
                       rightPadding:0
                             height:height
                              color:color];
}

+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                            distance:(CGFloat)distance
                              height:(CGFloat)height
                               color:(UIColor *)color {
  return [self hyb_private_addLineToView:toView
                                   isTop:YES
                                distance:distance
                             leftPadding:0
                            rightPadding:0
                                  height:height
                                   color:color];
}

+ (instancetype)hyb_addTopLineToView:(UIView *)toView
                         leftPadding:(CGFloat)leftPadding
                        rightPadding:(CGFloat)rightPadding
                              height:(CGFloat)height
                               color:(UIColor *)color {
  return [self hyb_private_addLineToView:toView
                                   isTop:YES
                                distance:0
                             leftPadding:leftPadding
                            rightPadding:rightPadding
                                  height:height
                                   color:color];
}

+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                                 height:(CGFloat)height
                                  color:(UIColor *)color {
  return [self hyb_addBottomLineToView:toView
                           leftPadding:0
                          rightPadding:0
                                height:height
                                 color:color];
}

+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                               distance:(CGFloat)distance
                                 height:(CGFloat)height
                                  color:(UIColor *)color {
  return [self hyb_private_addLineToView:toView
                                   isTop:NO
                                distance:distance
                             leftPadding:0
                            rightPadding:0
                                  height:height
                                   color:color];
}

+ (instancetype)hyb_addBottomLineToView:(UIView *)toView
                            leftPadding:(CGFloat)leftPadding
                           rightPadding:(CGFloat)rightPadding
                                 height:(CGFloat)height
                                  color:(UIColor *)color {
  return [self hyb_private_addLineToView:toView
                                   isTop:NO
                                distance:0
                             leftPadding:leftPadding
                            rightPadding:rightPadding
                                  height:height
                                   color:color];
}

#pragma mark - Private
+ (instancetype)hyb_private_addLineToView:(UIView *)toView
                                    isTop:(BOOL)isTop
                                 distance:(CGFloat)distance
                              leftPadding:(CGFloat)leftPadding
                             rightPadding:(CGFloat)rightPadding
                                   height:(CGFloat)height
                                    color:(UIColor *)color {
  UIView *lineView = [[UIView alloc] init];
  lineView.backgroundColor = color;
  [toView addSubview:lineView];
  
  if (toView) {
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.mas_equalTo(leftPadding);
      
      if (isTop) {
        make.top.mas_equalTo(distance);
      } else {
        make.bottom.mas_equalTo(distance);
      }
      
      make.right.mas_equalTo(rightPadding);
      make.height.mas_equalTo(height);
    }];
  }
  
  return lineView;
}

@end
