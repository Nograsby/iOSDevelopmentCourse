//
//  Human.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import "Human.h"


@implementation Human

- (void)movement {
    NSLog(@"I am a %@. I can walk.", self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, name - %@, age - %ld, weight - %ld, genderType - %d", self.class, self.name, self.age, self.weight, self.genderType];
}
@end
