//
//  NSFileManager+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/30.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (HYBHelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether file at path exists and check time out or not.
 *
 *	@param filePath	The file absolute path
 *	@param timeout	The specified time out.
 *
 *	@return NO if file exists and hasn't exceeded the specified time, otherwise YES.
 */
- (BOOL)hyb_isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get attributes of file at path.
 *
 *	@param path	The file path
 *
 *	@return The file attributes if file exists, otherwise nil.
 */
- (NSDictionary *)hyb_fileAttributesAtPath:(NSString *)path;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get file size at path
 *
 *	@param path	The file path
 *
 *	@return File real size at path, or 0 if file doesn't exist.
 */
- (unsigned long long)hyb_fileSizeAtPath:(NSString *)path;

@end
