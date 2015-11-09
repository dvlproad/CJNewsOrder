//
//  OrderButton.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChannelFile.h"
#import "TouchViewModel.h"
@interface OrderButton : UIButton

@property (nonatomic,retain) UIViewController *vc;

- (void)setExtraPropert_VC:(UIViewController *)vc channelsAll:(NSArray *)channelsAll;


@end
