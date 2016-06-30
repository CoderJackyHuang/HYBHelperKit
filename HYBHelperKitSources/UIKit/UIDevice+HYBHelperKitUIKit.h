//
//  UIDevice+HYBHelperKitUIKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (HYBHelperKitUIKit)

/**
 *  Return the device platform string
 *  Example: "iPhone3,2"
 *
 *  @return Return the device platform string
 */
+ (NSString *)hyb_devicePlatform;

/**
 *  Return the user-friendly device platform string
 *  Example: "iPad Air (Cellular)"
 *
 *  @return Return the user-friendly device platform string
 */
+ (NSString *)hyb_devicePlatformString;

/**
 *  Check if the current device is an iPad
 *
 *  @return Return YES if it's an iPad, NO if not
 */
+ (BOOL)hyb_isiPad;

/**
 *  Check if the current device is an iPhone
 *
 *  @return Return YES if it's an iPhone, NO if not
 */
+ (BOOL)hyb_isiPhone;

/**
 *  Check if the current device is an iPod
 *
 *  @return Return YES if it's an iPod, NO if not
 */
+ (BOOL)hyb_isiPod;

/**
 *  Check if the current device is the simulator
 *
 *  @return Return YES if it's the simulator, NO if not
 */
+ (BOOL)hyb_isSimulator;

/**
 *  Check if the current device has a Retina display
 *
 *  @return Return YES if it has a Retina display, NO if not
 */
+ (BOOL)hyb_isRetina;

/**
 *  Check if the current device has a Retina HD display
 *
 *  @return Return YES if it has a Retina HD display, NO if not
 */
+ (BOOL)hyb_isRetinaHD;

/**
 *  Return the iOS version without the subversion
 *  Example: 7
 *
 *  @return Return the iOS version
 */
+ (NSInteger)hyb_iOSVersion;

/**
 *  Return the current device CPU frequency
 *
 *  @return Return the current device CPU frequency
 */
+ (NSUInteger)hyb_cpuFrequency;

/**
 *  Return the current device BUS frequency
 *
 *  @return Return the current device BUS frequency
 */
+ (NSUInteger)hyb_busFrequency;

/**
 *  Return the current device RAM size
 *
 *  @return Return the current device RAM size
 */
+ (NSUInteger)hyb_ramSize;

/**
 *  Return the current device CPU number
 *
 *  @return Return the current device CPU number
 */
+ (NSUInteger)hyb_cpuNumber;

/**
 *  Return the current device total memory
 *
 *  @return Return the current device total memory
 */
+ (NSUInteger)hyb_totalMemory;

/**
 *  Return the current device non-kernel memory
 *
 *  @return Return the current device non-kernel memory
 */
+ (NSUInteger)hyb_userMemory;

/**
 *  Return the current device total disk space
 *
 *  @return Return the current device total disk space
 */
+ (NSNumber *)hyb_totalDiskSpace;

/**
 *  Return the current device free disk space
 *
 *  @return Return the current device free disk space
 */
+ (NSNumber *)hyb_freeDiskSpace;

/**
 *  Return the current device MAC address
 *
 *  @return Return the current device MAC address
 */
+ (NSString *)hyb_macAddress;

/**
 *  Generate an unique identifier and store it into standardUserDefaults
 *
 *  @return Return a unique identifier as a NSString
 */
+ (NSString *)hyb_uniqueIdentifier;

@end
