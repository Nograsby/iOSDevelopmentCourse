//
//  AppDelegate.m
//  6.DataTypes
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//


#import "AppDelegate.h"
#import "Doctor.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Doctor *doctor = [[Doctor alloc]init];
    doctor.name = @"Vasilii";
    doctor.levelOfMastery = master;
    NSLog(@"doctor.name = %@, doctor.levelOfMastery = %u", doctor.name, doctor.levelOfMastery);
    [doctor setLevelOfMastery:professor];
    NSLog(@"doctor.name = %@, doctor.levelOfMastery = %d", doctor.name, doctor.levelOfMastery);
    
    
    CGRect center = CGRectMake(4, 4, 3, 3);
    NSInteger count = 0;
    CGFloat percent = 0;
    NSInteger shots = 100;
    
    for (int i = 0; i < shots; i++) {
        CGPoint point = CGPointMake((arc4random() % 10), (arc4random() % 10));
        if (CGRectContainsPoint(center, point)) {
            NSLog(@"Alarm!!! Ship is damaged in %@", [NSValue valueWithCGPoint:point]);
            count++;
        }
    }
    percent = (count * 100) / shots;
    NSLog(@"Percent of hits is %f", percent);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
