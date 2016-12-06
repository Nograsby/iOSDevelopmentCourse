//
//  ViewController.m
//  22.Touches.SimpleDragAndDrop
//
//  Created by Vladimir Ananko on 12/5/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "ViewController.h"

static CGFloat const VACheckerRatio = 0.7f; //  >0 ... 1

typedef NS_ENUM(NSInteger, VAViewTag) {
    VAViewTagSquare,
    VAViewTagChecker
};

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *fieldViewsArray;
@property (strong, nonatomic) NSMutableArray *checkersViewsArray;
@property (strong, nonatomic) UIView *dragView;
@property (assign, nonatomic) CGPoint touchPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fieldViewsArray = [NSMutableArray array];
    self.checkersViewsArray = [NSMutableArray array];

    CGFloat size = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) / 8;
    
    CGFloat startPosY = (CGRectGetMaxY(self.view.bounds) / 2) - (4 * size);
    [self drawViewsWithSquareSize:size startPosY:startPosY backgroundColor:[UIColor blackColor]];
}

- (void)drawViewsWithSquareSize:(CGFloat)size startPosY:(CGFloat)startPosY backgroundColor:(UIColor *)backgroundColor {
    
    CGFloat offset = ((1 - VACheckerRatio) * size) / 2;

    for (NSInteger i = 0; i < 8; i++) {
        for (NSInteger j = 0; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                UIView *view = [self createViewWithFrame:CGRectMake(i * size, j * size + startPosY, size, size)
                                         backgroundColor:backgroundColor
                                                     tag:VAViewTagSquare];
                [self.fieldViewsArray addObject:view];
                
                // Draw checkers
                UIColor *checkerColor = ((j >= 0) && (j < 3)) ? [UIColor whiteColor] : [UIColor redColor];
                
                if ((j != 3) && (j != 4)) {
                    UIView *view = [self createViewWithFrame:CGRectMake(i * size + offset,
                                                                        j * size + startPosY + offset,
                                                                        size * VACheckerRatio,
                                                                        size * VACheckerRatio)
                                             backgroundColor:checkerColor
                                                         tag:VAViewTagChecker];
                    [self.checkersViewsArray addObject:view];
                }
            }
        }
    }
}

- (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor tag:(VAViewTag)tag {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    view.tag = tag;
    if (tag == VAViewTagChecker) {
        view.layer.cornerRadius = CGRectGetWidth(view.bounds) / 2;
    }
    [self.view addSubview:view];
    return view;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        CGFloat squareSize = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) / 8;
        CGFloat startPos = (MAX(CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds)) / 2) - (4 * squareSize);
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        for (UIView *view in self.view.subviews) {
            if((orientation == UIInterfaceOrientationPortrait)||(orientation == UIInterfaceOrientationPortraitUpsideDown)) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) - startPos,
                                        CGRectGetMinY(view.frame) + startPos,
                                        CGRectGetWidth(view.frame),
                                        CGRectGetHeight(view.frame));
            }
            else if((orientation == UIInterfaceOrientationLandscapeLeft)||(orientation == UIInterfaceOrientationLandscapeRight)) {
                view.frame = CGRectMake(CGRectGetMinX(view.frame) + startPos,
                                        CGRectGetMinY(view.frame) - startPos,
                                        CGRectGetWidth(view.frame),
                                        CGRectGetHeight(view.frame));
            }
        }
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [touches.anyObject locationInView:self.view];
    UIView *view = [self.view hitTest:point withEvent:event];
    if ([self.checkersViewsArray containsObject:view]) {
        self.dragView = view;
        [UIView animateWithDuration:0.3f
                         animations:^{
                             CGAffineTransform transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             view.transform = transform;
                         }];
        CGPoint pointInView = [touches.anyObject locationInView:view];
        self.touchPoint = pointInView;
        [self.view bringSubviewToFront:view];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
#warning Check
    CGPoint point = [touches.anyObject locationInView:self.view];
    CGPoint offset = CGPointMake(self.touchPoint.x - CGRectGetWidth(self.dragView.bounds) / 2, self.touchPoint.y - CGRectGetHeight(self.dragView.bounds) / 2);
    self.dragView.center = CGPointMake(point.x - offset.x, point.y - offset.y);
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded %@", NSStringFromCGPoint([touches.anyObject locationInView:self.view]));

    CGPoint point = [touches.anyObject locationInView:self.view];
    CGPoint offset = CGPointMake(self.touchPoint.x - CGRectGetWidth(self.dragView.bounds) / 2, self.touchPoint.y - CGRectGetHeight(self.dragView.bounds) / 2);
    self.dragView.center = CGPointMake(point.x - offset.x, point.y - offset.y);
    
    NSMutableDictionary *distanceDictionary = [NSMutableDictionary dictionary];
    for (UIView *view in self.fieldViewsArray) {
        CGFloat distance = hypotf(view.center.x - self.dragView.center.x, view.center.y - self.dragView.center.y);
        [distanceDictionary setObject:view forKey:@(distance)];
    }
    
    NSArray *allDistances = [distanceDictionary allKeys];
    NSArray *sortedDistances = [allDistances sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return obj1.floatValue > obj2.floatValue;
    }];
    
    for (NSInteger i = 0; i < sortedDistances.count; i++) {
        UIView *closestFieldView = [distanceDictionary objectForKey:sortedDistances[i]];
        BOOL isEmptySquare = YES;

        for (UIView *view in self.checkersViewsArray) {
            if (CGRectContainsRect(closestFieldView.frame, view.frame)&&(![view isEqual:self.dragView])) {
                isEmptySquare = NO;
            }
        }
        
        if (isEmptySquare) {
            [UIView animateWithDuration:0.3f animations:^{
                self.dragView.center = closestFieldView.center;
            }];
            break;
        }
    }
    
    [self dropView];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    CGPoint point = [touches.anyObject locationInView:self.view];
    UIView *view = [self.view hitTest:point withEvent:event];
    
    NSLog(@"touchesCancelled %@", NSStringFromCGPoint([touches.anyObject locationInView:self.view]));
    
    [self dropView];
}

- (void)dropView {
#warning Check
    self.dragView.transform = CGAffineTransformIdentity;
    self.dragView = nil;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
