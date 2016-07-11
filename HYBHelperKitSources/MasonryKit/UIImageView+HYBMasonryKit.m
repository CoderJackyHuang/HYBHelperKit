//
//  UIImageView+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIImageView+HYBMasonryKit.h"

@implementation UIImageView (HYBMasonryKit)

+ (instancetype)hyb_imageView {
  return [self hyb_imageViewWithSuperView:nil constraints:nil];
}

+ (instancetype)hyb_imageViewWithSuperView:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints {
  return [self hyb_imageViewWithSuperView:superView
                              constraints:constraints
                                  onTaped:nil];
}

+ (instancetype)hyb_imageViewWithSuperView:(UIView *)superView
                               constraints:(HYBConstraintMaker)constraints
                                   onTaped:(HYBTapGestureBlock)onTaped {
  return [self hyb_imageViewWithImage:nil
                             isCircle:NO
                            superView:superView
                          constraints:constraints
                              onTaped:onTaped];
}

+ (instancetype)hyb_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints {
  return [self hyb_imageViewWithImage:image
                            superView:superView
                          constraints:constraints
                              onTaped:nil];
}

+ (instancetype)hyb_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints
                               onTaped:(HYBTapGestureBlock)onTaped {
  return [self hyb_imageViewWithImage:image
                             isCircle:NO
                            superView:superView
                          constraints:constraints
                              onTaped:onTaped];
}

+ (instancetype)hyb_imageViewWithImage:(id)image
                              isCircle:(BOOL)isCircle
                             superView:(UIView *)superView
                           constraints:(HYBConstraintMaker)constraints
                               onTaped:(HYBTapGestureBlock)onTaped {
  UIImageView *imgView = [[UIImageView alloc] init];
  if (image != nil) {
    if ([image isKindOfClass:[NSString class]]) {
      imgView.image = kImage(image);
    } else {
      imgView.image = image;
    }
  }
  imgView.contentMode = UIViewContentModeScaleToFill;
  
  [superView addSubview:imgView];
  
  if (onTaped) {
    [imgView hyb_addTapGestureWithCallback:onTaped];
  }
  
  if (constraints && superView) {
      [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        constraints(make);
      }];
  }
  
  if (isCircle) {
    [imgView performSelector:@selector(updateLayerToCircle:)
                  withObject:imgView
                  afterDelay:0.0];
  }
  
  return imgView;
}

- (void)updateLayerToCircle:(UIImageView *)imgView {
  imgView.layer.cornerRadius = imgView.hyb_width / 2.0;
  imgView.layer.masksToBounds = YES;
  imgView.clipsToBounds = YES;
}

@end
