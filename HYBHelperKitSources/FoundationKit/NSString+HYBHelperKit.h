//
//  NSString+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HYBHelperKit)

#pragma mark - Encrypt and decrypt
/**
 *	Convert the string to 32bit md5 string.
 *
 *	@return 32bit md5
 */
- (NSString *)hyb_toMD5;

/**
 *	Convert the string to 16bit md5 string.
 *
 *	@return 16bit md5
 */
- (NSString *)hyb_to16MD5;

/**
 *	Encrypt the string with sha1 argorithm.
 *
 *	@return The sha1 string.
 */
- (NSString *)hyb_sha1;

/**
 *	Encrypt the string with sha256 argorithm.
 *
 *	@return The sha256 string.
 */
- (NSString *)hyb_sha256;

/**
 *	Encrypt the string with sha512 argorithm.
 *
 *	@return The sha512 string.
 */
- (NSString *)hyb_sha512;

#pragma mark - Data convert to string or string to data.
/**
 *	Convert the current string to data.
 *
 *	@return data object if convert successfully, otherwise nil.
 */
- (NSData *)hyb_toData;

/**
 *	Convert a data object to string.
 *
 *	@param data	The data will be converted.
 *
 *	@return string object if convert successfully, otherwise nil.
 */
+ (NSString *)hyb_toStringWithData:(NSData *)data;

#pragma mark - Check email, phone, tel, or persion id.
/**
 *	Check whether the string is a valid kind of email format.
 *
 *	@return YES if it is a valid format, otherwise false.
 */
- (BOOL)hyb_isEmail;

/**
 *	Check whether the string is a valid kind of email format.
 *
 *	@param email The string to be checked.
 *
 *	@return YES if it is a valid format, otherwise false.
 */
+ (BOOL)hyb_isEmail:(NSString *)email;

/**
 *	Check whether the string is a valid kind of mobile phone format.
 *  Now only check 11 numbers and begin with 1.
 *
 *	@return YES if passed, otherwise false.
 */
- (BOOL)hyb_isMobilePhone;

/**
 *	Check whether the string is a valid kind of mobile phone format.
 *
 *  @param phone The phone to be checked.
 *
 *	@return YES if passed, otherwise false.
 */
+ (BOOL)hyb_isMobilePhone:(NSString *)phone;

/**
 *	Check whether it is a valid kind of tel number format.
 *
 *	@return YES if passed, otherwise false.
 */
- (BOOL)hyb_isTelNumber;

/**
 *	Check whether it is a valid kind of tel number format.
 *
 *	@param telNumber	The tel number to be checked.
 *
 *	@return YES if passed, otherwise false.
 */
+ (BOOL)hyb_isTelNumber:(NSString *)telNumber;

/**
 *	Check whether it is a valid kind of Chinese Persion ID
 *
 *	@return YES if it is valid kind of PID, otherwise false.
 */
- (BOOL)hyb_isPersonID;

/**
 *	Check whether it is a valid kind of Chinese Persion ID
 *
 *	@param PID	The Chinese Persion ID to be checked.
 *
 *	@return YES if it is valid kind of PID, otherwise false.
 */
+ (BOOL)hyb_isPersonID:(NSString *)PID;

#pragma mark - Trim Character
/**
 *	Trim the left blank space
 *
 *	@return The new string without left blank space.
 */
- (NSString *)hyb_trimLeft;

/**
 *	Trim the right blank space
 *
 *	@return The new string without right blank space.
 */
- (NSString *)hyb_trimRight;

/**
 *	Trim the left and the right blank space
 *
 *	@return The new string without left and right blank space.
 */
- (NSString *)hyb_trim;

/**
 *	Trim all blank space in the string.
 *
 *	@return The new string without blank space.
 */
- (NSString *)hyb_trimAll;

/**
 *	Trim letters.
 *
 *	@return The new string without letters.
 */
- (NSString *)hyb_trimLetters;

/**
 *	Trim all the specified characters.
 *
 *	@param character	The character to be trimed.
 *
 *	@return The new string without the specified character.
 */
- (NSString *)hyb_trimCharacter:(unichar)character;

/**
 *	Trim white space.
 *
 *	@return The new string without white space.
 */
- (NSString *)hyb_trimWhitespace;

/**
 *	Trim all whitespace and new line.
 *
 *	@return The new string without white space and new line.
 */
- (NSString *)hyb_trimWhitespaceAndNewLine;

#pragma mark - Check letters, numbers or letter and numbers
/**
 *	Check whether it only contains letters.
 *
 *	@return YES if only containing letters, otherwise NO.
 */
- (BOOL)hyb_isOnlyLetters;

/**
 *	Check whether it only contains digit numbers.
 *
 *	@return YES if only containing digit numbers, otherwise NO.
 */
- (BOOL)hyb_isOnlyDigits;

/**
 *	Check whether it only contains letters and digit numbers.
 *
 *	@return YES if only containing letters and digit numbers, otherwise NO.
 */
- (BOOL)hyb_isOnlyAlphaNumeric;

#pragma mark - URL
/**
 *	Try to convert the string to a NSURL object.
 *
 *	@return NSURL object if converts successfully, otherwise nil.
 */
- (NSURL *)hyb_toURL;

/**
 *	Try to do a url encode.
 *
 *	@return Encoded string.
 */
- (NSString *)hyb_URLEncode;

#pragma mark - HTML
/**
 *	Filter html tags in the string.
 *
 *	@return A new string without html tags.
 */
- (NSString *)hyb_filterHtml;

/**
 *	Fileter html tags in the specified string.
 *
 *	@param html	The specified html string.
 *
 *	@return A new string without html tags.
 */
+ (NSString *)hyb_filterHTML:(NSString *)html;

#pragma mark - Get document/tmp/Cache path
/**
 *	Get the absolute path of the document.
 *
 *	@return Document path.
 */
+ (NSString *)hyb_documentPath;

/**
 *	Get the absolute path of tmp
 *
 *	@return Tmp path
 */
+ (NSString *)hyb_tmpPath;

/**
 *	Get the absolute path of Cache.
 *
 *	@return Cache absolute path
 */
+ (NSString *)hyb_cachePath;

#pragma mark - String operation
/**
 *	Check whether current string contains the substring.
 *
 *	@param substring	Substring
 *
 *	@return YES if containing, otherwise NO.
 */
- (BOOL)hyb_isContainString:(NSString *)substring;



@end
