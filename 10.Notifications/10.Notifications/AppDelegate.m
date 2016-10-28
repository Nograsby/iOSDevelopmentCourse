//
//  AppDelegate.m
//  10.Notifications
//
//  Created by Devemac on 5/2/16.
//  Copyright © 2016 nograsby. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Business.h"
#import "Pensioner.h"
#import "MyAppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government *government;
@property (strong, nonatomic) Doctor *doctor;
@property (strong, nonatomic) Business *business;
@property (strong, nonatomic) Pensioner *pensioner;
@property (strong, nonatomic) MyAppDelegate *myAppDelegate;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector: @selector (taxLevelDidChange:)
                                                 name:GovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    self.government = [[Government alloc] init];
    self.doctor = [[Doctor alloc] init];
    self.business = [[Business alloc]init];
    self.pensioner = [[Pensioner alloc]init];
    
    self.government.taxLevel = 5.9;
    self.government.salary = 1100;
    self.government.pension = 600;
    self.government.averagePrice = 15;
    
    self.government.taxLevel = 6.0;
    self.government.salary = 1200;
    self.government.pension = 550;
    self.government.averagePrice = 18;
    
    self.myAppDelegate = [[MyAppDelegate alloc]init];

    
    NSLog(@"%@ did finish launching with options", self.class);
    
    return YES;
}

- (void)taxLevelDidChange: (NSNotification *)notification {
    NSLog(@"Now tax level is %f",[[notification.userInfo objectForKey:@"GovernmentTaxLevelUserInfoKey"]floatValue]);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"%@ will resign active", self.class);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%@ did enter background", self.class);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"%@ will enter foreground", self.class);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%@ did become active", self.class);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"%@ will terminate", self.class);
}

@end
