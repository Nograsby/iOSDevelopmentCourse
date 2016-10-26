//
//  Student.h
//  8.NSDictionary
//
//  Created by Vladimir Ananko on 10/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *greeting;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                         greeting:(NSString *)greeting;
    
@end
