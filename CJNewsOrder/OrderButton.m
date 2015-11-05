//
//  OrderButton.m
//  ifengNewsOrderDemo
//
//  Created by zer0 on 14-2-27.
//  Copyright (c) 2014年 zer0. All rights reserved.
//

#import "OrderButton.h"
#import "OrderViewController.h"


@implementation OrderButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setExtraPropert_VC:(UIViewController *)vc channelNames:(NSArray *)channelNames channelUrls:(NSArray *)channelUrls{
    [self setVc:vc];
    [self setChannelNames:channelNames];
    [self setChannelUrls:channelUrls];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
