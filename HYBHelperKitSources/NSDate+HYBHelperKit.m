//
//  NSDate+HYBHelperKit.m
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/11.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "NSDate+HYBHelperKit.h"

@implementation NSDate (HYBHelperKit)

- (NSUInteger)hyb_day {
  return [NSDate hyb_day:self];
}

- (NSUInteger)hyb_month {
  return [NSDate hyb_month:self];
}

- (NSUInteger)hyb_year {
  return [NSDate hyb_year:self];
}

- (NSUInteger)hyb_hour {
  return [NSDate hyb_hour:self];
}

- (NSUInteger)hyb_minute {
  return [NSDate hyb_minute:self];
}

- (NSUInteger)hyb_second {
  return [NSDate hyb_second:self];
}

+ (NSUInteger)hyb_day:(NSDate *)hyb_date {
  return [[self hyb_dateComponentsWithDate:hyb_date] day];
}

+ (NSUInteger)hyb_month:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth)fromDate:hyb_date];
#else
  NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit)fromDate:hyb_date];
#endif
  
  return [dayComponents month];
}

+ (NSUInteger)hyb_year:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear)fromDate:hyb_date];
#else
  NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit)fromDate:hyb_date];
#endif
  
  return [dayComponents year];
}

+ (NSUInteger)hyb_hour:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour)fromDate:hyb_date];
#else
  NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit)fromDate:hyb_date];
#endif
  
  return [dayComponents hour];
}

+ (NSUInteger)hyb_minute:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute)fromDate:hyb_date];
#else
  NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit)fromDate:hyb_date];
#endif
  
  return [dayComponents minute];
}

+ (NSUInteger)hyb_second:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond)fromDate:hyb_date];
#else
  NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit)fromDate:hyb_date];
#endif
  
  return [dayComponents second];
}

- (NSUInteger)hyb_daysInYear {
  return [NSDate hyb_daysInYear:self];
}

+ (NSUInteger)hyb_daysInYear:(NSDate *)hyb_date {
  return [self hyb_isLeapYear:hyb_date] ? 366 : 365;
}

- (BOOL)hyb_isLeapYear {
  return [NSDate hyb_isLeapYear:self];
}

+ (BOOL)hyb_isLeapYear:(NSDate *)hyb_date {
  int year = (int)[hyb_date hyb_year];
  return [self hyb_isLeapYearWithYear:year];
}

+ (BOOL)hyb_isLeapYearWithYear:(int)year {
  if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
    return YES;
  }
  
  return NO;
}

- (NSString *)hyb_toStringWithFormatYMD {
  return [NSDate hyb_toStringWithFormatYMD:self];
}

+ (NSString *)hyb_toStringWithFormatYMD:(NSDate *)hyb_date {
  return [NSString stringWithFormat:@"%ld-%02ld-%02ld",
          (long)[hyb_date hyb_year],
          (long)[hyb_date hyb_month],
          (long)[hyb_date hyb_day]];
}

- (NSUInteger)hyb_howManyWeeksOfMonth {
  return [NSDate hyb_howManyWeeksOfMonth:self];
}

+ (NSUInteger)hyb_howManyWeeksOfMonth:(NSDate *)hyb_date {
  return [[hyb_date hyb_lastDayOfMonth] hyb_weekOfYear] - [[hyb_date hyb_beginDayOfMonth] hyb_weekOfYear] + 1;
}

- (NSUInteger)hyb_weekOfYear {
  return [NSDate hyb_weekOfYear:self];
}

+ (NSUInteger)hyb_weekOfYear:(NSDate *)hyb_date {
  NSUInteger i;
  NSUInteger year = [hyb_date hyb_year];
  
  NSDate *lastdate = [hyb_date hyb_lastDayOfMonth];
  
  for (i = 1;[[lastdate hyb_dateAfterDay:-7 * i] hyb_year] == year; i++) {
    
  }
  
  return i;
}

- (NSDate *)hyb_dateAfterDay:(NSUInteger)hyb_day {
  return [NSDate hyb_dateAfterDate:self day:hyb_day];
}

+ (NSDate *)hyb_dateAfterDate:(NSDate *)hyb_date day:(NSInteger)hyb_day {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
  [componentsToAdd setDay:hyb_day];
  
  NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:hyb_date options:0];
  
  return dateAfterDay;
}

- (NSDate *)hyb_dateAfterMonth:(NSUInteger)hyb_month {
  return [NSDate hyb_dateAfterDate:self month:hyb_month];
}

+ (NSDate *)hyb_dateAfterDate:(NSDate *)hyb_date month:(NSInteger)hyb_month {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
  [componentsToAdd setMonth:hyb_month];
  NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:hyb_date options:0];
  
  return dateAfterMonth;
}

- (NSDate *)hyb_beginDayOfMonth {
  return [NSDate hyb_beginDayOfMonth:self];
}

+ (NSDate *)hyb_beginDayOfMonth:(NSDate *)hyb_date {
  return [self hyb_dateAfterDate:hyb_date day:-[hyb_date hyb_day] + 1];
}

- (NSDate *)hyb_lastDayOfMonth {
  return [NSDate hyb_lastDayOfMonth:self];
}

+ (NSDate *)hyb_lastDayOfMonth:(NSDate *)hyb_date {
  NSDate *lastDate = [self hyb_beginDayOfMonth:hyb_date];
  return [[lastDate hyb_dateAfterMonth:1] hyb_dateAfterDay:-1];
}

- (NSUInteger)hyb_daysAgo {
  return [NSDate hyb_daysAgo:self];
}

+ (NSUInteger)hyb_daysAgo:(NSDate *)hyb_date {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                             fromDate:hyb_date
                                               toDate:[NSDate date]
                                              options:0];
#else
  NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                             fromDate:hyb_date
                                               toDate:[NSDate date]
                                              options:0];
#endif
  
  return [components day];
}

- (NSInteger)hyb_weekday {
  return [NSDate hyb_weekday:self];
}

+ (NSInteger)hyb_weekday:(NSDate *)hyb_date {
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:hyb_date];
  NSInteger weekday = [comps weekday];
  
  return weekday;
}

- (NSString *)hyb_dayFromWeekday {
  return [NSDate hyb_dayFromWeekday:self];
}

+ (NSString *)hyb_dayFromWeekday:(NSDate *)hyb_date {
  switch([hyb_date hyb_weekday]) {
    case 1:
      return @"星期天";
      break;
    case 2:
      return @"星期一";
      break;
    case 3:
      return @"星期二";
      break;
    case 4:
      return @"星期三";
      break;
    case 5:
      return @"星期四";
      break;
    case 6:
      return @"星期五";
      break;
    case 7:
      return @"星期六";
      break;
    default:
      break;
  }
  return @"";
}

- (BOOL)hyb_isSameDate:(NSDate *)hyb_anotherDate {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                        | NSCalendarUnitMonth
                                                        | NSCalendarUnitDay)
                                              fromDate:self];
  NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                        | NSCalendarUnitMonth
                                                        | NSCalendarUnitDay)
                                              fromDate:hyb_anotherDate];
  return ([components1 year] == [components2 year]
          && [components1 month] == [components2 month]
          && [components1 day] == [components2 day]);
}

- (BOOL)hyb_isToday {
  return [self hyb_isSameDate:[NSDate date]];
}

- (NSDate *)hyb_dateByAddingDays:(NSUInteger)hyb_days {
  NSDateComponents *c = [[NSDateComponents alloc] init];
  c.day = hyb_days;
  return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)hyb_monthWithMonthNumber:(NSInteger)hyb_month {
  switch(hyb_month) {
    case 1:
      return @"January";
      break;
    case 2:
      return @"February";
      break;
    case 3:
      return @"March";
      break;
    case 4:
      return @"April";
      break;
    case 5:
      return @"May";
      break;
    case 6:
      return @"June";
      break;
    case 7:
      return @"July";
      break;
    case 8:
      return @"August";
      break;
    case 9:
      return @"September";
      break;
    case 10:
      return @"October";
      break;
    case 11:
      return @"November";
      break;
    case 12:
      return @"December";
      break;
    default:
      break;
  }
  return @"";
}

+ (NSString *)hyb_stringWithDate:(NSDate *)hyb_date format:(NSString *)hyb_format {
  return [hyb_date hyb_stringWithFormat:hyb_format];
}

- (NSString *)hyb_stringWithFormat:(NSString *)hyb_format {
  NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
  [outputFormatter setDateFormat:hyb_format];
  [outputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
  NSString *retStr = [outputFormatter stringFromDate:self];
  
  return retStr;
}

+ (NSDate *)hyb_dateWithString:(NSString *)hyb_string format:(NSString *)hyb_format {
  NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
  [inputFormatter setDateFormat:hyb_format];
  [inputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
  NSDate *date = [inputFormatter dateFromString:hyb_string];
  
  return date;
}

- (NSUInteger)hyb_daysInMonth:(NSUInteger)hyb_month {
  return [NSDate hyb_daysInMonth:self month:hyb_month];
}

+ (NSUInteger)hyb_dayInYear:(NSUInteger)year month:(NSUInteger)month {
  switch (month) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
      return 31;
    case 2:
      return [self hyb_isLeapYearWithYear:(int)year] ? 29 : 28;
  }
  
  return 30;
}

+ (NSUInteger)hyb_daysInMonth:(NSDate *)hyb_date month:(NSUInteger)hyb_month {
  switch (hyb_month) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
      return 31;
    case 2:
      return [hyb_date hyb_isLeapYear] ? 29 : 28;
  }
  return 30;
}

- (NSUInteger)hyb_daysInMonth {
  return [NSDate hyb_daysInMonth:self];
}

+ (NSUInteger)hyb_daysInMonth:(NSDate *)hyb_date {
  return [self hyb_daysInMonth:hyb_date month:[hyb_date hyb_month]];
}

- (NSString *)hyb_timeInfo {
  return [NSDate hyb_timeInfoWithDate:self];
}

+ (NSString *)hyb_timeInfoWithDate:(NSDate *)hyb_date {
  return [self hyb_timeInfoWithDateString:[self hyb_stringWithDate:hyb_date format:[self hyb_ymdHmsFormat]]];
}

+ (NSString *)hyb_timeInfoWithDateString:(NSString *)hyb_dateString {
  NSDate *date = [self hyb_dateWithString:hyb_dateString format:[self hyb_ymdHmsFormat]];
  
  NSDate *curDate = [NSDate date];
  NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
  
  int month = (int)([curDate hyb_month] - [date hyb_month]);
  int year = (int)([curDate hyb_year] - [date hyb_year]);
  int day = (int)([curDate hyb_day] - [date hyb_day]);
  
  NSTimeInterval retTime = 1.0;
  if (time < 3600) { // 小于一小时
    retTime = time / 60;
    retTime = retTime <= 0.0 ? 1.0 : retTime;
    return [NSString stringWithFormat:@"%.0f分钟前", retTime];
  } else if (time < 3600 * 24) { // 小于一天，也就是今天
    retTime = time / 3600;
    retTime = retTime <= 0.0 ? 1.0 : retTime;
    return [NSString stringWithFormat:@"%.0f小时前", retTime];
  } else if (time < 3600 * 24 * 2) {
    return @"昨天";
  }
  // 第一个条件是同年，且相隔时间在一个月内
  // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
  else if ((abs(year) == 0 && abs(month) <= 1)
           || (abs(year) == 1 && [curDate hyb_month] == 1 && [date hyb_month] == 12)) {
    int retDay = 0;
    if (year == 0) { // 同年
      if (month == 0) { // 同月
        retDay = day;
      }
    }
    
    if (retDay <= 0) {
      // 获取发布日期中，该月有多少天
      int totalDays = (int)[self hyb_daysInMonth:date month:[date hyb_month]];
      
      // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
      retDay = (int)[curDate hyb_day] + (totalDays - (int)[date hyb_day]);
    }
    
    return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
  } else  {
    if (abs(year) <= 1) {
      if (year == 0) { // 同年
        return [NSString stringWithFormat:@"%d个月前", abs(month)];
      }
      
      // 隔年
      int month = (int)[curDate hyb_month];
      int preMonth = (int)[date hyb_month];
      if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
        return @"1年前";
      }
      return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
    }
    
    return [NSString stringWithFormat:@"%d年前", abs(year)];
  }
  
  return @"1小时前";
}

- (NSString *)hyb_ymdFormat {
  return [NSDate hyb_ymdFormat];
}

- (NSString *)hyb_hmsFormat {
  return [NSDate hyb_hmsFormat];
}

- (NSString *)hyb_ymdHmsFormat {
  return [NSDate hyb_ymdHmsFormat];
}

+ (NSString *)hyb_ymdFormat {
  return @"yyyy-MM-dd";
}

+ (NSString *)hyb_hmsFormat {
  return @"HH:mm:ss";
}

+ (NSString *)hyb_ymdHmsFormat {
  return [NSString stringWithFormat:@"%@ %@", [self hyb_ymdFormat], [self hyb_hmsFormat]];
}

- (NSDate *)hyb_offsetYears:(int)hyb_numYears {
  return [NSDate hyb_offsetYears:hyb_numYears fromDate:self];
}

+ (NSDate *)hyb_offsetYears:(int)hyb_numYears fromDate:(NSDate *)hyb_fromDate {
  if (hyb_fromDate == nil) {
    return nil;
  }
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSGregorianCalendar];
#endif
  
  
  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setYear:hyb_numYears];
  
  return [gregorian dateByAddingComponents:offsetComponents
                                    toDate:hyb_fromDate
                                   options:0];
}

- (NSDate *)hyb_offsetMonths:(int)hyb_numMonths {
  return [NSDate hyb_offsetMonths:hyb_numMonths fromDate:self];
}

+ (NSDate *)hyb_offsetMonths:(int)hyb_numMonths fromDate:(NSDate *)hyb_fromDate {
  if (hyb_fromDate == nil) {
    return nil;
  }
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSGregorianCalendar];
#endif
  
  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setMonth:hyb_numMonths];
  
  return [gregorian dateByAddingComponents:offsetComponents
                                    toDate:hyb_fromDate
                                   options:0];
}

- (NSDate *)hyb_offsetDays:(int)hyb_numDays {
  return [NSDate hyb_offsetDays:hyb_numDays fromDate:self];
}

+ (NSDate *)hyb_offsetDays:(int)hyb_numDays fromDate:(NSDate *)hyb_fromDate {
  if (hyb_fromDate == nil) {
    return nil;
  }
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSGregorianCalendar];
#endif
  
  
  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setDay:hyb_numDays];
  
  return [gregorian dateByAddingComponents:offsetComponents
                                    toDate:hyb_fromDate
                                   options:0];
}

- (NSDate *)hyb_offsetHours:(int)hyb_hours {
  return [NSDate hyb_offsetHours:hyb_hours fromDate:self];
}

+ (NSDate *)hyb_offsetHours:(int)hyb_numHours fromDate:(NSDate *)hyb_fromDate {
  if (hyb_fromDate == nil) {
    return nil;
  }
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  // NSDayCalendarUnit
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
  NSCalendar *gregorian = [[NSCalendar alloc]
                           initWithCalendarIdentifier:NSGregorianCalendar];
#endif
  
  
  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setHour:hyb_numHours];
  
  return [gregorian dateByAddingComponents:offsetComponents
                                    toDate:hyb_fromDate
                                   options:0];
}

+ (NSDateComponents *)hyb_dateComponentsWithDate:(NSDate *)date {
  NSCalendar *calendar = nil;
  NSUInteger flags = 0;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
  calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
  | NSCalendarUnitMinute | NSCalendarUnitSecond;
#else
  calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit
  | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#endif
  [calendar setTimeZone:[NSTimeZone systemTimeZone]];
  
  return [calendar components:flags fromDate:date];
}

- (NSString *)hyb_toTimeStamp {
  return [NSString stringWithFormat:@"%lf", [self timeIntervalSince1970]];
}

+ (NSDate *)hyb_toDateWithTimeStamp:(NSString *)timeStamp {
  NSString *arg = timeStamp;
  
  if (![timeStamp isKindOfClass:[NSString class]]) {
    arg = [NSString stringWithFormat:@"%@", timeStamp];
  }
  
  if (arg.length > 10) {
    arg = [arg substringToIndex:10];
  }
  
  NSTimeInterval time = [arg doubleValue];
  return [NSDate dateWithTimeIntervalSince1970:time];
}

@end
