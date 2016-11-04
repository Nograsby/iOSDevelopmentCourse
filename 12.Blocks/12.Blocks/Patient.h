//
//  Patient.h
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) float temperature;


- (BOOL)areYouOk;

- (void)takePill;
- (void)makeShot;

- (instancetype)initWithBlock:(void(^)(Patient *))patientBlock;

- (void)patientFeelBedWithInfo: (void (^)(Patient *))parameters;

@end


