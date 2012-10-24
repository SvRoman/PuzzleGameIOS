//
//  MDHViewController.m
//  PuzzlesGame
//
//  Created by Roman Svarychevskyi on 24.10.2012.
//  Copyright (c) 2012 Roman Svarychevskyi. All rights reserved.
//

#import "MDHViewController.h"
#import "GameModel.h"

#import <QuartzCore/QuartzCore.h>

@interface MDHViewController ()

@end

@implementation MDHViewController {
    UIImageView *puzzlesBundle;
    GameModel *gameModel;
}

-(void)loadView {
    [super loadView];
    puzzlesBundle = [[UIImageView alloc] init];
    gameModel = [[GameModel alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *image = [UIImage imageNamed:@"kot_fg"];
    [puzzlesBundle setImage:image];
    [puzzlesBundle setFrame:CGRectMake(50.0f, 20.0f, image.size.width, image.size.height)];
    [puzzlesBundle setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:puzzlesBundle];
    
    /*for (NSUInteger i = 0; i < 4; i++) {
        UILabel *label = [[UILabel alloc] init];
        [label setFrame:[[gameModel.coordinatesArray objectAtIndex:i] CGRectValue]];
        [label.layer setBorderColor:[UIColor blackColor].CGColor];
        [label.layer setBorderWidth:3.0f];
        [label setBackgroundColor:[UIColor clearColor]];
        [puzzlesBundle addSubview:label];
    } */
    
    for (NSUInteger i = 0; i < 4; i++) {
        UIImage *puzzleImage = [gameModel.puzzlesArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:puzzleImage];
        [imageView setFrame:CGRectMake(arc4random() % 250, arc4random() % 200, puzzleImage.size.width, puzzleImage.size.height)];
        [imageView setBackgroundColor:[UIColor clearColor]];
        [imageView setTag:i];
        [imageView setUserInteractionEnabled:YES];
        
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [imageView addGestureRecognizer:gesture];
        
        [self.view addSubview:imageView];
    }
}

-(void)handlePanGesture:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.view bringSubviewToFront:gesture.view];
    }
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint dragPoint = [gesture locationInView:self.view];
        [gesture.view setFrame:CGRectMake(dragPoint.x - gesture.view.frame.size.width/2, dragPoint.y - gesture.view.frame.size.height/2, gesture.view.frame.size.width, gesture.view.frame.size.height)];
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        UIImageView *imageView = (UIImageView *)gesture.view;
        CGRect checkRect = [[gameModel.coordinatesArray objectAtIndex:imageView.tag] CGRectValue];

        if (CGRectContainsPoint(checkRect, [self.view convertPoint:gesture.view.center toView:puzzlesBundle])) {
            [gesture.view setCenter:CGPointMake(checkRect.origin.x + checkRect.size.width/2+50.0f, checkRect.origin.y + checkRect.size.height / 2)];
            [gesture.view setUserInteractionEnabled:NO];
            gameModel.puzzlesCount++;
        }
        
        if (gameModel.puzzlesCount == 4) {
            NSLog(@"пазл сложеный");
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
