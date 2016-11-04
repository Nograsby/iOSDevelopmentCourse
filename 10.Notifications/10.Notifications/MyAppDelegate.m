//
//  MyAppDelegate.m
//  10.Notifications
//
//  Created by Devemac on 5/3/16.
//  Copyright © 2016 nograsby. All rights reserved.
//

#import "MyAppDelegate.h"
#import <UIKit/UIKit.h>

@implementation MyAppDelegate


#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunchingWithOptionsNotification:)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActiveNotification:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillTerminateNotification:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"MyAppDelegate is deallocated");
}


#pragma mark - NSNotification
- (void)applicationDidFinishLaunchingWithOptionsNotification:(NSNotification *)notification {
    NSLog(@"%@ did finish launching with options", self.class);
}

- (void)applicationWillResignActiveNotification:(NSNotification *)notification {
    NSLog(@"%@ will resign active", self.class);
}

- (void)applicationDidEnterBackgroundNotification:(NSNotification *)notification {
    NSLog(@"%@ did enter background", self.class);
}

- (void)applicationWillEnterForegroundNotification:(NSNotification *)notification {
    NSLog(@"%@ will enter foreground", self.class);
}

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification {
    NSLog(@"%@ did become active", self.class);
}

- (void)applicationWillTerminateNotification:(NSNotification *)notification {
    NSLog(@"%@ will terminate", self.class);
}

@end
