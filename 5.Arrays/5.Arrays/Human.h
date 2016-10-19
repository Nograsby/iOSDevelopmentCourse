//
//  Human.h
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import <Foundation/Foundation.h>

/*typedef enum {
    male,
    female
}gender;*/


@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) float weight;
@property (strong, nonatomic) NSString *gender;

- (void)movement;

@end
