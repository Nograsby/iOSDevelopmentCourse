//
//  VADateHelper.m
//  16.Dates
//
//  Created by Vladimir Ananko on 11/27/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "VADateHelper.h"

@implementation VADateHelper

+ (NSDate *)getDateFromAge:(NSInteger)age {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *nowDate = [NSDate date];
    NSDateComponents *ageComponents = [[NSDateComponents alloc] init];
    ageComponents.year = -age;
    NSDate *birthDate = [gregorianCalendar dateByAddingComponents:ageComponents toDate:nowDate options:0];
    return birthDate;
}

+ (NSDate *)getRandomDateFrom:(NSDate *)fromDate toDate:(NSDate *)toDate {
    
    NSTimeInterval timeBetweenDates = [toDate timeIntervalSinceDate:fromDate];
    NSTimeInterval randomInterval = ((NSTimeInterval)arc4random_uniform(INT32_MAX) / INT32_MAX) * timeBetweenDates;
    
    NSDate *randomDate = [fromDate dateByAddingTimeInterval:randomInterval];
    
    return randomDate;
}

+ (NSString *)stringFromDate:(NSDate *)date withDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSDate *)dateFromDate:(NSDate *)date filteredWithComponents:(NSCalendarUnit)components {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:components fromDate:date];
    NSDate *filteredDate = [calendar dateFromComponents:dateComponents];
    return filteredDate;
}

@end
