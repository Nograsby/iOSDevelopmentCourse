//
//  Friend.m
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Friend.h"

@implementation Friend 


#pragma mark - PatientDelegate

-(void)iFeelBad: (Patient *)patient {
    NSLog(@"My name is %@, patient's name is %@, he is %@", self.name, patient.name, [patient healthStatusFrom:patient.health]);
    if (patient.temperature >= 38.f) {
        NSLog(@"%@ don't worry be happy", patient.name);
        if (patient.temperature >=40.f) {
            NSLog(@"%@ drink wine", patient.name);
        }
    }
    else {
        NSLog(@"Patient is ok. I am best doctor!!!!");
    }
 
}



@end
