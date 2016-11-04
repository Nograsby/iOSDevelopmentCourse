//
//  Business.m
//  10.Notifications
//
//  Created by Devemac on 5/2/16.
//  Copyright © 2016 nograsby. All rights reserved.
//

#import "Business.h"
#import "Government.h"

@implementation Business


#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _averagePrice = 10.f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector (taxLevelDidChangeNotification)
                                                     name: GovernmentTaxLevelDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceDidChangeNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


#pragma mark - NSNotification
- (void)taxLevelDidChangeNotification {
    NSLog(@"Businessmen: Tax Level did change");
}

- (void)averagePriceDidChangeNotification: (NSNotification *)notification {
    NSLog(@"%@: Average Price did change",self.class);
    self.averagePrice = [[notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey] floatValue];

}
@end
