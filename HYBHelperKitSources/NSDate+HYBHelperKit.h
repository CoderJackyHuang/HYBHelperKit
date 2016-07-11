//
//  NSDate+HYBHelperKit.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/11.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HYBHelperKit)

//--------------------------------------------//
// Get day, month, year, hour, minute, second
//--------------------------------------------//
- (NSUInteger)hyb_day;
- (NSUInteger)hyb_month;
- (NSUInteger)hyb_year;
- (NSUInteger)hyb_hour;
- (NSUInteger)hyb_minute;
- (NSUInteger)hyb_second;
+ (NSUInteger)hyb_day:(NSDate *)hyb_date;
+ (NSUInteger)hyb_month:(NSDate *)hyb_date;
+ (NSUInteger)hyb_year:(NSDate *)hyb_date;
+ (NSUInteger)hyb_hour:(NSDate *)hyb_date;
+ (NSUInteger)hyb_minute:(NSDate *)hyb_date;
+ (NSUInteger)hyb_second:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many days in the year.
 *
 *	@return The days of the year.
 */
- (NSUInteger)hyb_daysInYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many days in the specified year.
 *
 *	@param hyb_date	The specified date
 *
 *	@return The days of the year.
 */
+ (NSUInteger)hyb_daysInYear:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether this year is leap year or not.
 *
 *	@return YES means leap year, otherwise NO.
 */
- (BOOL)hyb_isLeapYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether the specified date of year is leap year or not.
 *
 *	@param hyb_date	The specified date.
 *
 *	@return YES means leap year, otherwise NO.
 */
+ (BOOL)hyb_isLeapYear:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether this year is leap year or not.
 *
 *	@param year	The specified year
 *
 *	@return YES means leap year, otherwise NO.
 */
+ (BOOL)hyb_isLeapYearWithYear:(int)year;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get which week in the year.
 *
 *	@return Current week of year.
 */
- (NSUInteger)hyb_weekOfYear;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get which week in the specified date.
 *
 *	@param hyb_date	The specified date to get which week.
 *
 *	@return Current week of the specified year.
 */
+ (NSUInteger)hyb_weekOfYear:(NSDate *)hyb_date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Convert the date to a time string with yyyy-MM-dd format.
 *
 *	@return The time string with yyyy-MM-dd
 */
- (NSString *)hyb_toStringWithFormatYMD;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *  Convert the date to a time string with yyyy-MM-dd format.
 *
 *	@param hyb_date	The specified date to be converted to time string.
 *
 *	@return The time string with yyyy-MM-dd
 */
+ (NSString *)hyb_toStringWithFormatYMD:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many weeks in the month. It might have 4, 5, or 6 weeks.
 *
 *	@return The weeks in the month.
 */
- (NSUInteger)hyb_howManyWeeksOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get how many weeks in the month. It might have 4, 5, or 6 weeks.
 *
 *	@param hyb_date The specified date
 *
 *	@return The weeks in the month of the specified date.
 */
+ (NSUInteger)hyb_howManyWeeksOfMonth:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the first date of this month.
 *
 *	@return The first date of this month.
 */
- (NSDate *)hyb_beginDayOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the first date of this month.
 *
 *	@param hyb_date	The specified date.
 *
 *	@return The first date of this month.
 */
+ (NSDate *)hyb_beginDayOfMonth:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the last date of this month.
 *
 *	@return The last date of this month.
 */
- (NSDate *)hyb_lastDayOfMonth;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get the last date of the specified month.
 *
 *	@param hyb_date	The specified date.
 *
 *	@return The last date of this month.
 */
+ (NSDate *)hyb_lastDayOfMonth:(NSDate *)hyb_date;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add days
 *
 *	@param days	The added days.
 *
 *	@return The new date after add days.
 */
- (NSDate *)hyb_dateAfterDay:(NSUInteger)days;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add days to the specified date.
 *
 *	@param hyb_date	The spcified date.
 *	@param days			The added days.
 *
 *	@return The new date after adding days.
 */
+ (NSDate *)hyb_dateAfterDate:(NSDate *)hyb_date day:(NSInteger)days;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add months to the date.
 *
 *	@param months	The added months.
 *
 *	@return The new date after adding months.
 */
- (NSDate *)hyb_dateAfterMonth:(NSUInteger)months;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add months to the date.
 *
 *	@param hyb_date The specified date.
 *	@param months	The added months.
 *
 *	@return The new date after adding months.
 */
+ (NSDate *)hyb_dateAfterDate:(NSDate *)hyb_date month:(NSInteger)months;

/**
 * 返回numYears年后的日期
 */
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get new date offset numYears.
 *
 *	@param numYears	The
 *
 */
- (NSDate *)hyb_offsetYears:(int)numYears;
+ (NSDate *)hyb_offsetYears:(int)hyb_numYears fromDate:(NSDate *)hyb_fromDate;
- (NSDate *)hyb_offsetMonths:(int)hyb_numMonths;
+ (NSDate *)hyb_offsetMonths:(int)hyb_numMonths fromDate:(NSDate *)hyb_fromDate;
- (NSDate *)hyb_offsetDays:(int)hyb_numDays;
+ (NSDate *)hyb_offsetDays:(int)hyb_numDays fromDate:(NSDate *)hyb_fromDate;
- (NSDate *)hyb_offsetHours:(int)hyb_hours;
+ (NSDate *)hyb_offsetHours:(int)hyb_numHours fromDate:(NSDate *)hyb_fromDate;
- (NSUInteger)hyb_daysAgo;
+ (NSUInteger)hyb_daysAgo:(NSDate *)hyb_date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)hyb_weekday;
+ (NSInteger)hyb_weekday:(NSDate *)hyb_date;

/**
 *  获取星期几(名称)hyb_
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)hyb_dayFromWeekday;
+ (NSString *)hyb_dayFromWeekday:(NSDate *)hyb_date;

/**
 *  Is the same date?
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)hyb_isSameDate:(NSDate *)hyb_anotherDate;

/**
 *  Is today?
 *
 *  @return Return if self is today
 */
- (BOOL)hyb_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)hyb_dateByAddingDays:(NSUInteger)hyb_days;

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
+ (NSString *)hyb_monthWithMonthNumber:(NSInteger)hyb_month;

/**
 *  Convert date to string with format.
 */
+ (NSString *)hyb_stringWithDate:(NSDate *)hyb_date format:(NSString *)hyb_format;
- (NSString *)hyb_stringWithFormat:(NSString *)hyb_format;

/**
 * Convert date string to NSDate instance.
 */
+ (NSDate *)hyb_dateWithString:(NSString *)hyb_string format:(NSString *)hyb_format;

/**
 * Get how many days in the month.
 */
- (NSUInteger)hyb_daysInMonth:(NSUInteger)hyb_month;
+ (NSUInteger)hyb_daysInMonth:(NSDate *)hyb_date month:(NSUInteger)hyb_month;
+ (NSUInteger)hyb_dayInYear:(NSUInteger)year month:(NSUInteger)month;

/**
 * Get how many days in the month.
 */
- (NSUInteger)hyb_daysInMonth;
+ (NSUInteger)hyb_daysInMonth:(NSDate *)hyb_date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)hyb_timeInfo;
+ (NSString *)hyb_timeInfoWithDate:(NSDate *)hyb_date;
+ (NSString *)hyb_timeInfoWithDateString:(NSString *)hyb_dateString;

/**
 * yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss
 */
- (NSString *)hyb_ymdFormat;
- (NSString *)hyb_hmsFormat;
- (NSString *)hyb_ymdHmsFormat;
+ (NSString *)hyb_ymdFormat;
+ (NSString *)hyb_hmsFormat;
+ (NSString *)hyb_ymdHmsFormat;

+ (NSDateComponents *)hyb_dateComponentsWithDate:(NSDate *)date;

/**
 * Convert date to time stamp.
 */
- (NSString *)hyb_toTimeStamp;

/**
 * Convert time stamp to date.
 */
+ (NSDate *)hyb_toDateWithTimeStamp:(NSString *)timeStamp;

@end
