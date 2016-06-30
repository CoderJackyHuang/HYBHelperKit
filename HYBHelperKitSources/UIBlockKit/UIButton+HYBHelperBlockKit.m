//
//  UIButton+HYBHelperBlockKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIButton+HYBHelperBlockKit.h"

@implementation UIButton (HYBHelperBlockKit)

+ (instancetype)hyb_buttonWithTouchUp:(HYBButtonBlock)onTouchUp {
  return [self hyb_buttonWithSuperView:nil constraints:nil touchUp:onTouchUp];
}

+ (instancetype)hyb_buttonWithSuperView:(UIView *)superView
                            constraints:(HYBConstraintMaker)constraints
                                touchUp:(HYBButtonBlock)touchUp {
  return [self hyb_buttonWithTitle:nil
                         superView:superView
                       constraints:constraints
                           touchUp:touchUp];
}

+ (instancetype)hyb_buttonWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp {
  return [self private_hyb_buttonWithTitle:title
                                     image:nil
                                  selImage:nil
                                 superView:superView
                               constraints:constraints
                                   touchUp:touchUp];
}

+ (instancetype)hyb_buttonWithImage:(id)image
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp {
  return [self hyb_buttonWithImage:image
                     selectedImage:nil
                         superView:superView
                       constraints:constraints
                           touchUp:touchUp];
}

+ (instancetype)hyb_buttonWithImage:(id)image
                      selectedImage:(id)selectedImage
                          superView:(UIView *)superView
                        constraints:(HYBConstraintMaker)constraints
                            touchUp:(HYBButtonBlock)touchUp {
  return [self private_hyb_buttonWithTitle:nil
                                     image:image
                                  selImage:selectedImage
                                 superView:superView
                               constraints:constraints
                                   touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_hyb_buttonWithTitle:(NSString *)title
                                      image:(id)image
                                   selImage:(id)selImage
                                  superView:(UIView *)superView
                                constraints:(HYBConstraintMaker)constaints
                                    touchUp:(HYBButtonBlock)touchUp {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.hyb_onTouchUp = touchUp;
  
  if (!kIsEmptyString(title)) {
    [button setTitle:title forState:UIControlStateNormal];
  }
  
  UIImage *normalImage = nil;
  if ([image isKindOfClass:[NSString class]]) {
    normalImage = kImage(image);
  } else if ([image isKindOfClass:[UIImage class]]) {
    normalImage = image;
  }
  
  UIImage *selectedImage = nil;
  if ([selImage isKindOfClass:[NSString class]]) {
    selectedImage = kImage(selImage);
  } else if ([selImage isKindOfClass:[UIImage class]]) {
    selectedImage = selImage;
  }
  
  if (normalImage) {
    [button setImage:normalImage forState:UIControlStateNormal];
  }
  
  if (selectedImage) {
    [button setImage:selectedImage forState:UIControlStateSelected];
  }
  
  [superView addSubview:button];
  
  if (superView && constaints) {
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      constaints(make);
    }];
  }
  
  return button;
}

@end
