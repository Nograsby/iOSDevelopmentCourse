//
//  Student.m
//  15.BitwiseOperations
//
//  Created by Vladimir Ananko on 11/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self) {
        self.subject = arc4random() % 64;
       // self.subject = StudentLearningAnatomy | StudentLearningBiology;
    }
    return self;
}

- (NSString *)answerForSubject:(StudentLearning)studentLearning {
    return (studentLearning & self.subject) ? @"Yes" : @"No";
}

- (NSString *)description {
    return [NSString stringWithFormat:@"I am %@.\n"
                "I am learningBiology: %@.\n"
                "I am learningGeography: %@.\n"
                "I am learningMathematics: %@.\n"
                "I am learningPrograming: %@.\n"
                "I am learningPhysics: %@.\n"
                "I am learningAnatomy: %@.",
                self.name,
                [self answerForSubject:StudentLearningBiology],
                [self answerForSubject:StudentLearningGeography],
                [self answerForSubject:StudentLearningMathematics],
                [self answerForSubject:StudentLearningProgramming],
                [self answerForSubject:StudentLearningPhysics],
                [self answerForSubject:StudentLearningAnatomy]];
}

@end
