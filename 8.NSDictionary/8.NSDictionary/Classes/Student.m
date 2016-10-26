//
//  Student.m
//  8.NSDictionary
//
//  Created by Vladimir Ananko on 10/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "Student.h"

@implementation Student
    
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                         greeting:(NSString *)greeting {
    
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _greeting = greeting;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ -- '%@'", self.firstName, self.lastName, self.greeting];
}

@end
