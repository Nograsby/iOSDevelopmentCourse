//
//  VABestStudent.m
//  13.Threads
//
//  Created by Vladimir Ananko on 11/22/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "VABestStudent.h"

@implementation VABestStudent

+ (NSOperationQueue *)sharedOperationQueue {
    static NSOperationQueue *bestStudentQueue = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        bestStudentQueue = [[NSOperationQueue alloc] init];
    });
    return bestStudentQueue;
}

- (void)guessNumber:(NSInteger)setNumber inRangeFrom:(NSInteger)fromRange to:(NSInteger)toRange {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperationWithBlock:^{
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
    }];
}

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange
   withResultsBlock:(VAResultsBlock)resultsBlock {
    
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperationWithBlock:^{
        NSInteger attemptsQuantity = 0;
        NSInteger generatedNumber = 0;
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        
        while (generatedNumber != setNumber) {
            attemptsQuantity++;
            generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSDate *finishDate = [NSDate date];
            NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
            
            __weak VABestStudent *weakSelf = self;
            resultsBlock (weakSelf.name, (finishInterval - startInterval), attemptsQuantity);
        }];
    }];
}

- (void)guessOneQueueNumber:(NSInteger)setNumber
                inRangeFrom:(NSInteger)fromRange
                         to:(NSInteger)toRange
           withResultsBlock:(VAResultsBlock)resultsBlock {
    if (toRange <= fromRange) {
        NSLog(@"Please check range");
        return;
    }
    NSOperationQueue *operationQueue = [VABestStudent sharedOperationQueue];
    [operationQueue addOperationWithBlock:^{
        NSInteger attemptsQuantity = 0;
        NSInteger generatedNumber = 0;
        
        NSDate *startDate = [NSDate date];
        NSTimeInterval startInterval = startDate.timeIntervalSinceReferenceDate;
        
        while (generatedNumber != setNumber) {
            attemptsQuantity++;
            generatedNumber = (arc4random() % (toRange - fromRange)) + fromRange;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSDate *finishDate = [NSDate date];
            NSTimeInterval finishInterval = finishDate.timeIntervalSinceReferenceDate;
            
            __weak VABestStudent *weakSelf = self;
            resultsBlock (weakSelf.name, (finishInterval - startInterval), attemptsQuantity);
        }];
    }];
}

@end
