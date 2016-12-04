//
//  ViewController.m
//  21.ViewAnimations
//
//  Created by Vladimir Ananko on 12/3/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//--------------------------------------------------------
//
//Ученик.
//
//1. Создайте 4 вьюхи у левого края ипада.
//2. Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
//3. Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами :)
//4. Добавте реверсивную анимацию и бесконечные повторения
//5. добавьте смену цвета на рандомный
//
//Студент
//
//5. Добавьте еще четыре квадратные вьюхи по углам - красную, желтую, зеленую и синюю
//6. За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
//7. Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех :)
//8. Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)
//
//Мастер
//
//8. Нарисуйте несколько анимационных картинок человечка, который ходит.
//9. Добавьте несколько человечков на эту композицию и заставьте их ходить
//
//--------------------------------------------------------

#import "ViewController.h"

typedef NS_ENUM(NSInteger, VAMovingDirection) {
    VAMovingDirectionClockwise,
    VAMovingDirectionCounterclockwise
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *viewsArray = [NSMutableArray array];

    // Beginner
//    [self addViewsToArray:viewsArray];
//    [self animateViewsWithArray:viewsArray];
    
    // Student
//    [self addCornerViewsToArray:viewsArray];
//    [self animateCornerViewsWithArray:viewsArray];
    
    // Master
    [self addCornerImageViewsToArray:viewsArray];
    [self animateCornerImageViewsWithArray:viewsArray];

}

#pragma mark - Beginner
- (void)addViewsToArray:(NSMutableArray *)array {
    CGFloat viewSize = CGRectGetHeight(self.view.frame) / 9;
    for (NSInteger i = 0; i < 4; i++) {
        UIView *view = [self createViewWithRandomColorAndFrame:CGRectMake(0, (i * 2 + 1) * viewSize, viewSize, viewSize)];
        [array addObject:view];
    }
}

- (void)animateViewsWithArray:(NSMutableArray *)array {
    for (UIView *view in array) {
        NSInteger index = [array indexOfObject:view];

        NSInteger options = UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat;
        
        switch (index) {
            case 0:
                options = options | UIViewAnimationOptionCurveEaseInOut;
                break;
            case 1:
                options = options | UIViewAnimationOptionCurveEaseIn;
                break;
            case 2:
                options = options | UIViewAnimationOptionCurveEaseOut;
                break;
            case 3:
                options = options | UIViewAnimationOptionCurveLinear;
                break;
            default:
                break;
        }
        
        [UIView animateWithDuration:5 delay:1
                            options:options
                         animations:^{
                             CGFloat viewSize = CGRectGetHeight(view.frame);
                             view.frame = CGRectMake(CGRectGetWidth(self.view.frame) - viewSize, (index * 2 + 1) * viewSize, viewSize, viewSize);
                             view.backgroundColor = [self randomColor];
                         } completion:^(BOOL finished) {
                             NSLog(@"Animation finished: %@", finished ? @"YES" : @"NO");
                         }];
    }
}

#pragma mark - Student
- (void)addCornerViewsToArray:(NSMutableArray *)array {
    NSMutableArray *framesArray = [self createCornerFramesArrayWithViewSize:100.0f];
    for (NSString *frameString in framesArray) {
        UIView *view = [self createViewWithRandomColorAndFrame:CGRectFromString(frameString)];
        [array addObject:view];
    }
}

- (void)animateCornerViewsWithArray:viewsArray {
    NSMutableArray *framesArray = [NSMutableArray array];
    NSMutableArray *colorsArray = [NSMutableArray array];
    for (UIView *view in viewsArray) {
        [framesArray addObject:NSStringFromCGRect(view.frame)];
        [colorsArray addObject:view.backgroundColor];
    }
    
    NSInteger movingDirection = arc4random() % 2 ? VAMovingDirectionClockwise : VAMovingDirectionCounterclockwise;
    NSMutableArray *newFramesArray = [self mutableArrayWithShiftingFromMutableArray:framesArray withDirection:movingDirection];
    NSMutableArray *newColorsArray = [self mutableArrayWithShiftingFromMutableArray:colorsArray withDirection:movingDirection];
    
        [UIView animateWithDuration:5 delay:1
                        options:0
                     animations:^{
                         for (UIView *view in viewsArray) {
                             NSInteger index = [viewsArray indexOfObject:view];
                             view.frame = CGRectFromString(newFramesArray[index]);
                             view.backgroundColor = newColorsArray[index];
//                             CGAffineTransform transform = CGAffineTransformMakeScale(2,3);
//                             CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI);
//                             CGAffineTransform combine = CGAffineTransformConcat(transform, rotate);
//                             view.transform = combine;
                         }
                     } completion:^(BOOL finished) {
                         
                         __weak NSMutableArray *weakArray = viewsArray;
                         [self animateCornerViewsWithArray:weakArray];
                     }];
}

#pragma mark - Master
- (void)addCornerImageViewsToArray:(NSMutableArray *)array {
    NSMutableArray *framesArray = [self createCornerFramesArrayWithViewSize:300.0f];
       for (NSString *frameString in framesArray) {
        UIImageView *imageView = [self createImageViewWithFrame:CGRectFromString(frameString)];
        [array addObject:imageView];
    }
}

- (void)animateCornerImageViewsWithArray:viewsArray {
    NSMutableArray *framesArray = [NSMutableArray array];
    for (UIView *view in viewsArray) {
        [framesArray addObject:NSStringFromCGRect(view.frame)];
    }
    
    NSInteger movingDirection = arc4random() % 2 ? VAMovingDirectionClockwise : VAMovingDirectionCounterclockwise;
    NSMutableArray *newFramesArray = [self mutableArrayWithShiftingFromMutableArray:framesArray withDirection:movingDirection];
    
    [UIView animateWithDuration:5 delay:1
                        options:0
                     animations:^{
                         for (UIView *view in viewsArray) {
                             NSInteger index = [viewsArray indexOfObject:view];
                             view.frame = CGRectFromString(newFramesArray[index]);
                         }
                     } completion:^(BOOL finished) {
                         
                         __weak NSMutableArray *weakArray = viewsArray;
                         [self animateCornerImageViewsWithArray:weakArray];
                     }];
}


#pragma mark - Support methods

- (NSMutableArray *)createCornerFramesArrayWithViewSize:(CGFloat)viewSize {
    CGRect frame1 = CGRectMake(0, 0, viewSize, viewSize);
    CGRect frame2 = CGRectMake(CGRectGetWidth(self.view.frame) - viewSize, 0, viewSize, viewSize);
    CGRect frame3 = CGRectMake(CGRectGetWidth(self.view.frame) - viewSize, CGRectGetHeight(self.view.frame) - viewSize, viewSize, viewSize);
    CGRect frame4 = CGRectMake(0, CGRectGetHeight(self.view.frame) - viewSize, viewSize, viewSize);
    NSMutableArray *framesArray = [NSMutableArray arrayWithObjects:NSStringFromCGRect(frame1), NSStringFromCGRect(frame2), NSStringFromCGRect(frame3), NSStringFromCGRect(frame4), nil];
    return framesArray;
}


- (NSMutableArray *)mutableArrayWithShiftingFromMutableArray:(NSMutableArray *)array withDirection:(VAMovingDirection)direction {
    NSMutableArray *shiftingArray = array.mutableCopy;
    NSInteger index = (direction == VAMovingDirectionClockwise) ? 0 : (shiftingArray.count - 1);
    NSInteger newIndex = (direction == VAMovingDirectionClockwise) ? (shiftingArray.count - 1) : 0;
    id object = [shiftingArray objectAtIndex:index];
    [shiftingArray removeObjectAtIndex:index];
    [shiftingArray insertObject:object atIndex:newIndex];
    return shiftingArray;
}

- (UIView *)createViewWithRandomColorAndFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [self randomColor];
    [self.view addSubview:view];
    return view;
}

- (UIImageView *)createImageViewWithFrame:(CGRect)frame {
    NSArray *imagesArray = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"2.jpg"],
                            [UIImage imageNamed:@"3.jpg"],
                            [UIImage imageNamed:@"4.jpg"],
                            [UIImage imageNamed:@"5.jpg"], nil];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.animationImages = imagesArray;
    imageView.animationDuration = 0.5f;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    return imageView;
}

- (UIColor *)randomColor {
    CGFloat r = arc4random() % 256 / 255.f;
    CGFloat g = arc4random() % 256 / 255.f;
    CGFloat b = arc4random() % 256 / 255.f;
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    return color;
}

@end
