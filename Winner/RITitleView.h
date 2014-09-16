//
//  RITitleView.h
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RITitleView : UIScrollView

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, readonly) NSArray *titleLabels;

@property (nonatomic, strong) UIFont *titleFont; // Font for each title in the view
@property (nonatomic, strong) UIColor *titleColor; // Color for each title in the view

@property (nonatomic) CGFloat titleActiveAlpha; // Alpha of the active / selected title
@property (nonatomic) CGFloat titlePassiveAlpha; // Alpha of the passive / non-active title


@end
