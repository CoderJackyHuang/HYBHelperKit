//
//  HYBCommonMacroDefine.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#ifndef HYBCommonMacroDefine_h
#define HYBCommonMacroDefine_h

// Judge whether it is an empty string.
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

// Judge whether it is a nil or null object.
#define kIsEmptyObject(obj) (obj == nil || [obj isKindOfClass:[NSNull class]])

// Judge whether it is a vaid dictionary.
#define kIsDictionary(objDict) (objDict != nil && [objDict isKindOfClass:[NSDictionary class]])

// Judge whether it is a valid array.
#define kIsArray(objArray) (objArray != nil && [objArray isKindOfClass:[NSArray class]])

// Judge whether the device it is ipad.
#define kIsIPad \
  ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]\
  && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

// Judge whether current orientation is landscape.
#define kIsLandscape (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#endif /* HYBCommonMacroDefine_h */
