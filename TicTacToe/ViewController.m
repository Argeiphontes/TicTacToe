//
//  ViewController.m
//  TicTacToe
//
//  Created by Christopher on 10/2/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelThree;
@property (strong, nonatomic) IBOutlet UILabel *labelFour;
@property (strong, nonatomic) IBOutlet UILabel *labelFive;
@property (strong, nonatomic) IBOutlet UILabel *labelSix;
@property (strong, nonatomic) IBOutlet UILabel *labelSeven;
@property (strong, nonatomic) IBOutlet UILabel *labelEight;
@property (strong, nonatomic) IBOutlet UILabel *labelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findLabelUsing:(id)sender


//-(IBAction)onDrag:(UIPanGestureRecognizer *) panGesture {
//    CGPoint point = [panGesture locationInView:self.view];
//    self.theFuture.center = point;
//
//    if (panGesture.state == UIGestureRecognizerStateEnded) {
//        [UIView animateWithDuration:1.0 animations:^{
//            self.theFuture.center = self.originalCenter;
//            self.theFuture.backgroundColor = [UIColor greenColor];
//
//        }];
//    }
//
//    if (CGRectContainsPoint(self.thePreCogs.frame, point)) {
//        self.theFuture.backgroundColor = [UIColor orangeColor];
//        self.theFuture.text = @"A Fictitious and Incriminating Future";
//        [self.theFuture sizeToFit];
//    }
}


@end
