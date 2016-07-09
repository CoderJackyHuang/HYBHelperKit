//
//  HYBHelperKitBaseController.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/5.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBHelperKitBaseController.h"

@implementation HYBHelperKitBaseController

- (void)dealloc {
  
#if DEBUG
  NSLog(@"%@ dealloc", [[self class] description]);
#endif
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.automaticallyAdjustsScrollViewInsets = NO;
  self.view.backgroundColor = kWhiteColor;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
#if DEBUG
  NSLog(@"%@ viewDidAppear", [[self class] description]);
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
#if DEBUG
  NSLog(@"%@ viewDidDisappear", [[self class] description]);
#endif
}

- (UIButton *)hyb_leftButtonItem {
  return [[self hyb_leftButtonItems] hyb_objectAtIndex:0];
}

- (NSArray<UIButton *> *)hyb_leftButtonItems {
  NSMutableArray *array = [[NSMutableArray alloc] init];
  
  NSArray *leftItems = self.navigationItem.leftBarButtonItems;
  for (UIBarButtonItem *item in leftItems) {
    if ([item isKindOfClass:[UIBarButtonItem class]]) {
      if ([item.customView isKindOfClass:[UIButton class]]) {
        [array addObject:item.customView];
        break;
      }
    }
  }
  
  return array;
}

- (UIButton *)hyb_rightButtonItem {
  return [[self hyb_rightButtonItems] hyb_objectAtIndex:0];
}

- (NSArray<UIButton *> *)hyb_rightButtonItems {
  NSMutableArray *array = [[NSMutableArray alloc] init];
  
  NSArray *rightItems = self.navigationItem.rightBarButtonItems;
  for (UIBarButtonItem *item in rightItems) {
    if ([item isKindOfClass:[UIBarButtonItem class]]) {
      if ([item.customView isKindOfClass:[UIButton class]]) {
        [array addObject:item.customView];
        break;
      }
    }
  }
  
  return array;
}

- (void)hyb_adjustNavigationTitleToCenter {
  NSArray *viewControllerArray = [self.navigationController viewControllers];
  
  long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
  UIViewController *previous;
  
  if (previousViewControllerIndex >= 0) {
    previous = [viewControllerArray objectAtIndex:previousViewControllerIndex];
    previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                 initWithTitle:@" "
                                                 style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:nil];
  }
}

- (void)hyb_setNavLeftImage:(id)image block:(HYBButtonBlock)block {
  UIImage *normalImage = image;
  
  if ([normalImage isKindOfClass:[NSString class]]) {
    normalImage = kImage(image);
  }
  
  UIButton *btn = [UIButton hyb_buttonWithImage:image
                                      superView:nil
                                    constraints:nil
                                        touchUp:block];
  
  [self _hyb_setNavItems:@[btn] isLeft:YES];
}

- (void)hyb_setNavTitle:(id)title {
  if ([title isKindOfClass:[NSString class]]) {
    self.navigationItem.title = title;
  } else if ([title isKindOfClass:[UIView class]]) {
    self.navigationItem.titleView = title;
  } else if ([title isKindOfClass:[UIImage class]]) {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:(UIImage *)title];
    self.navigationItem.titleView = imageView;
    [imageView sizeToFit];
  }
}

#pragma mark - Private
- (void)_hyb_setNavItems:(NSArray *)buttons isLeft:(BOOL)isLeft {
  UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                     target:nil
                                     action:nil];
  negativeSpacer.width = -8;
  if (kIOSVersion < 7) {
    negativeSpacer.width = 0;
  }
  
  NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:buttons.count];
  [items addObject:negativeSpacer];
  
  for (NSUInteger i = 0; i < buttons.count; ++i) {
    UIButton *btn = [buttons hyb_objectAtIndex:i];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [items addObject:item];
  }
  
  if (isLeft) {
    self.navigationItem.leftBarButtonItems = items;
  } else {
    self.navigationItem.rightBarButtonItems = items;
  }
}

@end
