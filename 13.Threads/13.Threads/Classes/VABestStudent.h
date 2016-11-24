//
//  VABestStudent.h
//  13.Threads
//
//  Created by Vladimir Ananko on 11/22/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VAResultsBlock)(NSString *, double, NSInteger);

@interface VABestStudent : NSObject

@property (strong, nonatomic) NSString *name;

+ (NSOperationQueue *)sharedOperationQueue;

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
