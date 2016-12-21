//
//  VADrawingView.m
//  24.UIViewDrawings
//
//  Created by Vladimir Ananko on 12/19/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "VADrawingView.h"

@implementation VADrawingView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect square1 = CGRectMake(50, 50, 50, 50);
    CGRect square2 = CGRectMake(100, 100, 50, 50);
    
    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextStrokePath(context);
    
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillPath(context);
    
    CGContextSetLineWidth(context, 1.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddLineToPoint(context, CGRectGetMinX(square2), CGRectGetMaxY(square2));
    CGContextStrokePath(context);
    
    CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1), M_PI_2, M_PI, 0);
    CGContextStrokePath(context);
    
    NSString *text = @"text";
    
    UIFont *font = [UIFont systemFontOfSize:14.f];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    shadow.shadowOffset = CGSizeMake(1.0, 1.0);
    shadow.shadowBlurRadius = 2.f;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, shadow, NSShadowAttributeName, nil];
    CGSize size = [text sizeWithAttributes:attributes];
    [text drawAtPoint:CGPointMake(CGRectGetMidX(square1) - size.width / 2,
                                  CGRectGetMidY(square1) - size.height / 2)
       withAttributes:attributes];
    
    
}

@end
