//
//  Kangaroo.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Kangaroo.h"

@implementation Kangaroo

@synthesize jumpHeight;

- (void)movement {
    NSLog(@"I am a %@. I can jump.", self.class);
}

- (void)jumping {
    NSLog(@"%@ is Jumping!!!", self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, nickname - %@, ageInMonths - %ld, genderType - %d, jumpHeight - %f" ,  self.class, self.nickname, self.ageInMonths, self.genderType, self.jumpHeight];
}
@end
