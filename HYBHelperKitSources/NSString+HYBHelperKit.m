//
//  NSString+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/6/29.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSString+HYBHelperKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HYBHelperKit)

- (NSString *)hyb_toMD5 {
  if (self == nil || [self length] == 0) {
    return nil;
  }
  
  unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
  CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
  NSMutableString *ms = [NSMutableString string];
  
  for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
    [ms appendFormat:@"%02x", (int)(digest[i])];
  }
  
  return [ms copy];
}

- (NSString *)hyb_to16MD5 {
  if (self == nil || [self length] == 0) {
    return nil;
  }
  
  return [[self hyb_toMD5] substringWithRange:NSMakeRange(8, 16)];
}

- (NSString *)hyb_sha1 {
  if (self == nil || [self length] == 0) {
    return nil;
  }
  
  unsigned char digest[CC_SHA1_DIGEST_LENGTH], i;
  CC_SHA1([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
  NSMutableString *ms = [NSMutableString string];
  
  for ( i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
    [ms appendFormat:@"%02x", (int)(digest[i])];
  }
  
  return [ms copy];
}

- (NSString *)hyb_sha256 {
  if (self == nil || [self length] == 0) {
    return nil;
  }
  
  unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
  CC_SHA256([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
  NSMutableString *ms = [NSMutableString string];
  
  for (i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
    [ms appendFormat: @"%02x", (int)(digest[i])];
  }
  
  return [ms copy];
}

- (NSString *)hyb_sha512 {
  if (self == nil || [self length] == 0) {
    return nil;
  }
  
  unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
  CC_SHA512([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
  NSMutableString *ms = [NSMutableString string];
  
  for (i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
    [ms appendFormat: @"%02x", (int)(digest[i])];
  }
  
  return [ms copy];
}

- (NSData *)hyb_toData {
  return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)hyb_toStringWithData:(NSData *)data {
  if (data && [data isKindOfClass:[NSData class]]) {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  }
  
  return nil;
}

- (BOOL)hyb_isEmail {
  return [NSString hyb_isEmail:self];
}

+ (BOOL)hyb_isEmail:(NSString *)email {
  NSString *reg =
  @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
  @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
  @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
  @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
  @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
  @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
  @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
  return [predicate evaluateWithObject:[email lowercaseString]];
}

- (BOOL)hyb_isMobilePhone {
  return [NSString hyb_isMobilePhone:self];
}

+ (BOOL)hyb_isMobilePhone:(NSString *)phone {
  NSString *pattern = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
  NSPredicate *mobilePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
  if ([mobilePredicate evaluateWithObject:phone]) {
    return YES;
  }
  
  return NO;
}

- (BOOL)hyb_isTelNumber {
  return [NSString hyb_isTelNumber:self];
}

+ (BOOL)hyb_isTelNumber:(NSString *)telNumber {
  NSString *pattern = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
  
  return [predicate evaluateWithObject:telNumber];
}

- (BOOL)hyb_isPersonID {
  return [NSString hyb_isPersonID:self];
}

+ (BOOL)hyb_isPersonID:(NSString *)PID {
  // 判断位数
  if (PID.length != 15 && PID.length != 18) {
    return NO;
  }
  NSString *carid = PID;
  long lSumQT = 0;
  // 加权因子
  int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
  // 校验码
  unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
  
  // 将15位身份证号转换成18位
  NSMutableString *mString = [NSMutableString stringWithString:PID];
  if (PID.length == 15) {
    [mString insertString:@"19" atIndex:6];
    long p = 0;
    const char *pid = [mString UTF8String];
    
    for (int i = 0; i<= 16; i++) {
      p += (pid[i] - 48) * R[i];
    }
    
    int o = p % 11;
    NSString *string_content = [NSString stringWithFormat:@"%c", sChecker[o]];
    [mString insertString:string_content atIndex:[mString length]];
    carid = mString;
  }
  
  // 判断地区码
  NSString * sProvince = [carid substringToIndex:2];
  if (![self _areaCode:sProvince]) {
    return NO;
  }
  
  // 判断年月日是否有效
  // 年份
  int strYear = [[self _substringWithString:carid begin:6 end:4] intValue];
  // 月份
  int strMonth = [[self _substringWithString:carid begin:10 end:2] intValue];
  // 日
  int strDay = [[self _substringWithString:carid begin:12 end:2] intValue];
  
  NSTimeZone *localZone = [NSTimeZone localTimeZone];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
  [dateFormatter setTimeZone:localZone];
  [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",
                                              strYear, strMonth, strDay]];
  if (date == nil) {
    return NO;
  }
  
  const char *PaperId  = [carid UTF8String];
  // 检验长度
  if(18 != strlen(PaperId)) return NO;
  // 校验数字
  for (int i = 0; i < 18; i++) {
    if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) ) {
      return NO;
    }
  }
  
  // 验证最末的校验码
  for (int i=0; i<=16; i++) {
    lSumQT += (PaperId[i]-48) * R[i];
  }
  
  if (sChecker[lSumQT%11] != PaperId[17] ) {
    return NO;
  }
  return YES;
}

- (NSString *)hyb_trimLeft {
  NSInteger len = 0;
  
  while (len < self.length) {
    if ([self characterAtIndex:len] != ' ') {
      break;
    }
    
    len++;
  }
  
  if (len >= self.length) {
    len = self.length - 1;
  }
  
  if (len <= 0) {
    return self;
  }
  
  return [self substringFromIndex:len];
}

- (NSString *)hyb_trimRight {
  NSInteger index = self.length - 1;
  for (NSInteger i = self.length - 1; i >= 0; --i) {
    if ([self characterAtIndex:i] != ' ') {
      break;
    } else {
      index--;
    }
  }
  
  if (index + 1 < self.length) {
    index++;
  }
  
  if (index + 1 >= self.length) {
    return self;
  }
  
  return [self substringToIndex:index];
}

- (NSString *)hyb_trim {
  NSString *str = [self hyb_trimLeft];
  return [str hyb_trimRight];
}

- (NSString *)hyb_trimAll {
  return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)hyb_trimLetters {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet letterCharacterSet]];
}

- (NSString *)hyb_trimCharacter:(unichar)character {
  NSString *str = [NSString stringWithFormat:@"%c", character];
  return [self stringByReplacingOccurrencesOfString:str withString:@""];
}

- (NSString *)hyb_trimWhitespace {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)hyb_trimWhitespaceAndNewLine {
 return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)hyb_isOnlyLetters {
  NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
  return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

- (BOOL)hyb_isOnlyDigits {
  NSCharacterSet *numSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
  return ([self rangeOfCharacterFromSet:numSet].location == NSNotFound);
}

- (BOOL)hyb_isOnlyAlphaNumeric {
  NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
  return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

- (NSURL *)hyb_toURL {
  return [NSURL URLWithString:self];
}

- (NSString *)hyb_URLEncode {
  NSString *result =
  CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                            (CFStringRef)self,
                                                            NULL,
                                                            CFSTR("!*'();:@&;=+$,/?%#[] "),
                                                            kCFStringEncodingUTF8));
  return result;
}

- (NSString *)hyb_filterHtml {
  return [NSString hyb_filterHTML:self];
}

+ (NSString *)hyb_filterHTML:(NSString *)html {
  if (html == nil) {
    return nil;
  }
  
  NSScanner *scanner = [NSScanner scannerWithString:html];
  NSString *text = nil;
  
  while ([scanner isAtEnd] == NO) {
    [scanner scanUpToString:@"<" intoString:nil];
    [scanner scanUpToString:@">" intoString:&text];
    html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text]
                                           withString:@""];
  }
  
  return html;
}

+ (NSString *)hyb_documentPath {
  return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString *)hyb_tmpPath {
  return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

+ (NSString *)hyb_cachePath {
  return [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
}

- (BOOL)hyb_isContainString:(NSString *)substring {
  return [self rangeOfString:substring].location != NSNotFound;
}

#pragma mark - Private
/**
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
+ (BOOL)_areaCode:(NSString *)code {
  NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
  [dic setObject:@"北京" forKey:@"11"];
  [dic setObject:@"天津" forKey:@"12"];
  [dic setObject:@"河北" forKey:@"13"];
  [dic setObject:@"山西" forKey:@"14"];
  [dic setObject:@"内蒙古" forKey:@"15"];
  [dic setObject:@"辽宁" forKey:@"21"];
  [dic setObject:@"吉林" forKey:@"22"];
  [dic setObject:@"黑龙江" forKey:@"23"];
  [dic setObject:@"上海" forKey:@"31"];
  [dic setObject:@"江苏" forKey:@"32"];
  [dic setObject:@"浙江" forKey:@"33"];
  [dic setObject:@"安徽" forKey:@"34"];
  [dic setObject:@"福建" forKey:@"35"];
  [dic setObject:@"江西" forKey:@"36"];
  [dic setObject:@"山东" forKey:@"37"];
  [dic setObject:@"河南" forKey:@"41"];
  [dic setObject:@"湖北" forKey:@"42"];
  [dic setObject:@"湖南" forKey:@"43"];
  [dic setObject:@"广东" forKey:@"44"];
  [dic setObject:@"广西" forKey:@"45"];
  [dic setObject:@"海南" forKey:@"46"];
  [dic setObject:@"重庆" forKey:@"50"];
  [dic setObject:@"四川" forKey:@"51"];
  [dic setObject:@"贵州" forKey:@"52"];
  [dic setObject:@"云南" forKey:@"53"];
  [dic setObject:@"西藏" forKey:@"54"];
  [dic setObject:@"陕西" forKey:@"61"];
  [dic setObject:@"甘肃" forKey:@"62"];
  [dic setObject:@"青海" forKey:@"63"];
  [dic setObject:@"宁夏" forKey:@"64"];
  [dic setObject:@"新疆" forKey:@"65"];
  [dic setObject:@"台湾" forKey:@"71"];
  [dic setObject:@"香港" forKey:@"81"];
  [dic setObject:@"澳门" forKey:@"82"];
  [dic setObject:@"国外" forKey:@"91"];
  
  if ([dic objectForKey:code] == nil) {
    return NO;
  }
  return YES;
}

+ (NSString *)_substringWithString:(NSString *)str begin:(NSInteger)begin end:(NSInteger )end {
  return [str substringWithRange:NSMakeRange(begin, end)];
}

@end
