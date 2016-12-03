//
//  ViewController.m
//  20.Outlets
//
//  Created by Vladimir Ananko on 12/2/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *squaresArray;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *checkerViewsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
        UIColor *backgroundColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
        
        for (UIView *view in self.squaresArray) {
            view.backgroundColor = backgroundColor;
        }
        [self mixCheckers];
}

- (void)mixCheckers {
    for (UIView *view in self.checkerViewsArray) {
        NSInteger newIndex = arc4random() % (self.checkerViewsArray.count);
        UIView *indexView = self.checkerViewsArray[newIndex];
        
        CGRect tempFrame = view.frame;
        UIColor *tempColor = view.backgroundColor;
        
        view.frame = indexView.frame;
        view.backgroundColor = indexView.backgroundColor;
        
        indexView.frame = tempFrame;
        indexView.backgroundColor = tempColor;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
