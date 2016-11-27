//
//  VAStudent.m
//  16.Dates
//
//  Created by Vladimir Ananko on 11/27/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "VAStudent.h"

#import "VADateHelper.h"

static NSInteger const VAStudentAgeMin = 16;
static NSInteger const VAStudentAgeMax = 50;

#define lastNamesArray @[@"Ivanov", @"Petrov", @"Sidorov",  @"Markov",  @"Alexandrov", @"Kovalev", @"Gorbachev", @"Parfenov", @"Abramov"]

#define firstNamesArray @[@"Ivan", @"Petr", @"Sidor",  @"Mark",  @"Alexandr", @"Gleb", @"Vladimir", @"Artem", @"Abram"]

@implementation VAStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDate *maxDate = [VADateHelper getDateFromAge:VAStudentAgeMin];
        NSDate *minDate = [VADateHelper getDateFromAge:VAStudentAgeMax];
        
        _dateOfBirth = [VADateHelper getRandomDateFrom:minDate toDate:maxDate];
        _firstName = firstNamesArray[arc4random_uniform(firstNamesArray.count)];
        _lastName = lastNamesArray[arc4random_uniform(lastNamesArray.count)];
    }
    return self;
}

- (NSString *)description {
    NSString *birthDate = [VADateHelper stringFromDate:self.dateOfBirth withDateFormat:@"dd MMMM YYYY"];
    return [NSString stringWithFormat:@"I am %@ %@. My number is %@. I was born %@.", self.firstName, self.lastName, self.number, birthDate];
}

@end
