//
//  AVStudent.h
//  13.Threads
//
//  Created by Vladimir Ananko on 11/6/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VAResultsBlock)(NSString *, double, NSInteger);

@interface AVStudent : NSObject

@property (strong, nonatomic) NSString *name;

+ (dispatch_queue_t)sharedQueue;

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange;

- (void)guessNumber:(NSInteger)setNumber
        inRangeFrom:(NSInteger)fromRange
                 to:(NSInteger)toRange
   withResultsBlock:(VAResultsBlock)resultsBlock;

- (void)guessOneQueueNumber:(NSInteger)setNumber
                inRangeFrom:(NSInteger)fromRange
                         to:(NSInteger)toRange
           withResultsBlock:(VAResultsBlock)resultsBlock;

@end
