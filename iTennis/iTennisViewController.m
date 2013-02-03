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

#define kCompMoveSpeed      15

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
        
        ball.center = CGPointMake(ball.center.x + ballVelocity.x, ball.center.y + ballVelocity.y);
        
        // Ball bounce
        if (ball.center.x > self.view.bounds.size.width || ball.center.x  < 0) {
            ballVelocity.x = -ballVelocity.x;
        }
        
        if (ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
            ballVelocity.y = -ballVelocity.y;
        }
        
        // Collision detection
        if (CGRectIntersectsRect(ball.frame, racquet_yellow.frame)) {
            if (ball.center.y < racquet_yellow.center.y) {
                ballVelocity.y = -ballVelocity.y;            
            }
        }
        if (CGRectIntersectsRect(ball.frame, racquet_green.frame)) {
            if (ball.center.y > racquet_green.center.y) {
                ballVelocity.y = -ballVelocity.y;
            }
        }
        
        // Begin Simple AI
        if (ball.center.y <= self.view.center.y) {
            if (ball.center.x < racquet_green.center.x) {
                CGPoint complocation = CGPointMake(racquet_green.center.x - kCompMoveSpeed,
                                                   racquet_green.center.y);
                racquet_green.center = complocation;
            }
            if (ball.center.x > racquet_green.center.x) {
                CGPoint complocation = CGPointMake(racquet_green.center.x + kCompMoveSpeed,
                                                   racquet_green.center.y);
                racquet_green.center = complocation;
            }
        }
    }
    else {
        if (taptobegin) {
            taptobegin.hidden = NO;
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (gameState == kGameStatePaused) {
        taptobegin.hidden = YES;
        gameState = kGameStateRunning;
    } else if (gameState == kGameStateRunning) {
        [self touchesMoved:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    CGPoint xlocation = CGPointMake(location.x, racquet_yellow.center.y);
    racquet_yellow.center = xlocation;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
    [ball release];
    [racquet_yellow release];
    [racquet_green release];
    [taptobegin release];
    [player_score release];
    [computer_score release];
    [taptobegin release];
}
@end
