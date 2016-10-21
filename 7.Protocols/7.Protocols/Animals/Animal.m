//
//  Animal.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)movement {
    NSLog(@"I am a %@. I can go.", self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, nickname - %@, ageInMonths - %ld, genderType - %d",  self.class, self.nickname, self.ageInMonths, self.genderType];
}
@end
