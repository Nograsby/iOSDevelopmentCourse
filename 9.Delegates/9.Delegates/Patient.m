//
//  Patient.m
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (void)howAreYou {
    NSLog(@"I am %@", self.temperature < 40 ? @"bad" : @"good");
    
}

- (void)iFeelBad {
    [self.delegate iFeelBad:self];
    self.glading = arc4random() % 2;
}

- (NSString *)healthStatusFrom:(healthStatus) healthStatus {
    NSString *result = nil;
    switch (healthStatus) {
        case 0:
            result = @"good";
            break;
        case 1:
            result = @"bad";
            break;
        case 2:
            result = @"ok";
            break;
            
        default:
            break;
    }
    return result;
}

- (void)takePill {
    NSLog(@"Patient %@ take Pill", self.name);
}

- (void)makeShot {
    NSLog(@"Patient %@ make Shot", self.name);
}

@end

