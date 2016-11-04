//
//  Runner.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Runner.h"

@implementation Runner

@synthesize speed;

- (void)movement {
    NSLog(@"I am a %@. I can run.", self.class);
}

- (void)run {
    NSLog(@"%@ is Run!!!!",self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, name - %@, age - %ld, weight - %ld, genderType - %d, jumpHeight - %f",  self.class, self.name, self.age, self.weight, self.genderType, self.speed];
}
@end
