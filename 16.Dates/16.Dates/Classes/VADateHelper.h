//
//  VADateHelper.h
//  16.Dates
//
//  Created by Vladimir Ananko on 11/27/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VADateHelper : NSObject

+ (NSDate *)getDateFromAge:(NSInteger)age;
+ (NSDate *)getRandomDateFrom:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (NSString *)stringFromDate:(NSDate *)date withDateFormat:(NSString *)dateFormat;
+ (NSDate *)dateFromDate:(NSDate *)date filteredWithComponents:(NSCalendarUnit)components;

@end
