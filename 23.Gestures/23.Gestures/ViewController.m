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
@property (assign, nonatomic) CGFloat lastScale;
@property (assign, nonatomic) CGFloat imageViewRotation;

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
    
    UITapGestureRecognizer *doubleTapTouchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapTouch:)];
    doubleTapTouchGesture.numberOfTapsRequired = 2;
    doubleTapTouchGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapTouchGesture];
    
    // Supermen
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];

    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotateGesture.delegate = self;
    [self.view addGestureRecognizer:rotateGesture];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:self.view];
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageView.center = touchPoint;
                     }
                     completion:^(BOOL finished) {
                     }];
}

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

- (void)handleDoubleTapTouch:(UITapGestureRecognizer *)gesture {
    [self.imageView.layer removeAllAnimations];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.lastScale = gesture.scale;
    }
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGFloat newScale = 1 - (self.lastScale - gesture.scale);
                         CGAffineTransform scale = CGAffineTransformScale(self.imageView.transform, newScale, newScale);
                         self.lastScale = gesture.scale;
                         self.imageView.transform = scale;
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)handleRotation:(UIRotationGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.imageViewRotation = gesture.rotation;
    }
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGFloat newRotation = gesture.rotation - self.imageViewRotation;
                         NSLog(@"newRotation %f", newRotation);
                         CGAffineTransform rotation = CGAffineTransformRotate(self.imageView.transform, newRotation);
                         self.imageViewRotation = gesture.rotation;
                         self.imageView.transform = rotation;
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (void)rotateSpinningView:(UIView *)spiningView withRotationDirection:(VARotationDirection)rotationDirection {
    CGFloat angle = (rotationDirection == VARotationDirectionClockwise) ? M_PI_2 : -M_PI_2;
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGAffineTransform rotate = CGAffineTransformRotate(spiningView.transform, angle);
                         spiningView.transform = rotate;
                     }
                     completion:^(BOOL finished) {
                         if (finished && !CGAffineTransformEqualToTransform(spiningView.transform, self.currentTransform)) {
                             [self rotateSpinningView:spiningView withRotationDirection:rotationDirection];
                         }
                     }];
}

- (UIColor *)randomColor {
    CGFloat r = arc4random() % 256 / 255.0f;
    CGFloat g = arc4random() % 256 / 255.0f;
    CGFloat b = arc4random() % 256 / 255.0f;
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    return color;
}

@end
