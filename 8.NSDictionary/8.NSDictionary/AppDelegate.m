//
//  AppDelegate.m
//  8.NSDictionary
//
//  Created by Vladimir Ananko on 10/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Beginner Level
    NSMutableDictionary *students = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < 15; i++) {
        NSString *firstName = [[[self generateRandomStringFromLenght:4 toLenght:6] localizedLowercaseString] capitalizedString];
        NSString *lastName = [[[self generateRandomStringFromLenght:8 toLenght:13] localizedLowercaseString] capitalizedString];
        NSString *greeting = [[[self generateRandomStringFromLenght:35 toLenght:40] localizedLowercaseString] capitalizedString];
        Student *student = [[Student alloc] initWithFirstName:firstName
                                                     lastName:lastName
                                                     greeting:greeting];
        NSString *fullName = [NSString stringWithFormat:@"%@ %@", student.lastName, student.firstName];
        [students setObject:student forKey:fullName];
    }
    NSLog(@"---   Beginner   ---");
    NSLog(@"%@", students);
    
    // Student Level
    NSLog(@"\n\n---   Student   ---\n");
    for (NSString *studentKey in students.allKeys) {
        Student *student = students[studentKey];
        NSLog(@"%@", student);
    }
    
    // Master Level
    NSLog(@"\n\n---   Master   ---\n");
    NSArray *sortedKeys = [students.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *key1, NSString *key2) {
        return [key1 compare:key2];
    }];
    for (NSString *studentKey in sortedKeys) {
        Student *student = students[studentKey];
        NSLog(@"%@", student);
    }
    return YES;
}

- (NSString *)generateRandomStringFromLenght:(NSInteger)fromLenght toLenght:(NSInteger)toLenght {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSInteger stringLenght = 0;
    if (toLenght >= fromLenght) {
        stringLenght = arc4random_uniform(toLenght - fromLenght) + fromLenght;
    } else {
        return @"";
    }
    NSMutableString *randomString = [NSMutableString stringWithCapacity:stringLenght];
    
    for (NSInteger i = 0; i < stringLenght; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
