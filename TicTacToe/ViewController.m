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
@property BOOL playerTurn;
@property BOOL alreadyPlayed;
@property NSArray *validMove;


@property NSString *lastMove;
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
    self.timerLabel.text = @"10";
    self.playerTurn = 0;


    self.allLabels = [NSArray arrayWithObjects:self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];

    NSArray *validMove = [NSArray 0, 0, 0, 0, 0, 0, 0, 0, 0, nil];

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


-(UILabel *)findLabelUsingPoint: (CGPoint)point {
    for (UILabel *label in self.allLabels) {
        if(CGRectContainsPoint(label.frame, point)) {
            return label;
        }
    }
    return nil;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)userTap {
    CGPoint point = [userTap locationInView:self.view];
    UILabel *tappedLabel = [self findLabelUsingPoint:point];
    if (tappedLabel) {
        if (self.tappedlabel [tag] == 0) {
            if (self.playerTurn == 0) {
                tappedLabel.text = @"X";
                tappedLabel.textColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"Your turn O";
            }
            else {
                tappedLabel.text = @"O";
                tappedLabel.textColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"Your turn X";
            }
            self.playerTurn = !self.playerTurn;
            self.validMove[] = 1;
            
        }
    }
}

@end
