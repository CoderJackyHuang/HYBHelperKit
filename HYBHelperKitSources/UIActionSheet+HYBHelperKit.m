//
//  UIActionSheet+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/15.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIActionSheet+HYBHelperKit.h"
#import <objc/runtime.h>
#import "NSArray+HYBHelperKit.h"

@interface UIApplication (HDFActionSheet) <UIActionSheetDelegate>

@end

@implementation UIApplication (HDFActionSheet)

- (void)actionSheet:(nonnull UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (actionSheet.hyb_clickedButtonBlock) {
    actionSheet.hyb_clickedButtonBlock(actionSheet, buttonIndex);
  }
}

@end

static const void *s_HdfActionSheetClickedButtonBlock = "s_HdfActionSheetClickedButtonBlock";

@implementation UIActionSheet (HYBHelperKit)

- (void)setHyb_clickedButtonBlock:(HYBActionSheetClickedButtonBlock)hyb_clickedButtonBlock {
  objc_setAssociatedObject(self,
                           s_HdfActionSheetClickedButtonBlock,
                           hyb_clickedButtonBlock,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (HYBActionSheetClickedButtonBlock)hyb_clickedButtonBlock {
  return objc_getAssociatedObject(self, s_HdfActionSheetClickedButtonBlock);
}

+ (instancetype)hyb_showInView:(UIView *)inView
                            title:(NSString *)title
                      cancelTitle:(NSString *)cancelTitle
                 destructiveTitle:(NSString *)destructiveTitle
                      otherTitles:(NSArray *)otherTitles
                         callback:(HYBActionSheetClickedButtonBlock)callback {
  UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:title
                                                  delegate:[UIApplication sharedApplication]
                                         cancelButtonTitle:cancelTitle
                                    destructiveButtonTitle:destructiveTitle
                                         otherButtonTitles:
                       [otherTitles hyb_objectAtIndex:0],
                       [otherTitles hyb_objectAtIndex:1],
                       [otherTitles hyb_objectAtIndex:2],
                       [otherTitles hyb_objectAtIndex:3],
                       [otherTitles hyb_objectAtIndex:4],
                       [otherTitles hyb_objectAtIndex:5],
                       [otherTitles hyb_objectAtIndex:6],
                       [otherTitles hyb_objectAtIndex:7],
                       [otherTitles hyb_objectAtIndex:8],
                       [otherTitles hyb_objectAtIndex:9],
                       [otherTitles hyb_objectAtIndex:10],
                       [otherTitles hyb_objectAtIndex:11],
                       [otherTitles hyb_objectAtIndex:12],
                       [otherTitles hyb_objectAtIndex:13],
                       [otherTitles hyb_objectAtIndex:14],
                       [otherTitles hyb_objectAtIndex:15],
                       [otherTitles hyb_objectAtIndex:16],
                       [otherTitles hyb_objectAtIndex:17],
                       [otherTitles hyb_objectAtIndex:18],
                       [otherTitles hyb_objectAtIndex:19],
                       [otherTitles hyb_objectAtIndex:20],
                       [otherTitles hyb_objectAtIndex:21],
                       [otherTitles hyb_objectAtIndex:22],
                       [otherTitles hyb_objectAtIndex:23],
                       [otherTitles hyb_objectAtIndex:24],
                       [otherTitles hyb_objectAtIndex:25],
                       [otherTitles hyb_objectAtIndex:26],
                       [otherTitles hyb_objectAtIndex:27],
                       [otherTitles hyb_objectAtIndex:28],
                       [otherTitles hyb_objectAtIndex:29],nil];
  as.hyb_clickedButtonBlock = callback;
  
  [as showInView:inView];
  
  return as;
}
@end
