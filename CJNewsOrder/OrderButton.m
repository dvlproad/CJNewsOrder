//
//  OrderButton.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import "OrderButton.h"
#import "OrderViewController.h"

#define KDefaultCountOfUpsideList 10    //默认订阅频道数


@implementation OrderButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setExtraPropert_VC:(UIViewController *)vc channelsAll:(NSArray *)channelsAll{
    [self setVc:vc];
    
    if (![ChannelFile isExist]) {
        NSMutableArray *array_order_YES_Ori = [NSMutableArray array]; //Origin
        NSMutableArray *array_order_NO_Ori = [NSMutableArray array];
        
        for (int i = 0; i < [channelsAll count]; i++) {
            TouchViewModel *channel = [channelsAll objectAtIndex:i];
            
            if (i < KDefaultCountOfUpsideList - 1) {
                [array_order_YES_Ori addObject:channel];
            }else{
                [array_order_NO_Ori addObject:channel];
            }
        }
        
        [ChannelFile saveChannels_Order_YES:array_order_YES_Ori];
        [ChannelFile saveChannels_Order_NO:array_order_NO_Ori];
    }
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
