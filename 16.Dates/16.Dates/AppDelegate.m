//
//  AppDelegate.m
//  16.Dates
//
//  Created by Vladimir Ananko on 11/27/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//--------------------------------------------------------
//
//Ученик.
//
//1. Создайте класс студент у когторого будет проперти dateOfBirth (дата рождения), которая собственно NSDate.
//2. Инициализируйте NSMutableArray и в цикле создайте 30 студентов.
//3. Каждому установите дату рождения. Возраст рандомный от 16 до 50 лет.
//4. В другом цикле пройдитесь по всему массиву и выведите день рождения каждого студента в адекватном формате.
//
//Студент.
//
//5. Отсортируйте массив студентов по дате рождения, начиная от самого юного.
//6. Используя массивы имен и фамилий (по 5-10 имен и фамилий), каждому студенту установите случайное имя и случайную фамилию.
//7. Выведите отсортированных студентов: Имя, Фамилия, год рождения
//
//Мастер.
//
//10. Создайте таймер в апп делегате, который отсчитывает один день за пол секунды.
//11. Когда таймер доходит до дня рождения любого их студентов - поздравлять его с днем рождения.
//12. Выведите на экран разницу в возрасте между самым молодым и самым старым студентом (количество лет, месяцев, недель и дней)
//
//Супермен.
//
//13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
//14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
//15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
//
//--------------------------------------------------------


#import "AppDelegate.h"

#import "VAStudent.h"

#import "VADateHelper.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSDate *date;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Beginnner
    NSMutableArray *studentsArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 30; i++) {
        VAStudent *student = [[VAStudent alloc] init];
        student.number = [NSString stringWithFormat:@"%ld", (long)i + 1];
        [studentsArray addObject:student];
    }
    for (VAStudent *student in studentsArray) {
        NSLog(@"%@", student);
    }

    // Student
    [studentsArray sortUsingComparator:^NSComparisonResult(VAStudent *student1, VAStudent *student2) {
        if ([student2.dateOfBirth compare:student1.dateOfBirth] == NSOrderedSame) {
            return [student1.lastName compare:student2.lastName];
        }
        else {
            return [student2.dateOfBirth compare:student1.dateOfBirth];
        }
    }];
    
    for (VAStudent *student in studentsArray) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy"];
        NSString *year = [dateFormatter stringFromDate:student.dateOfBirth];
        NSLog(@"%@ | %@ | %@",
        [self getStringWithCapacity:10 andString:student.firstName],
        [self getStringWithCapacity:12 andString:student.lastName],
        [self getStringWithCapacity:5 andString:year]);
    }
    
    // Master
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                    repeats:YES
                                      block:^(NSTimer * _Nonnull timer) {
                                          [self calculateNewDate];
                                          NSDate *todayDate = [VADateHelper dateFromDate:self.date filteredWithComponents:kCFCalendarUnitMonth | kCFCalendarUnitDay];
                                          for (VAStudent *student in studentsArray) {
                                              NSDate *birthdayDate = [VADateHelper dateFromDate:student.dateOfBirth filteredWithComponents:kCFCalendarUnitMonth | kCFCalendarUnitDay];
                                              NSString *birthdayString = [VADateHelper stringFromDate:student.dateOfBirth withDateFormat:@"yyyy-MM-dd"];
                                              if ([birthdayDate isEqualToDate:todayDate]) {
                                                  NSLog(@"Congratulate student %@ %@ !!!! He have birthday today. He was born in %@.",
                                                        student.firstName, student.lastName, birthdayString);
                                              }
                                          }
    }];
    VAStudent *oldestStudent = studentsArray.lastObject;
    VAStudent *youngestStudent = studentsArray.firstObject;
    NSLog(@"The oldest student: %@", oldestStudent);
    NSLog(@"The youngest student: %@", youngestStudent);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *yearComponent = [calendar components:NSCalendarUnitYear fromDate:oldestStudent.dateOfBirth toDate:youngestStudent.dateOfBirth options:0];
    NSDateComponents *monthComponent = [calendar components:NSCalendarUnitMonth fromDate:oldestStudent.dateOfBirth toDate:youngestStudent.dateOfBirth options:0];
    NSDateComponents *weekComponent = [calendar components:NSCalendarUnitWeekOfYear fromDate:oldestStudent.dateOfBirth toDate:youngestStudent.dateOfBirth options:0];
    NSDateComponents *dayComponent = [calendar components:NSCalendarUnitDay fromDate:oldestStudent.dateOfBirth toDate:youngestStudent.dateOfBirth options:0];
    NSLog(@"Difference between them:");
    NSLog(@"In years: %ld.", (long)yearComponent.year);
    NSLog(@"In months: %ld.", (long)monthComponent.month);
    NSLog(@"In weeks: %ld.", (long)weekComponent.weekOfYear);
    NSLog(@"In days: %ld.", (long)dayComponent.day);
    
    // Supermen
    //13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
    //14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
    //15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
    
    return YES;
}

- (NSString *)getStringWithCapacity:(NSInteger)capacity andString:(NSString *)string {
    NSString *result = @"";
    result = [result stringByPaddingToLength:(capacity - string.length) withString:@" " startingAtIndex:0];
    result = [result stringByAppendingString:string];
    return result;
}

- (void)calculateNewDate {
    if (!self.date) {
        self.date = [NSDate date];
    }
    else {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        self.date = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self.date options:0];
    }
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
