//
//  VADrawingView.m
//  24.UIViewDrawings
//
//  Created by Vladimir Ananko on 12/19/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

//
//Ученик.
//
//1. Нарисуйте пятиконечную звезду :)
//2. Добавьте окружности на концах звезды
//3. Соедините окружности линиями
//
//Студент.
//
//4. Закрасте звезду любым цветом цветом оО
//5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
//
//Мастер
//
//6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)
//
//Супермен
//
//7. Сделайте простую рисовалку - веду пальцем по экрану и рисую :)
//

#import "VADrawingView.h"

static CGFloat const VACircleRadius = 5.0f;

@interface VADrawingView ()

@property (assign, nonatomic) CGPoint lastTouchPoint;
@property (strong, nonatomic) NSMutableArray *pointsArray;

@end

@implementation VADrawingView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.pointsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
// Beginner
//    [self drawStarWithRect:CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)];

// Student
/*    NSMutableArray *rectsArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        BOOL isIncorrectRect = YES;
        CGRect starRect = CGRectZero;
        while (isIncorrectRect) {
            isIncorrectRect = NO;
            starRect = [self generateStarRectInRect:rect];
            for (NSString *rectString in rectsArray) {
                CGRect rectFromString = CGRectFromString(rectString);
                if (CGRectIntersectsRect(rectFromString, starRect)) {
                    isIncorrectRect = YES;
                }
            }
        }
        [self drawStarWithRect:starRect];
        [rectsArray addObject:NSStringFromCGRect(starRect)];
    } */
    
// Supermen (fast realization. Not beautiful)
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (NSString *pointString in self.pointsArray) {
        CGPoint touchPoint = CGPointFromString(pointString);
        CGContextMoveToPoint(context, self.lastTouchPoint.x, self.lastTouchPoint.y);
        CGContextAddLineToPoint(context, touchPoint.x, touchPoint.y);
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 1.5f);
        CGContextStrokePath(context);
        
        self.lastTouchPoint = touchPoint;
    }

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self addGestureRecognizer:panGesture];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    self.lastTouchPoint = touchPoint;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:self];
    [self.pointsArray addObject:NSStringFromCGPoint(touchPoint)];
    [self setNeedsDisplay];
}

- (CGRect)generateStarRectInRect:(CGRect)rect {
    CGFloat starSize = arc4random() % 30 + 50;
    CGFloat xCenter = arc4random() % (NSInteger)(CGRectGetWidth(rect) - starSize - VACircleRadius) + (starSize + VACircleRadius) / 2;
    CGFloat yCenter = arc4random() % (NSInteger)(CGRectGetHeight(rect) - starSize - VACircleRadius) + (starSize + VACircleRadius)/ 2;
    CGRect starRect = CGRectMake(xCenter - starSize / 2, yCenter - starSize / 2, starSize, starSize);
    return starRect;
}

- (void)drawStarWithRect:(CGRect)rect {
    // Star
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = CGRectGetMidX(rect);
    CGFloat yCenter = CGRectGetMidY(rect);
    
    double starRadius = CGRectGetWidth(rect) / 2.0f;
    CGFloat flip = -1.0;
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    double theta = 2.0 * M_PI * (2.0f / 5);
    
    CGContextMoveToPoint(context, xCenter, starRadius * flip + yCenter);
    
    for (NSUInteger i = 1; i < 5; i++) {
        float x = starRadius * sin(i * theta);
        float y = starRadius * cos(i * theta);
        CGContextAddLineToPoint(context, x + xCenter, y * flip + yCenter);
    }
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // Circles
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(context, xCenter, starRadius * flip + yCenter);
    CGContextAddArc(context, xCenter, starRadius * flip + yCenter, VACircleRadius, 0, 2 * M_PI, 0);
    
    for (NSUInteger i = 1; i < 5; i++) {
        float x = starRadius * sin(i * theta);
        float y = starRadius * cos(i * theta);
        CGContextMoveToPoint(context, x + xCenter, y * flip + yCenter);
        CGContextAddArc(context, x + xCenter, y * flip + yCenter, VACircleRadius, 0, 2 * M_PI, 0);
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // Lines
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, xCenter, (starRadius + VACircleRadius) * flip + yCenter);
    
    for (NSUInteger i = 1; i < 5; i++) {
        float x = (starRadius + VACircleRadius) * sin(i * theta / 2);
        float y = (starRadius + VACircleRadius) * cos(i * theta / 2);
        CGContextAddLineToPoint(context, x + xCenter, y * flip + yCenter);
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

@end
