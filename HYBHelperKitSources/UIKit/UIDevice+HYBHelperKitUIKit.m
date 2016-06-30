//
//  UIDevice+HYBHelperKitUIKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "UIDevice+HYBHelperKitUIKit.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

static NSString * const BFUniqueIdentifierDefaultsKey = @"BFUniqueIdentifier";

@implementation UIDevice (HYBHelperKitUIKit)

+ (NSString *)hyb_devicePlatform {
  size_t size;
  sysctlbyname("hw.machine", NULL, &size, NULL, 0);
  char *machine = malloc(size);
  sysctlbyname("hw.machine", machine, &size, NULL, 0);
  NSString *platform = [NSString stringWithUTF8String:machine];
  free(machine);
  
  return platform;
}

+ (NSString *)hyb_devicePlatformString {
  NSString *platform = [self hyb_devicePlatform];
  // iPhone
  if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
  if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
  if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
  if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
  if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
  if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
  if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
  if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
  if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
  if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (Global)";
  if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
  if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (Global)";
  if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
  if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
  if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
  if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
  // iPod
  if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
  if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
  if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
  if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
  if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
  // iPad
  if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
  if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
  if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
  if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
  if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
  if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
  if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
  if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
  if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
  if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
  if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
  if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
  if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
  if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
  if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
  if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
  if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
  if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
  if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
  // iPad mini
  if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
  if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
  if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
  if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
  if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
  if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
  // Simulator
  if ([platform isEqualToString:@"i386"])         return @"Simulator";
  if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
  return platform;
}

+ (BOOL)hyb_isiPad {
  return [[[self hyb_devicePlatform] substringToIndex:4] isEqualToString:@"iPad"];
}

+ (BOOL)hyb_isiPhone {
  return [[[self hyb_devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"];
}

+ (BOOL)hyb_isiPod {
  return [[[self hyb_devicePlatform] substringToIndex:4] isEqualToString:@"iPod"];
}

+ (BOOL)hyb_isSimulator {
  return [[self hyb_devicePlatform] isEqualToString:@"i386"]
  || [[self hyb_devicePlatform] isEqualToString:@"x86_64"];
}

+ (BOOL)hyb_isRetina {
  return [[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
  && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0);
}

+ (BOOL)hyb_isRetinaHD {
  return [[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
  && ([UIScreen mainScreen].scale == 3.0);
}

+ (NSInteger)hyb_iOSVersion {
  return [[[UIDevice currentDevice] systemVersion] integerValue];
}

+ (NSUInteger)hyb_cpuFrequency {
  return [self _getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)hyb_busFrequency {
  return [self _getSysInfo:HW_BUS_FREQ];
}

+ (NSUInteger)hyb_ramSize {
  return [self _getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)hyb_cpuNumber {
  return [self _getSysInfo:HW_NCPU];
}

+ (NSUInteger)hyb_totalMemory {
  return [self _getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)hyb_userMemory {
  return [self _getSysInfo:HW_USERMEM];
}

+ (NSNumber *)hyb_totalDiskSpace {
  NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
  return [fattributes objectForKey:NSFileSystemSize];
}

+ (NSNumber *)hyb_freeDiskSpace {
  NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
  return [fattributes objectForKey:NSFileSystemFreeSize];
}

+ (NSString *)hyb_macAddress {
  int                 mib[6];
  size_t              len;
  char                *buf;
  unsigned char       *ptr;
  struct if_msghdr    *ifm;
  struct sockaddr_dl  *sdl;
  
  mib[0] = CTL_NET;
  mib[1] = AF_ROUTE;
  mib[2] = 0;
  mib[3] = AF_LINK;
  mib[4] = NET_RT_IFLIST;
  
  if((mib[5] = if_nametoindex("en0")) == 0) {
    printf("Error: if_nametoindex error\n");
    return NULL;
  }
  
  if(sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
    printf("Error: sysctl, take 1\n");
    return NULL;
  }
  
  if((buf = malloc(len)) == NULL) {
    printf("Could not allocate memory. Rrror!\n");
    return NULL;
  }
  
  if(sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
    printf("Error: sysctl, take 2");
    return NULL;
  }
  
  ifm = (struct if_msghdr *)buf;
  sdl = (struct sockaddr_dl *)(ifm + 1);
  ptr = (unsigned char *)LLADDR(sdl);
  NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                         *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
  free(buf);
  
  return outstring;
}

+ (NSString *)hyb_uniqueIdentifier {
  NSString *uuid;
  if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
    uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
  } else {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    uuid = [defaults objectForKey:BFUniqueIdentifierDefaultsKey];
    if (!uuid) {
      uuid = [self _generateUUID];
      [defaults setObject:uuid forKey:BFUniqueIdentifierDefaultsKey];
      [defaults synchronize];
    }
  }
  return uuid;
}


#pragma mark - Private
+ (NSUInteger)_getSysInfo:(uint)typeSpecifier {
  size_t size = sizeof(int);
  int results;
  int mib[2] = {CTL_HW, typeSpecifier};
  sysctl(mib, 2, &results, &size, NULL, 0);
  return (NSUInteger) results;
}

+ (NSString *)_generateUUID {
  CFUUIDRef theUUID = CFUUIDCreate(NULL);
  CFStringRef string = CFUUIDCreateString(NULL, theUUID);
  CFRelease(theUUID);
  return (__bridge_transfer NSString *)string;
}

@end
