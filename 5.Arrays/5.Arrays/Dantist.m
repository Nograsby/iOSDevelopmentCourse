//
//  Dantist.m
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Dantist.h"

@implementation Dantist

- (void)movement {
    [super movement];
    NSLog(@"I am %@. I am dantist. I work, not run!", self.name);
}

- (NSString *)description {
    return [NSString stringWithFormat: @"My name is %@. Height is %f. Weight is %f. I am is %@. My experience %f years. My car is %@", self.name, self.height, self.weight, self.gender, self.experience, self.car];
}
@end
