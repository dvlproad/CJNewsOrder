//
//  OrderButton.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderButton : UIButton

@property (nonatomic,retain) UIViewController *vc;
@property (nonatomic,retain) NSArray *channelNames;
@property (nonatomic,retain) NSArray *channelUrls;

- (void)setExtraPropert_VC:(UIViewController *)vc channelNames:(NSArray *)channelNames channelUrls:(NSArray *)channelUrls;

@end
