//
//  RIWinnerViewController.h
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RITitleView.h"
#import "RITopView.h"
#import "RIWinnerViewControllerProtocol.h"


extern NSString *const RIWinnerViewControllerDataSourceProblem;


@interface RIWinnerViewController : UIViewController

@property (nonatomic, weak) id<RIWinnerViewControllerDataSource> dataSource;
@property (nonatomic, weak) id<RIWinnerViewControllerDelegate> delegate;

@property (nonatomic, readonly) RITopView *topView;
@property (nonatomic, readonly) RITitleView *titleView;

@property (nonatomic, readonly) UIScrollView *mainScrollView;

@property (nonatomic, readonly) NSInteger currentPageIndex;
@property (nonatomic, readonly) UIViewController *currentPageViewController;


@end
