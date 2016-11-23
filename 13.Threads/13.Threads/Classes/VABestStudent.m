//
//  VABestStudent.m
//  13.Threads
//
//  Created by Vladimir Ananko on 11/22/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "VABestStudent.h"

@implementation VABestStudent

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t studentQueue = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        studentQueue = dispatch_queue_create("com.threadsTest", DISPATCH_QUEUE_CONCURRENT);
    });
    return studentQueue;
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
                          self.name, (finishInterval - startInterval), attemptsQuantity);
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
            NSLog(@"Result from block. I am - %@. I have finded number in %f seconds! I try %d times.",
                  self.name, (finishInterval - startInterval), attemptsQuantity);
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

- (void)guessOneQueueNumber:(NSInteger)setNumber
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
            NSLog(@"Result from block. I am - %@. I have finded number in %f seconds! I try %d times.",
                  self.name, (finishInterval - startInterval), attemptsQuantity);
        };
        dispatch_queue_t queue = [VABestStudent sharedQueue];
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
