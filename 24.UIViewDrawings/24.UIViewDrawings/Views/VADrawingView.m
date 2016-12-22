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

@implementation VADrawingView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
// Beginner
    [self drawStarWithCenter:CGPointMake(100.0f, 100.0f) andSize:100.0f];

// Student
    NSMutableArray *rectsArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        CGFloat starSize = arc4random() % 30 + 20;
        CGFloat xCenter = arc4random() % (NSInteger)(CGRectGetWidth(rect) - starSize) + starSize / 2;
        CGFloat yCenter = arc4random() % (NSInteger)(CGRectGetHeight(rect) - starSize) + starSize / 2;
        CGRect starRect = CGRectMake(xCenter - starSize / 2, yCenter - starSize / 2, starSize, starSize);
        
    }

}

- (void)drawStarWithCenter:(CGPoint)center andSize:(CGFloat)size {
    // Star
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = center.x;
    CGFloat yCenter = center.y;
    
    double starRadius = size / 2.0f;
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
    CGFloat circleRadius = 10.0f;
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(context, xCenter, starRadius * flip + yCenter);
    CGContextAddArc(context, xCenter, starRadius * flip + yCenter, circleRadius, 0, 2 * M_PI, 0);
    
    for (NSUInteger i = 1; i < 5; i++) {
        float x = starRadius * sin(i * theta);
        float y = starRadius * cos(i * theta);
        CGContextMoveToPoint(context, x + xCenter, y * flip + yCenter);
        CGContextAddArc(context, x + xCenter, y * flip + yCenter, circleRadius, 0, 2 * M_PI, 0);
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // Lines
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, xCenter, (starRadius + circleRadius) * flip + yCenter);
    
    for (NSUInteger i = 1; i < 5; i++) {
        float x = (starRadius + circleRadius) * sin(i * theta / 2);
        float y = (starRadius + circleRadius) * cos(i * theta / 2);
        CGContextAddLineToPoint(context, x + xCenter, y * flip + yCenter);
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);

}



@end
