//
//  Animal.h
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AnimalMale,
    AnimalFemale
} GenderAnimal;

@interface Animal : NSObject

@property (strong, nonatomic) NSString *nickname;
@property (assign, nonatomic) NSInteger ageInMonths;
@property (assign, nonatomic) GenderAnimal genderType;

- (void)movement;

@end
