//
//  Human.m
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void)movement {
    NSLog(@"I am %@. I walk", self.name);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"My name is %@. Height is %f. Weight is %f. I am is %@", self.name, self.height, self.weight, self.gender];
}
@end
