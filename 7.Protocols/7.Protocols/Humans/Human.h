//
//  Human.h
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Male,
    Female
} Gender;

@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger weight;
@property (assign, nonatomic) Gender genderType;

- (void)movement;

@end
