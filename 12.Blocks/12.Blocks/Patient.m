//
//  Patient.m
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Patient.h"


@implementation Patient

- (instancetype)initWithBlock:(void(^)(Patient *))patientBlock
{
    self = [super init];
    if (self) {
        _temperature = (arc4random() % 40 + 366.f)/10.f;
        NSInteger delay = arc4random() % 7 + 7;
        [self performSelector:@selector(patientFeelBedWithInfo:) withObject:patientBlock afterDelay:delay];
    }
    return self;
}

- (BOOL)areYouOk {
    bool IAmOk = arc4random() % 2;
    NSLog(@"Patient %@ is %@", self.name, IAmOk ? @"good" : @"bad");
    return IAmOk;
}

- (void)patientFeelBedWithInfo: (void (^)(Patient *))parameters {
    _temperature = (arc4random() % 40 + 366.f)/10.f;
    
    __weak Patient *weakSelf = self;
    parameters (weakSelf);
}

- (void)takePill {
    NSLog(@"Patient %@. Temperature is %.2f. Take Pill", self.name, self.temperature);
}

- (void)makeShot {
    NSLog(@"Patient %@. Temperature is %.2f. Make Shot", self.name, self.temperature);
}

@end

