//
//  RIWinnerViewControllerProtocol.h
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//


@class RIWinnerViewController, UIViewController;

@protocol RIWinnerViewControllerDataSource <NSObject>

@required
- (NSInteger)numberOfPagesForWinnerViewController:(RIWinnerViewController *)controller;
- (NSString *)winnerViewController:(RIWinnerViewController *)controller titleForPageAtIndex:(NSInteger)index;
- (UIViewController *)winnerViewController:(RIWinnerViewController *)controller viewControllerForPageAtIndex:(NSInteger)index;

@optional
- (void)handleMemoryWarningForController:(RIWinnerViewController *)controller;

@end


@protocol RIWinnerViewControllerDelegate <NSObject>

@optional
- (void)winnerViewController:(RIWinnerViewController *)controller didScrollToPageAtIndex:(NSInteger)index;

@end


