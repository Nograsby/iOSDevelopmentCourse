//
//  Jumper.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Jumper.h"


@implementation Jumper

@synthesize jumpHeight;

- (void)movement {
    NSLog(@"I am a %@. I can jump.", self.class);
}

- (void)jumping {
    NSLog(@"Jumping!!!!");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, name - %@, age - %ld, weight - %ld, genderType - %d, jumpHeight - %f",  self.class, self.name, self.age, self.weight, self.genderType, self.jumpHeight];
}
@end
