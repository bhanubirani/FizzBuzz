//
//  FirstViewController.m
//  FizzBuzz
//
//  Created by Bhanu Birani on 02/07/15.
//  Copyright (c) 2015 Bhanu Birani. All rights reserved.
//

#import "FirstViewController.h"

#define WIDTH 50
#define HEIGHT 50

@interface FirstViewController () {
    UITapGestureRecognizer *tapGesture;
    NSMutableArray *viewArray;
    int viewTag;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    [self.view addGestureRecognizer:tapGesture];
    
    viewTag = 1;
    viewArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createOrReplaceViewAtLocaion:(CGPoint)location {
    
    if (viewArray.count >= 52) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Can not add any furhter boxes" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    BOOL didViewExistAtLocation = false;
    UIView *overlappingView;
    CGSize deviceSize = [UIScreen mainScreen].bounds.size;
    for (UIView *square in viewArray) {
        if (CGRectContainsPoint(square.frame, location)) {
            // Move the square next to the existing from right side of screen
            didViewExistAtLocation = YES;
            overlappingView = square;
            break;
        }
    }
    if (didViewExistAtLocation) {
        NSInteger row = (overlappingView.tag-1)*WIDTH+(overlappingView.tag-1)*10+10;
        NSInteger col = HEIGHT;
        if (row+WIDTH > deviceSize.width) {
            NSInteger factorCol = (viewArray.count/6 + 1);
            col = HEIGHT*factorCol + 10 *factorCol;
            NSInteger factorRow = (overlappingView.tag-1)%6;
            row = factorRow*WIDTH+factorRow*10+10;
        }
        [overlappingView setFrame:CGRectMake(row, col, WIDTH, HEIGHT)];
    }
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(location.x-WIDTH/2, location.y-HEIGHT/2, WIDTH, HEIGHT)];
    square.tag = viewTag;
    [square setBackgroundColor:[UIColor lightGrayColor]];
    [viewArray addObject:square];
    [self.view addSubview:square];
    viewTag++;
}

- (void)tapHandler:(UIGestureRecognizer *)sender {
    CGPoint targetPoint = [sender locationInView:self.view];
    [self createOrReplaceViewAtLocaion:targetPoint];
}


@end
