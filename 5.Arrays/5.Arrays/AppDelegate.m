//
//  AppDelegate.m
//  5.Arrays
//
//  Created by Nograsby on 4/9/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Dantist.h"
#import "Animal.h"
#import "Cat.h"
#import "Dog.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human *human = [[Human alloc]init];
    human.name = @"Boris";
    human.height = 180.f;
    human.weight = 80.f;
    human.gender = @"male";
    
    Cyclist *cyclist = [[Cyclist alloc]init];
    cyclist.name = @"Anton";
    cyclist.height = 170.f;
    cyclist.weight = 70.f;
    cyclist.gender = @"male";
    
    Runner *runner = [[Runner alloc]init];
    runner.name = @"Nadya";
    runner.height = 160.f;
    runner.weight = 60.f;
    runner.gender = @"female";
    
    Swimmer *swimmer = [[Swimmer alloc]init];
    swimmer.name = @"Kolya";
    swimmer.height = 190.f;
    swimmer.weight = 90.f;
    swimmer.gender = @"male";
    
    Dantist *dantist = [[Dantist alloc]init];
    dantist.name = @"Anatolii";
    dantist.height = 185.f;
    dantist.weight = 95.f;
    dantist.gender = @"male";
    dantist.experience = 11.f;
    dantist.car = @"Volvo";
    
    
    NSArray *humans = [NSArray arrayWithObjects:human, cyclist, runner, swimmer, dantist, nil];
    
    Animal *animal = [[Animal alloc]init];
    animal.nickname = @"Horse";
    animal.age = 10.f;
    animal.color = @"black";
    
    Cat *cat = [[Cat alloc]init];
    cat.nickname = @"Murmur";
    cat.age = 5.f;
    cat.color = @"white";

    Dog *dog = [[Dog alloc]init];
    dog.nickname = @"Gavgav";
    dog.age = 2.f;
    dog.color = @"grey";
    [dog setGendertype:male];
    
    NSArray *animals = [NSArray arrayWithObjects:animal, cat, dog,  nil];
    
    NSMutableArray *all = [NSMutableArray arrayWithArray:humans];
    [all addObjectsFromArray:animals];
    

    // Cycle for level student
    
/*    for (Human *human1 in [humans reverseObjectEnumerator]) {
        if ([human1 isKindOfClass:[Dantist class]]) {
            Dantist *dantist1 = (Dantist *) human1;
            NSLog(@"%@", dantist1);
        } else {
        NSLog(@"%@", human1);
        }
        if ([human1 respondsToSelector:@selector(movement)]) {
            [human1 movement];
        }
    }*/
    
    
    // Cycle for level master

    for (id object in all) {
        if ([object isKindOfClass:[Human class]]) {
            NSLog(@"It is human from class %@", [object class]);
        } else {
            NSLog(@"It is animal from class %@", [object class]);
        }
        [object movement];
        NSLog(@"%@", object);
    }
    
    
    // Cycle for level star
    
    /*for (int i = 0; i < humans.count + animals.count; i++) {
        NSLog(@"------- i = %d ----------",i);
        if (humans.count == 0) {
            Animal *animal1 = (Animal *) [animals objectAtIndex:i];
            NSLog(@"My nickname is %@. Age is %f. Color is %@.", animal1.nickname, animal1.age, animal1.color);
            [animal1 movement];
        } else {
            if (i == 0) {
            Human *human1 = (Human *) [humans objectAtIndex:0];
            NSLog(@"My name is %@. Height is %f. Weight is %f. I am is %@", human1.name, human1.height, human1.weight, human1.gender);
            [human1 movement];
                } else {
                    if ((i % 2 == !0) && (animals.count > i/2) && (humans.count > i/2)) {
                    Animal *animal1 = (Animal *) [animals objectAtIndex:((i-1)/2)];
                    NSLog(@"My nickname is %@. Age is %f. Color is %@.", animal1.nickname, animal1.age, animal1.color);
                    [animal1 movement];
                    } else if ((i % 2 == 0) && (humans.count > i/2) && (animals.count > i/2)) {
                        Human *human1 = (Human *) [humans objectAtIndex:i/2];
                        NSLog(@"My name is %@. Height is %f. Weight is %f. I am is %@", human1.name, human1.height, human1.weight, human1.gender);
                        [human1 movement];
                    } else if (animals.count <= i/2) {
                        Human *human1 = (Human *) [humans objectAtIndex:(i - animals.count)];
                        NSLog(@"My name is %@. Height is %f. Weight is %f. I am is %@", human1.name, human1.height, human1.weight, human1.gender);
                        [human1 movement];
                    } else if (humans.count <= i/2) {
                        Animal *animal1 = (Animal *) [animals objectAtIndex:(i - humans.count)];
                        NSLog(@"My nickname is %@. Age is %f. Color is %@.", animal1.nickname, animal1.age, animal1.color);
                        [animal1 movement];
                    }
                }
            }
        }*/

    
    // Cycle for level supermen
    
   /* NSMutableArray *allSorted = [NSMutableArray array];
    NSMutableArray *allHumans = [NSMutableArray array];
    NSMutableArray *allAnimals = [NSMutableArray array];

    
    for (int i = 0; i < all.count; i++) {
        if ([[all objectAtIndex:i] isKindOfClass:[Human class]]) {
            [allHumans addObject:[all objectAtIndex:i]];
        } else if (([[all objectAtIndex:i] isKindOfClass:[Animal class]])) {
            [allAnimals addObject:[all objectAtIndex:i]];
        }
    }
    
    NSSortDescriptor *descriptorHuman = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSSortDescriptor *descriptorAnimal = [NSSortDescriptor sortDescriptorWithKey:@"nickname" ascending:YES];

    [allHumans sortUsingDescriptors:[NSArray arrayWithObject:descriptorHuman]];
    [allAnimals sortUsingDescriptors: [NSArray arrayWithObject:descriptorAnimal]];
    [allSorted addObjectsFromArray:allHumans];
    [allSorted addObjectsFromArray:allAnimals];
    
    NSLog(@"%@", allSorted);
    
    */

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
