//
//  Doctor.m
//  10.Notifications
//
//  Created by Devemac on 5/2/16.
//  Copyright © 2016 nograsby. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"
#import <UIKit/UIKit.h>

@implementation Doctor


#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        _salary = 1000.f;
        _averagePrice = 10.f;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryDidChangeNotification:)
                                                     name:GovernmentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceDidChangeNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActiveNotification:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
    }
    return self;
}

- (void) dealloc {
    NSLog(@"%@ is deallocated", self.class);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - NSNotification
- (void)salaryDidChangeNotification: (NSNotification *)notification {
    NSNumber *value =[notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    float newSalary = [value floatValue];
    if (self.salary >= newSalary) {
        NSLog(@"Doctors are not happy. Salary was degreased from %f to %f", self.salary, newSalary);
    } else {
        NSLog(@"Doctors are happy. Salary was increased from %f to %f", self.salary, newSalary);
    }
    self.salary = newSalary;
}

- (void)averagePriceDidChangeNotification: (NSNotification *)notification {
    NSNumber *value =[notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    float newAveragePrice = [value floatValue];
    NSLog(@"%@: Average Price did change",self.class);
    float inflation = (newAveragePrice - self.averagePrice) / self.averagePrice * 100;
    if (inflation > 0) {
        NSLog(@"%@: government is bad!!! Inflation is %f percents", self.class, inflation);
    }
    self.averagePrice = newAveragePrice;
}

- (void)applicationWillResignActiveNotification: (NSNotification *)notification {
    NSLog(@"%@: aplication did enter background. I will go sleep", self.class);
}

- (void)applicationWillEnterForegroundNotification: (NSNotification *)notification {
    NSLog(@"%@: aplication will enter foreground. I will go work", self.class);
}
@end
