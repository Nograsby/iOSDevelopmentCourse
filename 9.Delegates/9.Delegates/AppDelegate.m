//
//  AppDelegate.m
//  9.Delegates
//
//  Created by Nograsby on 4/23/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "Friend.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Patient *patient1 = [[Patient alloc]init];
    patient1.name = @"Vasiliy";
    patient1.temperature = 40.f;
    patient1.health = bad;
    
    Patient *patient2 = [[Patient alloc]init];
    patient2.name = @"Petr";
    patient2.temperature = 36.6;
    patient2.health = good;

    Patient *patient3 = [[Patient alloc]init];
    patient3.name = @"Dmitrii";
    patient3.temperature = 38;
    patient3.health = ok;
   
    Doctor *doctor1 = [[Doctor alloc]init];
    doctor1.name = @"Semen Semenovich";

    Friend *badDoctor1 = [[Friend alloc]init];
    badDoctor1.name = @"Friend Makar";

    Friend *badDoctor2 = [[Friend alloc]init];
    badDoctor2.name = @"Friend Semen";

    NSArray *patients = [NSArray arrayWithObjects:patient1, patient2, patient3, nil];
    NSArray *doctors = [NSArray arrayWithObjects:doctor1, badDoctor1, badDoctor2, nil];
    
    for (Patient *patient in patients) {
        if (arc4random() % 2) {
            patient.delegate = doctor1;
        } else {
            patient.delegate = badDoctor1;
        }
        [patient iFeelBad];
    }
    
    for (Patient *patient in patients) {
        NSLog(@"%@ is glading? %@",patient.name, patient.glading ? @"YES" : @"No" );

        if (!patient.glading) {
            id <PatientDelegate> previousDoctor = patient.delegate;
            while ([previousDoctor isEqual: patient.delegate]) {
                patient.delegate = [doctors objectAtIndex:arc4random() % doctors.count];
            }
            
        }
        [patient iFeelBad];
    }

    
    
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
