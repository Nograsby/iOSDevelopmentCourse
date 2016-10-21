//
//  Doctor.h
//  6.DataTypes
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef enum {
    student = 4,
    beginner = 5,
    middle = 6,
    master = 7 ,
    professor = 18
} DoctorLevel;

@interface Doctor : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) DoctorLevel levelOfMastery;

@end
