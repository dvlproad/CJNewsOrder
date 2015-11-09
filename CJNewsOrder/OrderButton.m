//
//  OrderButton.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
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
