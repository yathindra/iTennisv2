//
//  iTennisViewController.h
//  iTennis
//
//  Created by u0736108 on 2/2/13.
//  Copyright (c) 2013 MGP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iTennisViewController : UIViewController {
    
    IBOutlet UIImageView *ball;
    IBOutlet UIImageView *racquet_yellow;    
    IBOutlet UIImageView *racquet_green;
    IBOutlet UILabel *taptobegin;
        
    IBOutlet UILabel *player_score;    
    IBOutlet UILabel *computer_score;
        
    CGPoint ballVelocity;    
    NSInteger gameState;
}

@property (retain, nonatomic) IBOutlet UIImageView *ball;
@property (retain, nonatomic) IBOutlet UIImageView *racquet_yellow;
@property (retain, nonatomic) IBOutlet UIImageView *racquet_green;
@property (retain, nonatomic) IBOutlet UILabel *taptobegin;

@property (retain, nonatomic) IBOutlet UILabel *player_score;
@property (retain, nonatomic) IBOutlet UILabel *computer_score;


@property (nonatomic) CGPoint ballVelocity;
@property (nonatomic) NSInteger gameState;


@end
