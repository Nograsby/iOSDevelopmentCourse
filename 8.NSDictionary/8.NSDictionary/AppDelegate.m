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
    // Student
    for (NSInteger i = 0; i < 10; i++) {
    
  /*      Student *student = [Student alloc] initWithFirstName:<#(NSString *)#>
        lastName:<#(NSString *)#>
        greeting:<#(NSString *)#>*/
    }
    NSString *firstName = [self randomizeString:@"test"];
    
    NSLog(@"%@", firstName);
    
    return YES;
}

- (NSString *)randomizeString:(NSString *)str {
    
    NSMutableString *input = [str mutableCopy];
    NSMutableString *output = [NSMutableString string];
    
    NSUInteger len = input.length;
    
    for (NSUInteger i = 0; i < len; i++) {
        NSInteger index = arc4random_uniform((unsigned int)input.length);
        [output appendFormat:@"%C", [input characterAtIndex:index]];
        [input replaceCharactersInRange:NSMakeRange(index, 1) withString:@""];
    }
    
    return output;
}

+(NSString *) generateRandomString
    {
        NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int len = 8;
        NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
        
        for (int i=0; i<len; i++) {
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
