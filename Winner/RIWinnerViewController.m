//
//  RIWinnerViewController.m
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIWinnerViewController.h"


NSString *const RIWinnerViewControllerDataSourceProblem = @"TOWinnerViewControllerDataSourceProblem";


@interface RIWinnerViewController () <UIScrollViewDelegate>

@end


@implementation RIWinnerViewController


#pragma mark Configuring view

- (void)configureView {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark Creating elements

- (void)createTopBar {
    _topView = [[RITopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    [self.view addSubview:_topView];
}

- (void)createTitleBar {
    _titleView = [[RITitleView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 40)];
    [self.view addSubview:_titleView];
}

- (void)createMainScrollView {
    _currentPageIndex = 0;
    
    CGFloat topHeight = (_topView.frame.size.height + _titleView.frame.size.height);
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topHeight, self.view.frame.size.width, (self.view.frame.size.height - topHeight))];
    [_mainScrollView setPagingEnabled:YES];
    //[_mainScrollView setShowsHorizontalScrollIndicator:NO];
    [_mainScrollView setDelegate:self];
    [self.view addSubview:_mainScrollView];
}

- (void)addPageWithIndex:(NSInteger)index toPosition:(NSInteger)position {
    UIViewController *page = [self pageViewControllerForIndex:index];
    CGRect r = _mainScrollView.bounds;
    r.origin.x = (position * r.size.width);
    [page.view setFrame:r];
    [_mainScrollView addSubview:page.view];
    [page didMoveToParentViewController:self];
    [self addChildViewController:page];
}

- (void)reloadViews {
    NSInteger numberOfPages = [self numberOfPages];
    CGFloat width = (self.view.frame.size.width * numberOfPages);
    if (numberOfPages == 0) width = (self.view.frame.size.width + 1);
    [_mainScrollView setContentSize:CGSizeMake(width, _mainScrollView.frame.size.height)];
    if (numberOfPages > 0) {
        // Load titles
        NSMutableArray *titles = [NSMutableArray array];
        for (int i = 0; i < numberOfPages; i++) {
            [titles addObject:[self pageTitleForIndex:i]];
        }
        [_titleView setTitles:[titles copy]];
        
        // Load pages
        for (int i = 0; i < numberOfPages; i++) {
            [self addPageWithIndex:i toPosition:i];
        }
    }
}

#pragma mark Datasource handlers

- (NSInteger)numberOfPages {
    if ([_dataSource respondsToSelector:@selector(numberOfPagesForWinnerViewController:)]) {
        return [_dataSource numberOfPagesForWinnerViewController:self];
    }
    else return 0;
}

- (NSString *)pageTitleForIndex:(NSInteger)index {
    if ([_dataSource respondsToSelector:@selector(winnerViewController:titleForPageAtIndex:)]) {
        NSString *title = [_dataSource winnerViewController:self titleForPageAtIndex:index];
        if (!title) {
            [self throwExceptionWithName:RIWinnerViewControllerDataSourceProblem andErrorMessage:[NSString stringWithFormat:@"Title at index %ld can not be nil!", index]];
        }
        return title;
    }
    else {
        [self throwExceptionWithName:RIWinnerViewControllerDataSourceProblem andErrorMessage:@"Method winnerViewController:titleForPageAtIndex: needs to be implemented."];
        return nil;
    }
}

- (UIViewController *)pageViewControllerForIndex:(NSInteger)index {
    if ([_dataSource respondsToSelector:@selector(winnerViewController:viewControllerForPageAtIndex:)]) {
        UIViewController *page = [_dataSource winnerViewController:self viewControllerForPageAtIndex:index];
        if (!page) {
            [self throwExceptionWithName:RIWinnerViewControllerDataSourceProblem andErrorMessage:[NSString stringWithFormat:@"Page at index %ld can not be nil!", index]];
        }
        return page;
    }
    else {
        [self throwExceptionWithName:RIWinnerViewControllerDataSourceProblem andErrorMessage:@"winnerViewController:viewControllerForPageAtIndex: needs to be implemented."];
        return nil;
    }
}

#pragma mark Settings

- (void)setDataSource:(id<RIWinnerViewControllerDataSource>)dataSource {
    _dataSource = dataSource;
    [self reloadViews];
}

#pragma mark View lifecycle

- (void)loadView {
    [super loadView];
    
    [self createTopBar];
    [self createTitleBar];
    [self createMainScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

#pragma mark Memory handling

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if ([_dataSource respondsToSelector:@selector(handleMemoryWarningForController:)]) {
        [_dataSource handleMemoryWarningForController:self];
    }
}

- (void)throwExceptionWithName:(NSString *)name andErrorMessage:(NSString *)message {
    NSException *exception = [NSException exceptionWithName:name reason:message userInfo:nil];
    @throw exception;
}

#pragma mark Scrolling calculations

- (void)updateCurrentPageIndex {
    _currentPageIndex = (_mainScrollView.contentOffset.x / _mainScrollView.frame.size.width);
}

#pragma mark Scroll view delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self updateCurrentPageIndex];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateCurrentPageIndex];
}


@end
