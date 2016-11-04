//
//  Doctor.m
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (void)iFeelBad:(Patient *)patient {
    NSLog(@"My name is %@, patient's name is %@, he is %@", self.name, patient.name, [patient healthStatusFrom:patient.health]);
    if (patient.temperature >= 38.f) {
        [patient takePill];
        if (patient.temperature >=40.f) {
            [patient makeShot];
        }
    }
    else {
        NSLog(@"Patient is ok. He is simulate ill");
    }
}

@end
