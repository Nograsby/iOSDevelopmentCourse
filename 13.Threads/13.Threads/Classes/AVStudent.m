//
//  AVStudent.m
//  13.Threads
//
//  Created by Vladimir Ananko on 11/6/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "AVStudent.h"

@implementation AVStudent

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t studentQueue = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        studentQueue = dispatch_queue_create("com.threadsTest", DISPATCH_QUEUE_CONCURRENT);
    });
    return studentQueue;
}

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    dispatch_queue_t queue = dispatch_queue_create("studentQueue",  DISPATCH_QUEUE_PRIORITY_DEFAULT);
    dispatch_async(queue, ^{
        NSInteger attemptsQuantity = 0;
        NSInteger generatedNumber = 0;
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        
        while (generatedNumber != setNumber) {
            attemptsQuantity++;
            generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
        }
        
        NSDate *finishDate = [NSDate date];
        NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
        
        NSLog(@"I am %@. I have finished in %f. I try %ld times.", self.name, (finishInterval - startInterval), (long)attemptsQuantity);
    });
}

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange
   withResultsBlock:(VAResultsBlock)resultsBlock {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    
    dispatch_queue_t queue = dispatch_queue_create("studentQueue",  DISPATCH_QUEUE_PRIORITY_DEFAULT);
    
    dispatch_async(queue, ^{
        NSInteger attemptsQuantity = 0;
        NSInteger generatedNumber = 0;
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        
        while (generatedNumber != setNumber) {
            attemptsQuantity++;
            generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
        }
        NSDate *finishDate = [NSDate date];
        NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak AVStudent *weakSelf = self;
            resultsBlock (weakSelf.name, (finishInterval - startInterval), attemptsQuantity);
        });
    });
}

- (void)guessOneQueueNumber:(NSInteger)setNumber
                inRangeFrom:(NSInteger)fromRange
                         to:(NSInteger)toRange
           withResultsBlock:(VAResultsBlock)resultsBlock {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    
    dispatch_queue_t queue = [AVStudent sharedQueue];
    
    dispatch_async(queue, ^{
        NSInteger attemptsQuantity = 0;
        NSInteger generatedNumber = 0;
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        
        while (generatedNumber != setNumber) {
            attemptsQuantity++;
            generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
        }
        NSDate *finishDate = [NSDate date];
        NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak AVStudent *weakSelf = self;
            resultsBlock (weakSelf.name, (finishInterval - startInterval), attemptsQuantity);
        });
    });}

@end
