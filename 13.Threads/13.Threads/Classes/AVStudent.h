//
//  AVStudent.h
//  13.Threads
//
//  Created by Vladimir Ananko on 11/6/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AVResultsBlock)(void);

@interface AVStudent : NSObject

@property (strong, nonatomic) NSString *name;

+ (dispatch_queue_t)sharedQueue;

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange;

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange
   withResultsBlock:(AVResultsBlock)resultsBlock;

- (void)guessOneQueueNumber:(NSInteger)setNumber1
                inRangeFrom:(NSInteger)fromRange
                         to:(NSInteger)toRange
           withResultsBlock:(AVResultsBlock)resultsBlock;

@end
