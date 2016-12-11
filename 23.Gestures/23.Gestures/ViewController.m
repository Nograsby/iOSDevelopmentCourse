//
//  ViewController.m
//  23.Gestures
//
//  Created by Vladimir Ananko on 12/8/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//--------------------------------------------------------
//
//Ученик
//
//1. Добавьте квадратную картинку на вьюху вашего контроллера
//2. Если хотите, можете сделать ее анимированной
//
//Студент
//
//3. По тачу анимационно передвигайте картинку со ее позиции в позицию тача
//4. Если я вдруг делаю тач во время анимации, то картинка должна двигаться в новую точку без рывка (как будто она едет себе и все)
//
//Мастер
//
//5. Если я делаю свайп вправо, то давайте картинке анимацию поворота по часовой стрелке на 360 градусов
//6. То же самое для свайпа влево, только анимация должна быть против часовой (не забудьте остановить предыдущее кручение)
//7. По двойному тапу двух пальцев останавливайте анимацию
//
//Супермен
//
//8. Добавьте возможность зумить и отдалять картинку используя пинч
//9. Добавьте возможность поворачивать картинку используя ротейшн
//
//--------------------------------------------------------

#import "ViewController.h"

typedef NS_ENUM(NSInteger, VARotationDirection) {
    VARotationDirectionClockwise,
    VARotationDirectionCounterclockwise
};

@interface ViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGAffineTransform currentTransform;

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Beginner
    self.imageView = [[UIImageView alloc] initWithFrame:
                              CGRectMake(CGRectGetMidX(self.view.bounds) - 50.0f,
                                         CGRectGetMidY(self.view.bounds) - 50.0f,
                                         100.0f,
                                         100.0f)];
    NSMutableArray *imagesArray = [NSMutableArray array];
    for (NSInteger i = 1; i <= 15; i++) {
        self.imageView.animationImages = imagesArray;
        NSString *imageNameString = [NSString stringWithFormat:@"planetary-gear-%ld.png", (long)i];
        UIImage *image = [UIImage imageNamed:imageNameString];
        [imagesArray addObject:image];
    }
    self.imageView.image = [UIImage imageNamed:@"planetary-gear-1.png"];
    self.imageView.animationImages = imagesArray;
    [self.imageView startAnimating];
    [self.view addSubview:self.imageView];
    
    // Student
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
 //   tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
    
    // Master
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    [tapGesture requireGestureRecognizerToFail:rightSwipeGesture];
    [tapGesture requireGestureRecognizerToFail:leftSwipeGesture];

    
//    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//    doubleTapGesture.numberOfTapsRequired = 2;
//    [self.view addGestureRecognizer:doubleTapGesture];
//    
//    UITapGestureRecognizer *doubleTapTouchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapTouch:)];
//    doubleTapTouchGesture.numberOfTapsRequired = 2;
//    doubleTapTouchGesture.numberOfTouchesRequired = 2;
//    [self.view addGestureRecognizer:doubleTapTouchGesture];
//    
//    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
//    

//    
//    UIPinchGestureRecognizer *swipeGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
//    [self.view addGestureRecognizer:swipeGesture];
//    swipeGesture.delegate = self;
//    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft |
//    UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
//    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
}

- (void)handleTap:(UIGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:self.view];
    [UIView animateWithDuration:2.0f animations:^{
        self.imageView.center = touchPoint;
    }];
}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//
//    CGPoint touchPoint = [touch locationInView:self.view];
//    [UIView animateWithDuration:2.0f animations:^{
//        self.imageView.center = touchPoint;
//    }];
//    return YES;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0) {
//    NSLog(@"[otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]] -- %d",[gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]&& [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]);
//    return [gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]&& [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
//}



//- (void)handleDoubleTap:(UIGestureRecognizer *)gesture {
//    CGAffineTransform currentTransform = self.imageView.transform;
//    CGAffineTransform scaleTransform = CGAffineTransformScale(currentTransform, 1.2f, 1.2f);
//    [UIView animateWithDuration:0.3f animations:^{
//        self.imageView.transform = scaleTransform;
//    }];
//}
//
//- (void)handleDoubleTapTouch:(UIGestureRecognizer *)gesture {
//    CGAffineTransform currentTransform = self.imageView.transform;
//    CGAffineTransform scaleTransform = CGAffineTransformScale(currentTransform, 0.8f, 0.8f);
//    [UIView animateWithDuration:0.3f animations:^{
//        self.imageView.transform = scaleTransform;
//    }];
//}



- (void)handleRightSwipe:(UISwipeGestureRecognizer *)gesture {
    self.currentTransform = self.imageView.transform;
    [self.imageView.layer removeAllAnimations];
    [self rotateSpinningView:self.imageView withRotationDirection:VARotationDirectionClockwise];
}

- (void)handleLeftSwipe:(UISwipeGestureRecognizer *)gesture {
    self.currentTransform = self.imageView.transform;
    [self.imageView.layer removeAllAnimations];
    [self rotateSpinningView:self.imageView withRotationDirection:VARotationDirectionCounterclockwise];
}

- (void)rotateSpinningView:(UIView *)spiningView withRotationDirection:(VARotationDirection)rotationDirection {
    CGFloat angle = (rotationDirection == VARotationDirectionClockwise) ? M_PI_2 : -M_PI_2;
    [UIView animateWithDuration:1.0f
                          delay:0
                        options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [spiningView setTransform:CGAffineTransformRotate(self.currentTransform, angle)];
                     }
                     completion:^(BOOL finished) {
                         if (finished && !CGAffineTransformEqualToTransform(self.currentTransform, self.currentTransform)) {
                             [self rotateSpinningView:spiningView withRotationDirection:rotationDirection];
                         }
                     }];
}

//- (void)rotateSpinningView:(UIView *)spiningView withRotationDirection:(VARotationDirection)rotationDirection {
//    CGFloat angle = (rotationDirection == VARotationDirectionClockwise) ? M_PI_2 : -M_PI_2;
//    [UIView animateWithDuration:1.0f
//                          delay:0
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:^{
//                         [spiningView setTransform:CGAffineTransformRotate(spiningView.transform, angle)];
//                     }
//                     completion:^(BOOL finished) {
//                         if (finished && !CGAffineTransformEqualToTransform(spiningView.transform, CGAffineTransformIdentity)) {
//                             [self rotateSpinningView:spiningView withRotationDirection:rotationDirection];
//                         }
//                     }];
//}

- (UIColor *)randomColor {
    CGFloat r = arc4random() % 256 / 255.0f;
    CGFloat g = arc4random() % 256 / 255.0f;
    CGFloat b = arc4random() % 256 / 255.0f;
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    return color;
}

@end
