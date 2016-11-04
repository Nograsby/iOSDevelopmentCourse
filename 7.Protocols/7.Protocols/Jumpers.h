//
//  Jumpers.h
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Jumpers <NSObject>

@required

@property (assign, nonatomic) float jumpHeight;

- (void)jumping;

@optional

@property (assign, nonatomic) float jumpFrequency;

- (void)fastJumping;

@end
