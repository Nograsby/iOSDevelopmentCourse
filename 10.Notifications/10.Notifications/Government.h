//
//  Government.h
//  10.Notifications
//
//  Created by Devemac on 5/2/16.
//  Copyright © 2016 nograsby. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const GovernmentTaxLevelDidChangeNotification;
extern NSString *const GovernmentSalaryDidChangeNotification;
extern NSString *const GovernmentPensionDidChangeNotification;
extern NSString *const GovernmentAveragePriceDidChangeNotification;

extern NSString *const GovernmentTaxLevelUserInfoKey;
extern NSString *const GovernmentSalaryUserInfoKey;
extern NSString *const GovernmentPensionUserInfoKey;
extern NSString *const GovernmentAveragePriceUserInfoKey;


@interface Government : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;

@end
