//
//  AppDelegate.m
//  12.Blocks
//
//  Created by Nograsby on 5/6/16.
//  Copyright © 2016 AV. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Patient.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSArray *patients;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Test with blocks
    void (^TestBlock) (void);
    TestBlock = ^{
        NSLog(@"TestBlock");
    };
    TestBlock ();
    
    void (^TestBlock1) (void) = ^{
        NSLog(@"TestBlock1");
    };
    TestBlock1 ();
    
    void (^TestBlockPar) (NSString *);
    TestBlockPar = ^(NSString *string) {
        NSLog(@"%@", string);
    };
    TestBlockPar (@"TestBlockPar");
    
    void(^TestBlockPar1) (NSString *) = ^(NSString *string) {
        NSLog(@"%@", string);
    };
    TestBlockPar1 (@"TestBlockPar1");
    
    [self testMethodWithBlock:^{
        NSLog(@"TestMethodWithBlock");
    }];
    
    [self testMethodWithBlock1:^(NSString *string) {
        NSLog(@"%@",string);
    }];
    
    [self testMethodWithBlock1:TestBlockPar];
    
    
    // Level Student
// Greate array with students
    NSMutableArray *students = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        Student *student = [[Student alloc] init];
        student.name = [self randomStringWithLength:5];
        if (i == 5) {
            Student *student5 = [students objectAtIndex:i-1];
            student.lastname = student5.lastname;
        } else {
            student.lastname = [self randomStringWithLength:10];
            }
        NSLog(@"%@ %@", student.name, student.lastname);
    
        [students addObject:student];
    }
    
    [students sortUsingComparator:^NSComparisonResult(Student *obj1, Student *obj2) {
        if ([obj1.lastname isEqualToString:obj2.lastname]) {
            return [obj1.name compare:obj2.name];
        } else {
        return [obj1.lastname compare:obj2.lastname];
        }
    }];
  
    NSLog(@"------- Sorted Array -------\n");
    for (Student *student in students) {
        NSLog(@"%@ %@",student.name,student.lastname);
    }
    
    // Level Master
    void (^patientBlock) (Patient *) = ^ (Patient *illPatient) {
        if (illPatient.temperature < 40 && illPatient.temperature >= 38) {
            [illPatient takePill];
        } else if (illPatient.temperature >= 40) {
            [illPatient makeShot];
        } else {
            NSLog(@"Patient %@. Temperature is %.2f. He is ok!!!", illPatient.name, illPatient.temperature);
        }
    };

    Patient *patient1 = [[Patient alloc]initWithBlock:patientBlock];
    patient1.name = @"Vasiliy";
    
    Patient *patient2 = [[Patient alloc]initWithBlock:patientBlock];
    patient2.name = @"Petr";
   
    Patient *patient3 = [[Patient alloc]initWithBlock:patientBlock];
    patient3.name = @"Dmitrii";
 
    self.patients = [NSArray arrayWithObjects:patient1, patient2, patient3, nil];
    
    for (Patient *patient in self.patients) {
        if (![patient areYouOk]) {
            [patient patientFeelBedWithInfo:patientBlock];
            }
    }
    return YES;
}


-(void)tempMethod {
    NSLog(@"patient feel good");
}

- (NSString *)randomStringWithLength: (NSInteger)length {
    NSString *letters = @"абвгдежзийклмнопрстуфхцчшщьыъэюя";
    NSMutableString *tempname = [NSMutableString stringWithCapacity:[letters length]];
    NSString *capitalizedName = nil;
    for (int j = 0; j < length; j++) {
        NSInteger number = arc4random() % [letters length];
        [tempname appendFormat: @"%C", [letters characterAtIndex:number]];
        capitalizedName = [tempname capitalizedString];
    }
    return capitalizedName;
}

- (void)testMethodWithBlock: (void(^)(void))test {
    test ();
}

- (void)testMethodWithBlock1: (void(^)(NSString *))test {
    test (@"TestMethodWithBlock1");
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
