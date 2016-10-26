//
//  Patient.h
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PatientDelegate;

typedef  enum {
    good,
    bad,
    ok
} healthStatus;



@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) healthStatus health;
@property (weak, nonatomic) id <PatientDelegate> delegate;
@property (assign,nonatomic) BOOL glading;

- (void)howAreYou;
- (void)iFeelBad;
- (NSString *)healthStatusFrom: (healthStatus)healthStatus;

- (void)takePill;
- (void)makeShot;
@end


@protocol PatientDelegate <NSObject>

-(void)iFeelBad: (Patient *)patient;

@end