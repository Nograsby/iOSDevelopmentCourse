//
//  Doctor.h
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject <PatientDelegate>
@property (strong, nonatomic) NSString *name;


@end
