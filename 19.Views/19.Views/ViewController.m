//
//  ViewController.m
//  19.Views
//
//  Created by Vladimir Ananko on 11/30/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//--------------------------------------------------------
//
//Ученик
//
//1. В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
//2. доска должна иметь столько клеток, как и настоящая шахматная
//
//Студент
//
//3. Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
//4. Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.
//
//Мастер
//5. При повороте устройства все черные клетки должны менять цвет :)
//6.Сделайте так, чтобы доска при поворотах всегда строго находилась по центру
//
//Супермен
//8. Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
//9. После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView
//
//--------------------------------------------------------

#import "ViewController.h"

static CGFloat const VACheckerSize = 20.0f;

typedef NS_ENUM(NSInteger, VAViewTag) {
    VAViewTagSquare,
    VAViewTagChecker
};

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat size = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) / 8;
    CGFloat startPosY = (CGRectGetMaxY(self.view.bounds) / 2) - (4 * size);
    [self drawViewsWithSquareSize:size startPosY:startPosY backgroundColor:[UIColor blackColor]];
}

- (void)drawViewsWithSquareSize:(CGFloat)size startPosY:(CGFloat)startPosY backgroundColor:(UIColor *)backgroundColor {
    // Draw square
    for (NSInteger i = 0; i < 8; i++) {
        for (NSInteger j = 0; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * size, j * size + startPosY, size, size)];
                view.backgroundColor = backgroundColor;
                view.tag = VAViewTagSquare;
                [self.view addSubview:view];
            }
        }
    }
    
    CGFloat offset = (size - VACheckerSize) / 2;

    // Draw white checkers
    for (NSInteger i = 0; i < 8; i++) {
        for (NSInteger j = 0; j < 3; j++) {
            if ((i + j) % 2 == 0) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * size + offset, j * size + startPosY + offset, VACheckerSize, VACheckerSize)];
                view.backgroundColor = [UIColor whiteColor];
                view.tag = VAViewTagChecker;
                [self.view addSubview:view];
            }
        }
    }
    
    // Draw red checkers
    for (NSInteger i = 0; i < 8; i++) {
        for (NSInteger j = 5; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * size + offset, j * size + startPosY + offset, VACheckerSize, VACheckerSize)];
                view.backgroundColor = [UIColor redColor];
                view.tag = VAViewTagChecker;
                [self.view addSubview:view];
            }
        }
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        UIColor *backgroundColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];

        CGFloat squareSize = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) / 8;
        CGFloat startPosY = (CGRectGetMaxY(self.view.bounds) / 2) - (4 * squareSize);
        CGFloat startPosX = (CGRectGetMaxX(self.view.bounds) / 2) - (4 * squareSize);
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        for (UIView *view in self.view.subviews) {
            if(orientation == 0) {
            }
            else if(orientation == UIInterfaceOrientationPortrait) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) - startPosY, CGRectGetMinY(view.frame) + startPosY, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
            else if(orientation == UIInterfaceOrientationLandscapeLeft) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) + startPosX, CGRectGetMinY(view.frame) - startPosX, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
            else if(orientation == UIInterfaceOrientationLandscapeRight) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) + startPosX, CGRectGetMinY(view.frame) - startPosX, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
            else if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) - startPosY, CGRectGetMinY(view.frame) + startPosY, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
            if (view.tag == VAViewTagSquare) {
                view.backgroundColor = backgroundColor;
            }
        }
        
        [self mixCheckers];

    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {

    }];
}

- (void)mixCheckers {
    for (UIView *view in self.view.subviews) {
        if (CGRectGetWidth(view.frame) == VACheckerSize) {
            NSInteger currentViewIndex = [self.view.subviews indexOfObject:view];
            NSInteger newIndex = 0;
            UIView *indexView = nil;
            while (CGRectGetWidth(indexView.frame) != VACheckerSize) {
                newIndex = arc4random() % (self.view.subviews.count);
                indexView = self.view.subviews[newIndex];
            }
            CGRect currentViewFrame = view.frame;
            view.frame = indexView.frame;
            indexView.frame = currentViewFrame;
            [self.view exchangeSubviewAtIndex:currentViewIndex withSubviewAtIndex:newIndex];
        }
    }
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
