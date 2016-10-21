//
//  AppDelegate.m
//  7.Protocols
//
//  Created by Nograsby on 4/10/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Jumper.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Animal.h"
#import "Kangaroo.h"
#import "Horse.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human *human = [[Human alloc]init];
    human.name = @"Boris";
    human.age = 18;
    human.weight = 80.f;
    human.genderType = Male;
    
    Jumper *jumper = [[Jumper alloc]init];
    jumper.name = @"Kolya";
    jumper.age = 37;
    jumper.weight = 90.f;
    jumper.genderType = Male;
    jumper.jumpHeight = 2.1f;
    
    Runner *runner = [[Runner alloc]init];
    runner.name = @"Nadya";
    runner.age = 23;
    runner.weight = 60.f;
    runner.genderType = Female;
    runner.speed = 25.f;
    
    Swimmer *swimmer = [[Swimmer alloc]init];
    swimmer.name = @"Vasilii";
    swimmer.age = 40;
    swimmer.weight = 85.f;
    swimmer.genderType = Male;
    swimmer.swimSpeed = 20.f;
    
    NSArray *humans = [NSArray arrayWithObjects:human, jumper, runner, swimmer, nil];
    
    Animal *animal = [[Animal alloc]init];
    animal.nickname = @"Frosya";
    animal.ageInMonths = 18;
    animal.genderType = AnimalMale;

    Kangaroo *kangaroo = [[Kangaroo alloc]init];
    kangaroo.nickname = @"Prygun";
    kangaroo.ageInMonths = 25;
    kangaroo.genderType = AnimalMale;
    kangaroo.jumpHeight = 3.f;

    Horse *horse = [[Horse alloc]init];
    horse.nickname = @"Igogo";
    horse.ageInMonths = 70;
    horse.genderType = AnimalFemale;
    horse.speed = 35.f;
    
    NSArray *animals = [NSArray arrayWithObjects:animal, kangaroo, horse, nil];
    NSMutableArray *all = [NSMutableArray arrayWithArray:humans];
    [all addObjectsFromArray:animals];
    
    for (id object in all) {
        if ([object conformsToProtocol:@protocol(Jumpers)]) {
            [object jumping];
        }
        if ([object conformsToProtocol:@protocol(Runners)]) {
            [object run];
        }
        if ([object conformsToProtocol:@protocol(Swimmers)]) {
            [object swim];
        }
        NSLog(@"%@", object);
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
