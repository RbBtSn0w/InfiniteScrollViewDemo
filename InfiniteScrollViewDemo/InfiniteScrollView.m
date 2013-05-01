//
//  InfiniteScrollView.m
//  InfiniteScrollViewDemo
//
//  Created by Snow on 5/1/13.
//  Copyright (c) 2013 Snow. All rights reserved.
//

#import "InfiniteScrollView.h"

@implementation InfiniteScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.contentSize = CGSizeMake(5000, 500);
        
        [self setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)recenterIfNecessary{
    CGPoint currentOffset = [self contentOffset];
    CGFloat contentWidth = [self contentSize].width;
    CGFloat centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
    CGFloat distanceFromCenter = fabsf(currentOffset.x - centerOffsetX);
    
    if (distanceFromCenter > (contentWidth / 4.0)) {
        self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self recenterIfNecessary];
}

@end
