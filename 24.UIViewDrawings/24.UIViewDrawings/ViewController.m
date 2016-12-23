//
//  ViewController.m
//  24.UIViewDrawings
//
//  Created by Vladimir Ananko on 12/19/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "ViewController.h"

#import "VADrawingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VADrawingView *drawingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.drawingView setNeedsDisplay];
}

@end
