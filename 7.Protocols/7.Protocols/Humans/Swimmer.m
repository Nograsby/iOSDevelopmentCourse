//
//  Swimmer.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Swimmer.h"

@implementation Swimmer

@synthesize swimSpeed;

- (void)movement {
    NSLog(@"I am a %@. I can swim.", self.class);
}

- (void)swim {
    NSLog(@"%@ is Swim!!!!",self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, name - %@, age - %ld, weight - %ld, genderType - %d, jumpHeight - %f",  self.class, self.name, self.age, self.weight, self.genderType, self.swimSpeed];
}
@end
