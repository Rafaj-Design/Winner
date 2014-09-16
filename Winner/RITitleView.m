//
//  RITitleView.m
//  Winner
//
//  Created by Ondrej Rafaj on 16/09/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RITitleView.h"


#define kRITitleViewTitleSpacing                    20


@implementation RITitleView


#pragma mark Creating elements

- (UILabel *)titleLabel:(NSString *)title atXpos:(CGFloat)xPos {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(xPos, 0, 30, 30)];
    [label setText:title];
    [label setFont:_titleFont];
    [label setTextColor:_titleColor];
    [label setAlpha:_titlePassiveAlpha];
    [label sizeToFit];
    return label;
}

#pragma mark Settings

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    NSMutableArray *titleLabels = [NSMutableArray array];
    CGFloat xPos = kRITitleViewTitleSpacing;
    int x = 0;
    for (NSString *title in _titles) {
        UILabel *label = [self titleLabel:title atXpos:xPos];
        [titleLabels addObject:label];
        [self addSubview:label];
        if (x == 0) {
            [label setAlpha:_titleActiveAlpha];
        }
        x++;
        xPos += (label.frame.size.width + kRITitleViewTitleSpacing);
    }
    [self setContentSize:CGSizeMake(xPos, self.frame.size.height)];
    _titleLabels = [titleLabels copy];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (_titleLabels && (_titleLabels.count > 0)) {
        CGFloat xPos = kRITitleViewTitleSpacing;
        for (UILabel *label in _titleLabels) {
            [label setFont:titleFont];
            [label sizeToFit];
            xPos += (label.frame.size.width + kRITitleViewTitleSpacing);
            CGRect r = label.frame;
            r.origin.x = xPos;
            [label setFrame:r];
        }
        [self setContentSize:CGSizeMake(xPos, self.frame.size.height)];
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (_titleLabels && (_titleLabels.count > 0)) {
        for (UILabel *label in _titleLabels) {
            [label setTextColor:_titleColor];
        }
    }
}

#pragma mark Initialization

- (void)setup {
    _titleFont = [UIFont systemFontOfSize:30];
    _titleColor = [UIColor colorWithRed:0 green:(175.0f/255.0f) blue:(240.0f/255.0f) alpha:1];
    
    _titleActiveAlpha = 1.0f;
    _titlePassiveAlpha = 0.4f;
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self setScrollEnabled:NO];
    [self setShowsHorizontalScrollIndicator:NO];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


@end
