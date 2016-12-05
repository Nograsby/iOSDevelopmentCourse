//
//  ViewController.m
//  22.Touches.SimpleDragAndDrop
//
//  Created by Vladimir Ananko on 12/5/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "ViewController.h"

static CGFloat const VACheckerSize = 20.0f;

typedef NS_ENUM(NSInteger, VAViewTag) {
    VAViewTagSquare,
    VAViewTagChecker
};

@interface ViewController ()

@property (assign, nonatomic) CGRect basicRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat size = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) / 8;
    self.basicRect = self.view.bounds;
    
    CGFloat startPosY = (CGRectGetMaxY(self.view.bounds) / 2) - (4 * size);
    [self drawViewsWithSquareSize:size startPosY:startPosY backgroundColor:[UIColor blackColor]];
    NSLog(@"self.view.bounds = %@", NSStringFromCGRect(self.view.bounds));
    NSLog(@"self.view.frame = %@", NSStringFromCGRect(self.view.frame));
    NSLog(@"[UIScreen mainScreen].bounds = %@", NSStringFromCGRect([UIScreen mainScreen].bounds));
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
                NSInteger index = [self.view.subviews indexOfObject:view];
                if (index == 1) {
                    //NSLog(@"view.frame -- %@", NSStringFromCGRect:
                    NSLog(@"view.frame9 -- %@", NSStringFromCGRect([view.window.screen.coordinateSpace convertRect:view.frame toCoordinateSpace:view.window.screen.fixedCoordinateSpace]));
                    NSLog(@"view.frame8 -- %@", NSStringFromCGRect(view.window.screen.nativeBounds));
                    NSLog(@"view.frame -- %@", NSStringFromCGRect(view.frame));
                    NSLog(@"[UIApplication sharedApplication].keyWindow.frame -- %@", NSStringFromCGRect([UIApplication sharedApplication].keyWindow.frame));

                    NSLog(@"view.frame1 -- %@", NSStringFromCGRect([view convertRect:view.frame fromView:nil]));
                    NSLog(@"view.frame2 -- %@", NSStringFromCGRect([view.superview convertRect:view.frame fromView:[UIApplication sharedApplication].keyWindow]));
                }
                
                
                view.frame = CGRectMake(CGRectGetMinX(view.frame) + startPosX, CGRectGetMinY(view.frame) - startPosX, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
                if (index == 1) {
                    NSLog(@"view.frame5 -- %@", NSStringFromCGRect(view.frame));

                }
            }
            else if(orientation == UIInterfaceOrientationLandscapeRight) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) + startPosX, CGRectGetMinY(view.frame) - startPosX, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
            else if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
                
                view.frame = CGRectMake(CGRectGetMinX(view.frame) - startPosY, CGRectGetMinY(view.frame) + startPosY, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
        }
        
//        [self mixCheckers];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


@end
