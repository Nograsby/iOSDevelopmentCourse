//
//  Runners.h
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Runners <NSObject>

@required

@property (assign, nonatomic) float speed;

- (void)run;

@optional

@property (assign, nonatomic) float kindOfRun;

- (void)fastRun;

@end
