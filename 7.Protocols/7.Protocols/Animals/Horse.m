//
//  Horse.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Horse.h"

@implementation Horse

@synthesize speed;

- (void)movement {
    NSLog(@"I am a %@. I can ride fast.", self.class);
}

- (void)run {
    NSLog(@"%@ is Run!!!!",self.class);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class - %@, nickname - %@, ageInMonths - %ld, genderType - %d, jumpHeight - %f" ,  self.class, self.nickname, self.ageInMonths, self.genderType, self.speed];
}
@end
