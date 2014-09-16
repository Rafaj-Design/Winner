//
//  ViewController.m
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIHomeViewController.h"
#import "RIMainController.h"


@interface RIHomeViewController ()

@property (nonatomic, readonly) RIMainController *mainController;

@end


@implementation RIHomeViewController


#pragma mark View lifecycle

- (void)loadView {
    [super loadView];
    
    _mainController = [[RIMainController alloc] init];
    [self setDataSource:_mainController];
    
    [self setDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Winner delegate methods

- (void)winnerViewController:(RIWinnerViewController *)controller didScrollToPageAtIndex:(NSInteger)index {
    
}


@end
