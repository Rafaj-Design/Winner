//
//  RIMainController.m
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIMainController.h"
#import "RIPageViewController.h"


@implementation RIMainController


#pragma mark Data

- (NSArray *)data {
    return @[@"newsfeed", @"profiles", @"messages", @"favourites", @"visitors", @"calendar", @"galleries", @"edit profile"];
}

#pragma mark Winner data source methods

- (NSInteger)numberOfPagesForWinnerViewController:(RIWinnerViewController *)controller {
    return [self data].count;
}

- (NSString *)winnerViewController:(RIWinnerViewController *)controller titleForPageAtIndex:(NSInteger)index {
    return [self data][index];
}

- (UIViewController *)winnerViewController:(RIWinnerViewController *)controller viewControllerForPageAtIndex:(NSInteger)index {
    return [[RIPageViewController alloc] init];
}

#pragma mark Memory management

- (void)handleMemoryWarningForController:(RIWinnerViewController *)controller {
    
}


@end
