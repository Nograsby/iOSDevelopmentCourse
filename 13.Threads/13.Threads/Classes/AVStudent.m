//
//  AVStudent.m
//  13.Threads
//
//  Created by Vladimir Ananko on 11/6/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "AVStudent.h"

@implementation AVStudent

- (void)guessNumber:(NSInteger)setNumber inRangeFrom:(NSInteger)fromRange to:(NSInteger)toRange {
    BOOL setNumberFinded = NO;
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    else {
        NSDate *nowDate = [NSDate date];
        NSTimeInterval startInterval = nowDate.timeIntervalSinceReferenceDate;
        NSLog(@"startInterval - %d", startInterval, );
        while (setNumberFinded) {
            NSInteger generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
            NSLog(@"%d", generatedNumber);
            if (generatedNumber == setNumber) {
                NSLog(@"I am - %@. I have finded number in %f seconds!", [self.class )
                setNumberFinded = YES;
            }
        }
    }
}

@end
