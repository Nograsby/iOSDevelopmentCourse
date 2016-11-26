//
//  Student.h
//  15.BitwiseOperations
//
//  Created by Vladimir Ananko on 11/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, StudentLearning) {
    StudentLearningBiology =                1 << 0,
    StudentLearningGeography =              1 << 1,
    StudentLearningMathematics =            1 << 2,
    StudentLearningProgramming =            1 << 3,
    StudentLearningPhysics =                1 << 4,
    StudentLearningAnatomy =                1 << 5
};

@interface Student : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) StudentLearning subject;

@end
