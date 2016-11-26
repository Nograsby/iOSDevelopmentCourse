//
//  AppDelegate.m
//  15.BitwiseOperations
//
//  Created by Vladimir Ananko on 11/25/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//--------------------------------------------------------
//Ученик.
//
//1. Повторите мой код и создайте класс студент с соответствующим набором предметов
//2. В цикле создайте 10 студентов и добавьте их в массив. Используйте мутабл массив
//3. У каждого рандомно установите предметы
//
//Студент
//
//4. В новом цикле пройдитесь по студентам и разделите их уже на два массива - технари и гуманитарии.
//5. Также посчитайте количество тех кто учит программирование
//
//Мастер.
//
//6. Если студенты выбрали биологию, то отмените ее у них и выведите сообщение в лог, предмет отменен
//7. Тут придется разобраться как сбросить бит, включите логику :)
//
//Супермен.
//8. Сгенерируйте случайный интежер в диапазоне от 0 до максимума.
//9. Используя цикл и битовые операыии (и возможно NSMutableString) выведите это число на экран в двоичном виде
//--------------------------------------------------------

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Beginner
    NSMutableArray *studentsArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        Student *student = [[Student alloc] init];
        student.name = [NSString stringWithFormat:@"Student %ld", (long)i];
        [studentsArray addObject:student];
    }
    
    for (Student *student in studentsArray) {
        NSLog(@"%@", student);
    }
    
    // Student
    NSMutableArray *humanistsArray = [NSMutableArray array];
    NSMutableArray *techniciansArray = [NSMutableArray array];

    for (Student *student in studentsArray) {
        NSInteger humanistSubjectsCount = 0;
        NSInteger technicianSubjectsCount = 0;

        if (StudentLearningBiology & student.subject) {
            humanistSubjectsCount++;
        }
        if (StudentLearningGeography & student.subject) {
            humanistSubjectsCount++;
        }
        if (StudentLearningMathematics & student.subject) {
            technicianSubjectsCount++;
        }
        if (StudentLearningProgramming & student.subject) {
            technicianSubjectsCount++;
        }
        if (StudentLearningPhysics & student.subject) {
            technicianSubjectsCount++;
        }
        if (StudentLearningAnatomy & student.subject) {
            humanistSubjectsCount++;
        }
        
        if (technicianSubjectsCount >= humanistSubjectsCount) {
            [techniciansArray addObject:student];
        }
        else {
            [humanistsArray addObject:student];
        }
    }

    for (Student *student in humanistsArray) {
        NSLog(@"Humanist student!!! %@", student);
    }
    for (Student *student in techniciansArray) {
        NSLog(@"Technician student!!! %@", student);
    }
    
    NSInteger programmingLearningStudents = 0;
    for (Student *student in studentsArray) {
        if (StudentLearningProgramming & student.subject) {
            programmingLearningStudents++;
        }
    }
    NSLog(@"Programming learning %ld students.", (long)programmingLearningStudents);
    
    // Master
    for (Student *student in studentsArray) {
        student.subject = student.subject & ~StudentLearningBiology;
    }
    for (Student *student in studentsArray) {
        NSLog(@"%@", student);
    }
    
    // Supermen
    NSUInteger randomNumber = arc4random();
    NSLog(@"Set number %lu", (unsigned long)randomNumber);
    NSString *binaryString = [self getBinaryStringFrom:randomNumber];
    NSLog(@"%@", binaryString);
    
    return YES;
}

- (NSString *)getBinaryStringFrom:(NSUInteger)number {
    NSInteger numberBits = sizeof(number) * 8;
    NSString *binaryString = @"";

    for (NSInteger i = (numberBits - 1); i >= 0; i--) {
        NSUInteger bit = 1 << i;
        
        binaryString = [binaryString stringByAppendingString:[NSString stringWithFormat:@"%@", (number & bit) ? @"1" : @"0"]];
        if (i % 4 == 0) {
            binaryString = [binaryString stringByAppendingString:@" "];
        }
    }
    return binaryString;
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
