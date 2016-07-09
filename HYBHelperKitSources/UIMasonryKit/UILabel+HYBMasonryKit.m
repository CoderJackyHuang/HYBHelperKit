//
//  UILabel+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/6.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UILabel+HYBMasonryKit.h"

@implementation UILabel (HYBMasonryKit)

+ (instancetype)hyb_labelWithFont:(CGFloat)font {
  return [self hyb_labelWithText:nil font:font];
}

+ (instancetype)hyb_labelWithText:(NSString *)text font:(CGFloat)font {
  return [self hyb_labelWithText:text font:font superView:nil constraints:nil];
}

+ (instancetype)hyb_labelWithText:(NSString *)text
                             font:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints {
  return [self hyb_labelWithText:text
                            font:font
                           lines:1
                       superView:superView
                     constraints:constraints];
}

+ (instancetype)hyb_labelWithFont:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints {
  return [self hyb_labelWithText:nil
                            font:font
                       superView:superView
                     constraints:constraints];
}

+ (instancetype)hyb_labelWithText:(NSString *)text
                             font:(CGFloat)font
                            lines:(NSInteger)lines
                        superView:(UIView *)superView
                      constraints:(HYBConstraintMaker)constraints {
  UILabel *label = [[UILabel alloc] init];
  label.text = text;
  label.font = kFontWithSize(font);
  label.textAlignment = NSTextAlignmentLeft;
  label.textColor = kBlackColor;
  label.backgroundColor = kClearColor;
  label.numberOfLines = lines;
  
  if (lines <= 0) {
    label.lineBreakMode = NSLineBreakByWordWrapping;
  } else {
    label.lineBreakMode = NSLineBreakByTruncatingTail;
  }
  
  [superView addSubview:label];
  
  if (superView && constraints) {
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
      constraints(make);
    }];
  }
  
  return label;
}

@end
