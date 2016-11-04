//
//  Swimmers.h
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Swimmers <NSObject>

@required

@property (assign, nonatomic) float swimSpeed;

- (void)swim;

@optional

@property (assign, nonatomic) float kindOfSwim;

- (void)fastSwim;
@end
