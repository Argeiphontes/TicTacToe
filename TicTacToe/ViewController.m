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
@property NSArray *allLabels;
@property int timeAmount;
@property NSTimer *gameTimer;
@property CGPoint gamePieceOriginalCenter;
@property NSArray *win;
@property CGRect originalPosition;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.whichPlayerLabel.text = @"Your turn X";
    self.whichPlayerLabel.textColor = [UIColor whiteColor];
    self.timerLabel.text = @"10";
    self.playerTurn = 0;

    self.allLabels = [NSArray arrayWithObjects:self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];

    NSArray *rowOne = @[self.labelOne, self.labelTwo, self.labelThree];
    NSArray *rowTwo = @[self.labelFour, self.labelFive, self.labelSix];
    NSArray *rowThree = @[self.labelSeven, self.labelEight, self.labelNine];
    NSArray *columnOne = @[self.labelOne, self.labelFour, self.labelSeven];
    NSArray *columnTwo = @[self.labelTwo, self.labelFive, self.labelEight];
    NSArray *columnThree = @[self.labelThree, self.labelSix, self.labelNine];
    NSArray *diagonalLeft = @[self.labelOne, self.labelFive, self.labelNine];
    NSArray *diagonalRight = @[self.labelThree, self.labelFive, self.labelSeven];

    self.win = @[rowOne, rowTwo, rowThree, columnOne, columnTwo, columnThree, diagonalLeft, diagonalRight];

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
    UILabel *theTappedLabelIfItExists = [self findLabelUsingPoint:point];
    if (theTappedLabelIfItExists) {
        // if there is an X or an O, then it's been tapped, if not, it's empty

        BOOL theLabelHasNotBeenTapped = [theTappedLabelIfItExists.text isEqualToString:@""];

        if (theLabelHasNotBeenTapped) {
            if (self.playerTurn == 0) {
                theTappedLabelIfItExists.text = @"X";
                theTappedLabelIfItExists.textColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"Your turn O";
            }
            else {
                theTappedLabelIfItExists.text = @"O";
                theTappedLabelIfItExists.textColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"Your turn X";
            }

            NSString *theWinner = [self whoWon];
            if ([theWinner isEqual:@"X won"]) {
                // show an alert view announcing the winner
                UIAlertView *alertView = [[UIAlertView alloc]init];
                alertView.delegate = self;
                alertView.title = @"X Wins!";
                [alertView addButtonWithTitle: @"Play Again"];
                [alertView show];
            }
            else if ([theWinner isEqual:@"O won"]) {
                UIAlertView *alertView = [[UIAlertView alloc]init];
                alertView.delegate = self;
                alertView.title = @"O Wins!";
                [alertView addButtonWithTitle: @"Play Again"];
                [alertView show];

            } else {
                self.playerTurn = !self.playerTurn;
            }
        }
    }
}

- (NSString *) whoWon {
    for (NSArray *labels in self.win) {

        NSArray *textValues = [labels valueForKey:@"text"];

        NSString *joinedValues = [textValues componentsJoinedByString:@""];
        if ([joinedValues  isEqual: @"XXX"])  {
            return @"X won";
        }

        if ([joinedValues isEqual:@"OOO"]) {
            return @"O won";
        }
    }
    return @"";
}

@end
