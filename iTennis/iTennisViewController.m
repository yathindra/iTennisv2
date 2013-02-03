//
//  iTennisViewController.m
//  iTennis
//
//  Created by u0736108 on 2/2/13.
//  Copyright (c) 2013 MGP. All rights reserved.
//

#import "iTennisViewController.h"

#define kGameStateRunning   1
#define kGameStatePaused    2

#define kBallSpeedX         10
#define kBallSpeedY         15


@implementation iTennisViewController
@synthesize ball, racquet_yellow, racquet_green, taptobegin, player_score, computer_score, gameState, ballVelocity;
 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.gameState = kGameStatePaused;
    ballVelocity = CGPointMake(kBallSpeedX, kBallSpeedY);
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(gameloop) userInfo:nil repeats:YES];
}

- (void)gameloop
{
    if (gameState == kGameStateRunning) {
        
        ball.center = CGPointMake(ball.çenter.x + ballVelocity.x, ball.center.y + ballVelocity.y);
        
        if (ball.center.x > self.view.bounds.size.width || ball.center.x  < 0) {
            ballVelocity.x = -ballVelocity.x;
        }
        
        if (ball.center.y > self.view.bounds.size.width || ball.center.y < 0) {          
            ballVelocity.y = -ballVelocity.y;
        }
    }
    else {
        if (taptobegin) {
            taptobegin.hidden = NO;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [Ball release];
    [racquet_yellow release];
    [racquet_green release];
    [taptobegin release];
    [player_score release];
    [computer_score release];
    [_ball release];
    [_racquet_yellow release];
    [_racquet_green release];
    [_taptobegin release];
    [_player_score release];
    [_computer_score release];
    [super dealloc];
}
@end
