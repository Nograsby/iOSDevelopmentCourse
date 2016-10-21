//
//  Animal.m
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import "Animal.h"


@implementation Animal

- (void)movement {
    NSLog(@"It is animal. It name is %@. It is jumping", self.nickname);
}

- (NSString *)description {
    return [NSString stringWithFormat: @"My nickname is %@. Age is %f. Color is %@.", self.nickname, self.age, self.color];
}
@end
