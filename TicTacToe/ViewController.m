//
//  ViewController.m
//  TicTacToe
//
//  Created by Christopher on 10/2/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"


// Ruggles Tic Tac Toe
@interface ViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelOne;
@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelThree;
@property (strong, nonatomic) IBOutlet UILabel *labelFour;
@property (strong, nonatomic) IBOutlet UILabel *labelFive;
@property (strong, nonatomic) IBOutlet UILabel *labelSix;
@property (strong, nonatomic) IBOutlet UILabel *labelSeven;
@property (strong, nonatomic) IBOutlet UILabel *labelEight;
@property (strong, nonatomic) IBOutlet UILabel *labelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;


@property NSString *lastMove;
@property NSArray *labelFrames;
@property NSArray *allLabels;
@property int timeAmount;
@property NSTimer *gameTimer;
@property CGPoint gamePieceOriginalCenter;
@property NSArray *columnsAndRows;
@property UILabel *humanMove;
@property UILabel *twoHumanMovesAgo;
@property int moveNumber;
@property CGRect originalPosition;

@end


// Ruggles Tic Tac Toe
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];

    self.labelFrames =  [NSArray arrayWithObjects: NSStringFromCGRect(self.labelOne.frame), NSStringFromCGRect(self.labelTwo.frame), NSStringFromCGRect([self.labelThree frame]), NSStringFromCGRect(self.labelFour.frame), NSStringFromCGRect(self.labelFive.frame), NSStringFromCGRect(self.labelSix.frame), NSStringFromCGRect(self.labelSeven.frame), NSStringFromCGRect(self.labelEight.frame), NSStringFromCGRect(self.labelNine.frame), nil];

    self.allLabels = [NSArray arrayWithObjects:self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];

    NSArray *rowOne = [NSArray arrayWithObjects:self.labelOne, self.labelTwo, self.labelThree, nil];
    NSArray *rowTwo = [NSArray arrayWithObjects:self.labelFour, self.labelFive, self.labelSix, nil];
    NSArray *rowThree = [NSArray arrayWithObjects:self.labelSeven, self.labelEight, self.labelNine, nil];
    NSArray *columnOne = [NSArray arrayWithObjects:self.labelOne, self.labelFour, self.labelSeven, nil];
    NSArray *columnTwo = [NSArray arrayWithObjects:self.labelTwo, self.labelFive, self.labelEight, nil];
    NSArray *columnThree = [NSArray arrayWithObjects:self.labelThree, self.labelSix, self.labelNine, nil];
    NSArray *diagonalLeft = [NSArray arrayWithObjects:self.labelOne, self.labelFive, self.labelNine, nil];
    NSArray *diagonalRight = [NSArray arrayWithObjects:self.labelThree, self.labelFive, self.labelSeven, nil];

    self.columnsAndRows = [NSArray arrayWithObjects:rowOne, rowTwo, rowThree, columnOne, columnTwo, columnThree, diagonalLeft, diagonalRight,  nil];

    self.gamePieceOriginalCenter = self.whichPlayerLabel.center;

}

// Deterimine where user taps
-(UILabel *)findLabelUsingPoint: (CGPoint)point {
    for (NSString *cgRect in self.labelFrames) {
        if(CGRectContainsPoint(CGRectFromString(cgRect), point)) {
            for (UILabel *label in self.allLabels) {
                if(CGRectEqualToRect([label frame], CGRectFromString(cgRect))) {
                    return label;  }
}
}
}
    return nil;
}
    

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)userTap {
    CGPoint point = [userTap locationInView:self.view];
    UILabel *tapInLabel = [self findLabelUsingPoint:point];
    if (tapInLabel) {
        tapInLabel.text = @"X";
        tapInLabel.textColor = [UIColor blueColor];
    }
}


//- (IBAction)onLabelTapped:(UITapGestureRecognizer *)userTap
//{
//    CGPoint point = [userTap locationInView:self.view];
//    UILabel *tapInLabel = [self findLabelUsingPoint:point];
//    if (tapInLabel) {
//        self.twoHumanMovesAgo = self.humanMove;
//        tapInLabel.text = @"X";
//        tapInLabel.textColor = [UIColor blueColor];
//        self.humanMove = tapInLabel;
//
//    }
//}




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



@end
