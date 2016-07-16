//
//  UITextField+HYBMasonryKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UITextField+HYBMasonryKit.h"
#import <objc/runtime.h>
#import "UIView+HYBHelperKitUIKit.h"

static const void *s_leftMarginOfCursorKey = "s_leftMarginOfCursor";

@implementation UITextField (HYBMasonryKit)

- (CGFloat)hyb_leftMarginOfCursor {
  NSNumber *number = objc_getAssociatedObject(self, s_leftMarginOfCursorKey);
  
  if ([number respondsToSelector:@selector(floatValue)]) {
    return [number floatValue];
  }
  
  return 8.0;
}

- (void)setHyb_leftMarginOfCursor:(CGFloat)hyb_leftMarginOfCursor {
  objc_setAssociatedObject(self,
                           s_leftMarginOfCursorKey,
                           @(hyb_leftMarginOfCursor),
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  if (self.leftView) {
    self.leftView.hyb_width = hyb_leftMarginOfCursor;
  }
}

+ (instancetype)hyb_textFieldWithHolder:(NSString *)holder
                              superView:(UIView *)superView
                            constraints:(HYBConstraintMaker)constraints {
  return [self hyb_textFieldWithHolder:holder
                                  text:nil
                             superView:superView
                           constraints:constraints];
}

+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints {
  return [self hyb_textFieldWithHolder:holder
                                  text:text
                              delegate:nil
                             superView:superView
                           constraints:constraints];
}

+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints {
  return [self hyb_textFieldWithHolder:holder
                                  text:nil
                              delegate:delegate
                             superView:superView
                           constraints:constraints];
}

+ (UITextField *)hyb_textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView
                             constraints:(HYBConstraintMaker)constraints {
  UITextField *textField = [[UITextField alloc] init];
  textField.borderStyle = UITextBorderStyleNone;
  textField.leftView = [[UIView alloc] init];
  textField.leftView.backgroundColor = [UIColor clearColor];
  textField.leftView.hyb_width = textField.hyb_leftMarginOfCursor;
  textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
  textField.autocorrectionType = UITextAutocorrectionTypeNo;
  textField.spellCheckingType = UITextSpellCheckingTypeNo;
  textField.delegate = delegate;
  [superView addSubview:textField];
  
  textField.placeholder = holder;
  textField.text = text;
  
  if (superView && constraints) {
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
      constraints(make);
    }];
  }
  
  return textField;
}

@end
