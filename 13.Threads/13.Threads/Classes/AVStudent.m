//
//  AVStudent.m
//  13.Threads
//
//  Created by Vladimir Ananko on 11/6/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "AVStudent.h"

@implementation AVStudent

+ (instancetype)sharedInstance {
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@""];
   dispatch_once(dispatch_once_t predicate, ^{
       <#code#>
   });
}

- (void)guessNumber:(NSInteger)setNumber inRangeFrom:(NSInteger)fromRange to:(NSInteger)toRange {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    else {
        __block BOOL setNumberFinded = NO;
        __block NSInteger attemptsQuantity = 0;
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        dispatch_queue_t queue = dispatch_queue_create("studentQueue",  DISPATCH_QUEUE_PRIORITY_DEFAULT);
        dispatch_async(queue, ^{
            while (!setNumberFinded) {
                attemptsQuantity++;
                NSInteger generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
                if (generatedNumber == setNumber) {
                    NSDate *finishDate = [NSDate date];
                    NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
                    NSLog(@"I am - %@. I have finded number in %f seconds! I try %d times.",
                        [self class], (finishInterval - startInterval), attemptsQuantity);
                    setNumberFinded = YES;
                }
            }
        });
    }
}

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange
   withResultsBlock:(AVResultsBlock)resultsBlock {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    else {
        __block BOOL setNumberFinded = NO;
        __block NSInteger attemptsQuantity = 0;
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        __block NSTimeInterval finishInterval;
        resultsBlock = ^ {
            NSLog(@"I am - %@. I have finded number in %f seconds! I try %d times.",
                  [self class], (finishInterval - startInterval), attemptsQuantity);
        };
        dispatch_queue_t queue = dispatch_queue_create("studentQueue",  DISPATCH_QUEUE_PRIORITY_DEFAULT);
        dispatch_async(queue, ^{
            while (!setNumberFinded) {
                attemptsQuantity++;
                NSInteger generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
                if (generatedNumber == setNumber) {
                    NSDate *finishDate = [NSDate date];
                    finishInterval = finishDate.timeIntervalSinceReferenceDate;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        resultsBlock ();
                    });
                    setNumberFinded = YES;
                }
            }
        });
    }
}

@end
