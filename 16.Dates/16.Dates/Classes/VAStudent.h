//
//  VAStudent.h
//  16.Dates
//
//  Created by Vladimir Ananko on 11/27/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAStudent : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

@property (strong, nonatomic) NSDate *dateOfBirth;

@end
