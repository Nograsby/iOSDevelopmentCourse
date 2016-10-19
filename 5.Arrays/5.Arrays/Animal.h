//
//  Animal.h
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef enum {
    male,
    female
} gender;


@interface Animal : NSObject

@property (strong, nonatomic) NSString *nickname;
@property (assign, nonatomic) float age;
@property (strong, nonatomic) NSString *color;
@property (assign ,nonatomic) gender gendertype;

- (void) movement;

@end
